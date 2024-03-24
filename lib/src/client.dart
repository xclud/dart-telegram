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
  final Map<String, Completer<TlObject>> _reqPq = {};
  final Map<String, Completer<TlObject>> _reqDH = {};

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
      final nonce = msg.nonce.toString();

      final task = _reqPq[nonce];
      task?.complete(msg);
      _reqPq.remove(nonce);
    } else if (msg is ServerDHParamsOk) {
      final nonce = msg.serverNonce.toString();

      final task = _reqDH[nonce];
      task?.complete(msg);
      _reqDH.remove(nonce);
    }
  }

  Future<ResPQ> reqPqMulti([Int128? nonce]) async {
    nonce ??= Int128.random();
    final resPQ = await send<ResPQ>(ReqPqMulti(nonce: nonce), false);

    return resPQ;
  }

  Future<ServerDHParamsBase> reqDHParams(
    ResPQ resPQ, {
    Int256? newNonce,
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
      newNonce: newNonce ?? Int256.random(),
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
        aesKey,
        zeroIV,
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

  Future<T> send<T extends TlObject>(
    TlObject msg,
    bool preferEncryption,
  ) async {
    final completer = Completer<T>();
    final m = _newMessageId(false);

    if (msg is ReqPqMulti) {
      _reqPq[msg.nonce.toString()] = completer;
    } else if (msg is ReqDHParams) {
      _reqDH[msg.serverNonce.toString()] = completer;
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
