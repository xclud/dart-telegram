part of '../tg.dart';

class Client {
  Client({
    required this.apiId,
    required this.apiHash,
    required this.receiver,
    required this.sender,
    required this.obfuscation,
    //required this.sessionStore,
  }) {
    auth = ClientAuth._(this);
    connection = ClientConnection._(this);
    account = ClientAccount._(this);

    receiver.listen(_readFrame);
  }

  /// API Id.
  final int apiId;

  /// API Hash.
  final String apiHash;

  final Obfuscation? obfuscation;
  final Stream<Uint8List> receiver;
  final Sink<List<int>> sender;
  //final SessionStore sessionStore;

  late final ClientAuth auth;
  late final ClientConnection connection;
  late final ClientAccount account;

  final Set<int> _msgsToAck = {};

  DCSession? _dcSession;
  AuthKey _authKey = AuthKey.empty();

  DCSession get dcSession {
    final x = _dcSession ??= DCSession(id: 10);

    return x;
  }

  final Map<int, Completer<Result>> _pending = {};
  final Map<String, Completer<Result>> _dicResPQ = {};
  final Map<String, Completer<Result>> _dicReqDHParams = {};

  final Map<String, Completer<Result>> _reqSetClientDHParams = {};
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
  final _updateStreamController = StreamController<UpdatesBase>.broadcast();

  Stream<UpdatesBase> get updates => _updateStreamController.stream;

  void _handleIncomingMessage(TlObject msg) {
    if (msg is UpdatesBase) {
      _updateStreamController.add(msg);
    }

    //
    if (msg is MsgContainer) {
      for (final message in msg.messages) {
        _handleIncomingMessage(message);
      }

      return;
    } else if (msg is Msg) {
      _handleIncomingMessage(msg.body);
      return;
    } else if (msg is BadMsgNotification) {
      final badMsgId = msg.badMsgId;
      final task = _pending[badMsgId];
      task?.completeError(BadMessageException._(msg));
      _pending.remove(badMsgId);
    } else if (msg is RpcResult) {
      final reqMsgId = msg.reqMsgId;
      final task = _pending[reqMsgId];

      final result = msg.result;

      if (result is RpcError) {
        task?.complete(Result._(null, result));
        _pending.remove(reqMsgId);
        return;
      } else if (result is GzipPacked) {
        final gZippedData = GZipDecoder().decodeBytes(result.packedData);

        final newObj =
            BinaryReader(Uint8List.fromList(gZippedData)).readObject();

        final newRpcResult = RpcResult(reqMsgId: reqMsgId, result: newObj);
        _handleIncomingMessage(newRpcResult);
        return;
      }

      task?.complete(Result._(msg.result, null));
      _pending.remove(reqMsgId);
    } else if (msg is ResPQ) {
      final key = msg.nonce.toString();

      final task = _dicResPQ[key];
      task?.complete(Result._(msg, null));
      _dicResPQ.remove(key);
    } else if (msg is ServerDHParamsOk) {
      final key = '${msg.nonce}-${msg.serverNonce}';

      final task = _dicReqDHParams[key];
      task?.complete(Result._(msg, null));
      _dicReqDHParams.remove(key);
    } else if (msg is DhGenOk) {
      final key = '${msg.nonce}-${msg.serverNonce}';

      final task = _reqSetClientDHParams[key];
      task?.complete(Result._(msg, null));
      _reqSetClientDHParams.remove(key);
    }
  }

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

    final frame = Frame.parse(buffer, obfuscation, _authKey);
    final seqno = frame.seqno;

    if (seqno != null && (seqno & 1) != 0) {
      _msgsToAck.add(frame.messageId);
    }

    final msg = frame.message;

    _handleIncomingMessage(msg);
  }

  Future<Result<ResPQ>> reqPqMulti([Int128? nonce]) async {
    nonce ??= Int128.random();
    final resPQ = await invoke(ReqPqMulti(nonce: nonce), false);

    return resPQ._to<ResPQ>();
  }

  Future<Result<SetClientDHParamsAnswerBase>> setClientDHParams(
    ResPQ resPQ,
    BigInt gB,
    int retryId,
    AesKeyIV keys,
  ) async {
    final clientDHinnerData = ClientDHInnerData(
      nonce: resPQ.nonce,
      serverNonce: resPQ.serverNonce,
      retryId: retryId,
      gB: gB.toBytes(Endian.big),
    );

    final messageBuffer = clientDHinnerData.asUint8List();
    final totalLength = messageBuffer.length + 20;
    final paddingToAdd = (0x7FFFFFF0 - totalLength) % 16;
    final padding = Uint8List(paddingToAdd);
    _rng.getBytes(padding);

    final messageHash = sha1.convert(messageBuffer).bytes;

    final clearStream = [...messageHash, ...messageBuffer, ...padding];
    final encryptedData = _aesIgeEncryptDecrypt(
      Uint8List.fromList(clearStream),
      keys,
      true,
    );

    final setClientDHParams = SetClientDHParams(
      nonce: resPQ.nonce,
      serverNonce: resPQ.serverNonce,
      encryptedData: encryptedData,
    );

    final answer = await invoke(setClientDHParams, false);

    return answer._to<SetClientDHParamsAnswerBase>();
  }

  Future<Result<ServerDHParamsOk>> reqDHParams(
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

      final msg = pqInnerData.asUint8List();
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

    final serverDHparams = await invoke(reqDHParams, false);

    return serverDHparams._to<ServerDHParamsOk>();
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
    final result = setClientDHparamsAnswer.result;

    if (result == null) {}

    if (result is DhGenOk) {
      print(
          '0x${_hex(expectedNewNonceNHash.skip(4))} == ${result.newNonceHash1}');
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

    _authKey = au;
    return au;
  }

  Future<Result> invoke(TlObject msg, bool preferEncryption) async {
    final auth = _authKey;

    preferEncryption &= auth.id != 0;

    final completer = Completer<Result>();
    final m = _newMessageId(preferEncryption);

    // if (preferEncryption && _msgsToAck.isNotEmpty) {
    //   final ack = _newMessageId(false);
    //   final ackMsg = MsgsAck(msgIds: _msgsToAck.toList());
    //   _msgsToAck.clear();

    //   var container = MsgContainer(
    //     messages: [
    //       Msg(
    //         msgId: m.msgId,
    //         seqno: m.seqno,
    //         bytes: 0,
    //         body: msg,
    //       ),
    //       Msg(
    //         msgId: ack.msgId,
    //         seqno: ack.seqno,
    //         bytes: 0,
    //         body: ackMsg,
    //       )
    //     ],
    //   );

    //   return send(container, false);
    // }

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

    if (auth.id == 0) {
      final frame = Frame(msg, m.msgId, 0, null);
      sender.add(frame.toUint8List(obfuscation));
    } else {
      final messageBuffer = msg.asUint8List();

      final clearLength = messageBuffer.length + 32;
      final padding = ((0x7FFFFFF0 - clearLength) % 16);
      final paddingRandomized = padding + 112; // ((2 + _rng.nextInt(14)) * 16);
      final paddingData = Uint8List(paddingRandomized);
      _rng.getBytes(paddingData);

      final clear = <int>[
        ...auth.key.skip(88).take(32),
        ...auth.salt.asUint64List(),
        ...dcSession.id.asUint64List(),
        ...m.msgId.asUint64List(),
        ...m.seqno.asUint32List(),
        ...messageBuffer.length.asUint32List(),
        ...messageBuffer,
        ...paddingData,
      ];

      final msgKey = Uint8List.fromList(sha256.convert(clear).bytes);
      final encryptedData = encryptDecryptMessage(
        Uint8List.fromList(clear.skip(32).toList()),
        true,
        0,
        auth.key,
        msgKey,
        8,
      );

      final writerLength = 8 + 16 + encryptedData.length;

      final buffer = [
        ...writerLength.asUint32List(),
        ...auth.id.asUint64List(),
        ...msgKey.skip(8).take(16),
        ...encryptedData,
      ];

      obfuscation?.send.encryptDecrypt(buffer, buffer.length);
      sender.add(buffer);
    }
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

  Future<Result<TlObject>> invokeWithLayer(
    int layer,
    TlMethod query,
  ) =>
      invoke(
        InvokeWithLayer(
          layer: layer,
          query: query,
        ),
        true,
      );
}

class ClientAuth {
  const ClientAuth._(this._c);

  final Client _c;

  Future<Result<AuthSentCodeBase>> sendCode(String phoneNumber,
      [CodeSettings? settings]) async {
    settings ??= CodeSettings(
      allowFlashcall: false,
      currentNumber: false,
      allowAppHash: false,
      allowMissedCall: false,
      allowFirebase: false,
      appSandbox: false,
    );

    final req = AuthSendCode(
      phoneNumber: phoneNumber,
      apiId: _c.apiId,
      apiHash: _c.apiHash,
      settings: settings,
    );

    final res = await _c.invoke(req, true);

    return res._to<AuthSentCodeBase>();
  }

  Future<Result<AuthAuthorizationBase>> signIn(
    String phoneNumber,
    String phoneCodeHash,
    String phoneCode,
  ) async {
    final req = AuthSignIn(
      phoneNumber: phoneNumber,
      phoneCodeHash: phoneCodeHash,
      phoneCode: phoneCode,
    );

    final res = await _c.invoke(req, true);

    return res._to<AuthAuthorizationBase>();
  }

  Future<Result<AuthAuthorizationBase>> checkPassword(
    InputCheckPasswordSRP password,
  ) async {
    final req = AuthCheckPassword(
      password: password,
    );

    final res = await _c.invoke(req, true);

    return res._to<AuthAuthorizationBase>();
  }
}

class ClientConnection {
  const ClientConnection._(this._c);

  final Client _c;

  Future<Result<Config>> initConnection({
    required String appVersion,
    required String deviceModel,
    required String langCode,
    required String langPack,
    required String systemLangCode,
    required String systemVersion,
  }) async {
    final req = InitConnection(
      apiId: _c.apiId,
      appVersion: 'TG 1.0',
      deviceModel: 'PC 64bit',
      langCode: 'en',
      langPack: '',
      systemLangCode: 'en',
      systemVersion: 'Android',
      params: JsonObject(value: []),
      query: HelpGetConfig(),
    );

    final res = await _c.invokeWithLayer(170, req);
    return res._to<Config>();
  }
}

class ClientAccount {
  const ClientAccount._(this._c);

  final Client _c;

  Future<Result<AccountPassword>> getPassword() async {
    final req = AccountGetPassword();

    final res = await _c.invoke(req, true);
    return res._to<AccountPassword>();
  }
}
