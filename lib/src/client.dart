part of '../tg.dart';

class Client {
  Client({
    required this.apiId,
    required this.receiver,
    required this.sender,
    required this.obfuscation,
    //required this.sessionStore,
  }) {
    receiver.listen(_readFrame);
  }

  /// API Id.
  final int apiId;
  final Obfuscation? obfuscation;
  final Stream<Uint8List> receiver;
  final Sink<List<int>> sender;
  //final SessionStore sessionStore;

  DCSession? _dcSession;
  DCSession get dcSession {
    final x = _dcSession ??= DCSession(id: 10);

    return x;
  }

  final Map<int, Completer<TlObject>> _pending = {};
  final Map<String, Completer<TlObject>> _dicResPQ = {};
  final Map<String, Completer<TlObject>> _dicReqDHParams = {};

  final Map<String, Completer<TlObject>> _reqSetClientDHParams = {};
  // final List<int> _msgsToAck = [];
  // MsgsAck? _checkMsgsToAck() {
  //   if (_msgsToAck.isEmpty) {
  //     return null;
  //   }

  //   final msgsAck = MsgsAck(msgIds: [..._msgsToAck]);
  //   _msgsToAck.clear();
  //   return msgsAck;
  // }

  final _read = <int>[];

  void _readFrame(Uint8List l) {
    _read.addAll(l);
    if (l.length < 4) {
      return;
    }

    final temp = _read.take(4).toList();

    obfuscation?.recv.encryptDecrypt(temp, 4);

    final length =
        Uint8List.fromList(temp).buffer.asByteData().getInt32(0, Endian.little);

    if (l.length < length + 4) {
      return;
    }

    final buffer = Uint8List.fromList(_read.skip(4).take(length).toList());
    _read.removeRange(0, length + 4);

    final frame = Frame.parse(buffer, obfuscation);

    final msg = frame.message;

    if (msg is RpcResult) {
      final reqMsgId = msg.reqMsgId;

      final task = _pending[reqMsgId];
      task?.complete(msg.result);
      _pending.remove(reqMsgId);
    } else if (msg is ResPQ) {
      final key = msg.nonce.toString();

      final task = _dicResPQ[key];
      task?.complete(msg);
      _dicResPQ.remove(key);
    } else if (msg is ServerDHParamsOk) {
      final key = '${msg.nonce}-${msg.serverNonce}';

      final task = _dicReqDHParams[key];
      task?.complete(msg);
      _dicReqDHParams.remove(key);
    } else if (msg is DhGenOk) {
      final key = '${msg.nonce}-${msg.serverNonce}';

      final task = _reqSetClientDHParams[key];
      task?.complete(msg);
      _reqSetClientDHParams.remove(key);
    }
  }

  Future<ResPQ> reqPqMulti([Int128? nonce]) async {
    nonce ??= Int128.random();
    final resPQ = await send<ResPQ>(ReqPqMulti(nonce: nonce), false);

    return resPQ;
  }

  Future<SetClientDHParamsAnswerBase> setClientDHParams(
      ResPQ resPQ, BigInt gB, int retryId, AesKeyIV keys) async {
    final clientDHinnerData = ClientDHInnerData(
      nonce: resPQ.nonce,
      serverNonce: resPQ.serverNonce,
      retryId: retryId,
      gB: gB.toBytes(Endian.big),
    );

    Uint8List encryptedData;
    {
      final messageBuffer = <int>[];
      messageBuffer.writeObject(clientDHinnerData);
      final totalLength = messageBuffer.length + 20;
      final paddingToAdd = (0x7FFFFFF0 - totalLength) % 16;
      final padding = Uint8List(paddingToAdd);
      _rng.getBytes(padding);

      final messageHash = sha1.convert(messageBuffer).bytes;

      final clearStream = [...messageHash, ...messageBuffer, ...padding];
      encryptedData = _aesIgeEncryptDecrypt(
        Uint8List.fromList(clearStream),
        keys,
        true,
      );
    }

    final setClientDHParams = SetClientDHParams(
      nonce: resPQ.nonce,
      serverNonce: resPQ.serverNonce,
      encryptedData: encryptedData,
    );

    final answer = send<SetClientDHParamsAnswerBase>(setClientDHParams, false);

    return answer;
  }

  Future<ServerDHParamsOk> reqDHParams(
    ResPQ resPQ,
    Int256 newNonce, {
    int? dc,
  }) async {
    final fingerprint = resPQ.serverPublicKeyFingerprints
        .firstWhere((x) => rsaKeys[x] != null, orElse: () => 0);

    final publicKey = rsaKeys[fingerprint]!;
    final n = _bigEndianInteger(publicKey.n);
    final e = _bigEndianInteger(publicKey.e);

    final pq = resPQ.pq.buffer.asByteData().getUint64(0, Endian.big);
    final p = _pqFactorize(pq);
    final q = pq ~/ p;

    final pqInnerData = PQInnerDataDc(
      pq: resPQ.pq,
      p: _int64ToBigEndian(p),
      q: _int64ToBigEndian(q),
      nonce: resPQ.nonce,
      serverNonce: resPQ.serverNonce,
      newNonce: newNonce,
      dc: dc ?? 0,
    );

    Uint8List? encryptedData;
    do {
      final clearBuffer = Uint8List(256);

      final aesKey = Uint8List(32);
      final zeroIV = Uint8List(32);

      _rng.getBytes(aesKey);
      clearBuffer.setRange(0, 32, aesKey);

      final msg = <int>[];
      msg.writeObject(pqInnerData);
      clearBuffer.setRange(32, 32 + msg.length, msg);

      // length before padding
      final clearLength = msg.length;

      _rng.getBytes(
        clearBuffer,
        clearLength + 32,
        192 - clearLength,
      );

      final hash = sha256.convert(clearBuffer.take(192 + 32).toList());
      clearBuffer.setRange(192 + 32, 192 + 32 + hash.bytes.length, hash.bytes);
      clearBuffer.reverse(32, 192);

      final aesEncrypted = _aesIgeEncryptDecrypt(
        Uint8List.fromList(clearBuffer.skip(32).take(224).toList()),
        AesKeyIV(aesKey, zeroIV),
        true,
      );

      final hashAes = sha256.convert(aesEncrypted).bytes;

      for (int i = 0; i < 32; i++) // prefix aes_encrypted with temp_key_xor
      {
        clearBuffer[i] = (aesKey[i] ^ hashAes[i]) % 256;
      }

      clearBuffer.setRange(32, 256, aesEncrypted);

      final x = _bigEndianInteger(clearBuffer);

      if (x < n) // if good result, encrypt with RSA key:
      {
        final mp = x.modPow(e, n);
        encryptedData = mp.toBytes(Endian.big);
      }
    } while (encryptedData == null);

    final reqDHParams = ReqDHParams(
      p: _int64ToBigEndian(p),
      q: _int64ToBigEndian(q),
      nonce: resPQ.nonce,
      serverNonce: resPQ.serverNonce,
      encryptedData: encryptedData,
      publicKeyFingerprint: fingerprint,
    );

    final serverDHparams = await send<ServerDHParamsOk>(reqDHParams, false);

    return serverDHparams;
  }

  Future<AuthKey> createAuthenticationKey(
    ResPQ resPQ,
    ServerDHParamsOk serverDHparams,
    Int256 newNonce, {
    int? dc,
  }) async {
    final pq = resPQ.pq.buffer.asByteData().getUint64(0, Endian.big);
    final p = _pqFactorize(pq);
    final q = pq ~/ p;

    final pqInnerData = PQInnerDataDc(
      pq: resPQ.pq,
      p: _int64ToBigEndian(p),
      q: _int64ToBigEndian(q),
      nonce: resPQ.nonce,
      serverNonce: resPQ.serverNonce,
      newNonce: newNonce,
      dc: dc ?? 0,
    );

    final keys = _constructTmpAESKeyIV(resPQ.serverNonce, pqInnerData.newNonce);
    final answer = _aesIgeEncryptDecrypt(
      serverDHparams.encryptedAnswer,
      keys,
      false,
    );

    final answerReader = BinaryReader(answer);
    final answerHash = answerReader.readRawBytes(20);
    final answerObj = answerReader.readObject();

    if (answerObj is! ServerDHInnerData) {
      throw Exception('ServerDHInnerData expected.');
    }

    final paddingLength = answer.length - answerReader.position;
    final hash = sha1.convert(
        answer.skip(20).take(answer.length - paddingLength - 20).toList());

    print('${_hex(answerHash)} == ${_hex(hash.bytes)}');

    final gA = _bigEndianInteger(answerObj.gA);
    final dhPrime = _bigEndianInteger(answerObj.dhPrime);

    _checkGoodPrime(dhPrime, answerObj.g);

    dcSession.lastSentMsgId = 0;
    //dcSession.serverTicksOffset = (answerObj.serverTime - localTime).Ticks;

    final salt = Uint8List(256);
    _rng.getBytes(salt);
    final b = _bigEndianInteger(salt);

    final gB = BigInt.from(answerObj.g).modPow(b, dhPrime);
    _checkGoodGaAndGb(gA, dhPrime);
    _checkGoodGaAndGb(gB, dhPrime);

    var retryId = 0;
    final setClientDHparamsAnswer = await setClientDHParams(
      resPQ,
      gB,
      retryId,
      keys,
    );

    //7)
    final gab = gA.modPow(b, dhPrime);
    final authKey = gab.toBytes(Endian.big);
    //8)
    final authKeyHash = sha1.convert(authKey).bytes;
    // (auth_key_aux_hash)
    retryId = BinaryReader(Uint8List.fromList(authKeyHash)).readInt64(false);
    //9)
    // if (setClientDHparamsAnswer is not DhGenOk dhGenOk) throw new WTException("not dh_gen_ok");
    // if (dhGenOk.nonce != nonce) throw new WTException("Nonce mismatch");
    // if (dhGenOk.server_nonce != resPQ.server_nonce) throw new WTException("Server Nonce mismatch");

    final expectedNewNonceN = [
      ...pqInnerData.newNonce.data,
      1,
      ...authKeyHash.take(8),
    ];

    final expectedNewNonceNHash = sha1.convert(expectedNewNonceN).bytes;

    if (setClientDHparamsAnswer is DhGenOk) {
      print(
          '0x${_hex(expectedNewNonceNHash.skip(4))} == ${setClientDHparamsAnswer.newNonceHash1}');
    }

    // if (!Enumerable.SequenceEqual(dhGenOk.new_nonce_hash1.raw, sha1.ComputeHash(expected_new_nonceN).Skip(4)))
    //     throw new WTException("setClientDHparamsAnswer.new_nonce_hashN mismatch");

    final authKeyID =
        BinaryReader(Uint8List.fromList(authKeyHash.skip(12).toList()))
            .readInt64(false);

    final saltLeft = BinaryReader(Uint8List.fromList(pqInnerData.newNonce.data))
        .readInt64(false);

    final saltRight = BinaryReader(Uint8List.fromList(resPQ.serverNonce.data))
        .readInt64(false);

    final au = AuthKey._(authKeyID, authKey, saltLeft ^ saltRight);

    return au;
  }

  Future<T> send<T extends TlObject>(
    TlObject msg,
    bool preferEncryption,
  ) async {
    final completer = Completer<T>();
    final m = _newMessageId(false);

    if (msg is ReqPqMulti) {
      final key = msg.nonce.toString();
      _dicResPQ[key] = completer;
    } else if (msg is ReqDHParams) {
      final key = '${msg.nonce}-${msg.serverNonce}';
      _dicReqDHParams[key] = completer;
    } else if (msg is SetClientDHParams) {
      final key = '${msg.nonce}-${msg.serverNonce}';
      _reqSetClientDHParams[key] = completer;
    } else {
      _pending[m.msgId] = completer;
    }

    final frame = Frame(msg, m.msgId, 0);
    sender.add(frame.toUint8List(obfuscation));
    return completer.future;
  }

  _MessageIdSeq _newMessageId(bool preferEncryption) {
    var msgId = DateTime.now().toUtc().ticks +
        dcSession.serverTicksOffset -
        621355968000000000;
    msgId = msgId * 428 +
        (msgId >> 24) *
            25110956; // approximately unixtime*2^32 and divisible by 4

    if (msgId <= dcSession.lastSentMsgId) {
      msgId = dcSession.lastSentMsgId += 4;
    } else {
      dcSession.lastSentMsgId = msgId;
    }

    final seqno =
        preferEncryption ? dcSession.seqno++ * 2 + 1 : dcSession.seqno * 2;

    return _MessageIdSeq(msgId, seqno);
  }

  Future<X> invokeWithLayer<X>(int layer, TlMethod<X> query) =>
      send(InvokeWithLayer<X>(layer: layer, query: query), true);
}

class _MessageIdSeq {
  const _MessageIdSeq(this.msgId, this.seqno);
  final int msgId;
  final int seqno;
}
