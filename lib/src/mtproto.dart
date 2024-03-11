part of '../tg.dart';

/// Predicate Res P Q.
abstract class ResPQBase extends TlConstructor {
  /// Predicate Res P Q constructor.
  const ResPQBase._() : super._();
}

/// Res P Q.
///
/// ID: `05162463`.
class ResPQ extends ResPQBase {
  /// Res P Q constructor.
  const ResPQ({
    required this.nonce,
    required this.serverNonce,
    required this.pq,
    required this.serverPublicKeyFingerprints,
  }) : super._();

  /// Deserialize.
  factory ResPQ.deserialize(Uint8List buffer) {
    // final nonce = _readint128(buffer);
    // final serverNonce = _readint128(buffer);
    // final pq = _readbytes(buffer);
    // final serverPublicKeyFingerprints = _readVector<long>(buffer);
    // final result = ResPQ(nonce: nonce, serverNonce: serverNonce, pq: pq, serverPublicKeyFingerprints: serverPublicKeyFingerprints,);

    // return result;

    throw Exception();
  }

  /// Nonce.
  final Int128 nonce;

  /// Server Nonce.
  final Int128 serverNonce;

  /// Pq.
  final Uint8List pq;

  /// Server Public Key Fingerprints.
  final List<int> serverPublicKeyFingerprints;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x05162463);
    buffer.writeInt128(nonce);
    buffer.writeInt128(serverNonce);
    buffer.writeBytes(pq);
    buffer.writeVectorInt64(serverPublicKeyFingerprints);
  }
}

/// Predicate P Q Inner Data.
abstract class PQInnerDataBase extends TlConstructor {
  /// Predicate P Q Inner Data constructor.
  const PQInnerDataBase._() : super._();
}

/// P Q Inner Data Dc.
///
/// ID: `a9f55f95`.
class PQInnerDataDc extends PQInnerDataBase {
  /// P Q Inner Data Dc constructor.
  const PQInnerDataDc({
    required this.pq,
    required this.p,
    required this.q,
    required this.nonce,
    required this.serverNonce,
    required this.newNonce,
    required this.dc,
  }) : super._();

  /// Deserialize.
  factory PQInnerDataDc.deserialize(Uint8List buffer) {
    // final pq = _readbytes(buffer);
    // final p = _readbytes(buffer);
    // final q = _readbytes(buffer);
    // final nonce = _readint128(buffer);
    // final serverNonce = _readint128(buffer);
    // final newNonce = _readint256(buffer);
    // final dc = _readint(buffer);
    // final result = PQInnerDataDc(pq: pq, p: p, q: q, nonce: nonce, serverNonce: serverNonce, newNonce: newNonce, dc: dc,);

    // return result;

    throw Exception();
  }

  /// Pq.
  final Uint8List pq;

  /// P.
  final Uint8List p;

  /// Q.
  final Uint8List q;

  /// Nonce.
  final Int128 nonce;

  /// Server Nonce.
  final Int128 serverNonce;

  /// New Nonce.
  final Int256 newNonce;

  /// Dc.
  final int dc;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xa9f55f95);
    buffer.writeBytes(pq);
    buffer.writeBytes(p);
    buffer.writeBytes(q);
    buffer.writeInt128(nonce);
    buffer.writeInt128(serverNonce);
    buffer.writeInt256(newNonce);
    buffer.writeInt32(dc);
  }
}

/// P Q Inner Data Temp Dc.
///
/// ID: `56fddf88`.
class PQInnerDataTempDc extends PQInnerDataBase {
  /// P Q Inner Data Temp Dc constructor.
  const PQInnerDataTempDc({
    required this.pq,
    required this.p,
    required this.q,
    required this.nonce,
    required this.serverNonce,
    required this.newNonce,
    required this.dc,
    required this.expiresIn,
  }) : super._();

  /// Deserialize.
  factory PQInnerDataTempDc.deserialize(Uint8List buffer) {
    // final pq = _readbytes(buffer);
    // final p = _readbytes(buffer);
    // final q = _readbytes(buffer);
    // final nonce = _readint128(buffer);
    // final serverNonce = _readint128(buffer);
    // final newNonce = _readint256(buffer);
    // final dc = _readint(buffer);
    // final expiresIn = _readint(buffer);
    // final result = PQInnerDataTempDc(pq: pq, p: p, q: q, nonce: nonce, serverNonce: serverNonce, newNonce: newNonce, dc: dc, expiresIn: expiresIn,);

    // return result;

    throw Exception();
  }

  /// Pq.
  final Uint8List pq;

  /// P.
  final Uint8List p;

  /// Q.
  final Uint8List q;

  /// Nonce.
  final Int128 nonce;

  /// Server Nonce.
  final Int128 serverNonce;

  /// New Nonce.
  final Int256 newNonce;

  /// Dc.
  final int dc;

  /// Expires In.
  final int expiresIn;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x56fddf88);
    buffer.writeBytes(pq);
    buffer.writeBytes(p);
    buffer.writeBytes(q);
    buffer.writeInt128(nonce);
    buffer.writeInt128(serverNonce);
    buffer.writeInt256(newNonce);
    buffer.writeInt32(dc);
    buffer.writeInt32(expiresIn);
  }
}

/// Predicate Server D H Params.
abstract class ServerDHParamsBase extends TlConstructor {
  /// Predicate Server D H Params constructor.
  const ServerDHParamsBase._() : super._();
}

/// Server D H Params Ok.
///
/// ID: `d0e8075c`.
class ServerDHParamsOk extends ServerDHParamsBase {
  /// Server D H Params Ok constructor.
  const ServerDHParamsOk({
    required this.nonce,
    required this.serverNonce,
    required this.encryptedAnswer,
  }) : super._();

  /// Deserialize.
  factory ServerDHParamsOk.deserialize(Uint8List buffer) {
    // final nonce = _readint128(buffer);
    // final serverNonce = _readint128(buffer);
    // final encryptedAnswer = _readbytes(buffer);
    // final result = ServerDHParamsOk(nonce: nonce, serverNonce: serverNonce, encryptedAnswer: encryptedAnswer,);

    // return result;

    throw Exception();
  }

  /// Nonce.
  final Int128 nonce;

  /// Server Nonce.
  final Int128 serverNonce;

  /// Encrypted Answer.
  final Uint8List encryptedAnswer;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xd0e8075c);
    buffer.writeInt128(nonce);
    buffer.writeInt128(serverNonce);
    buffer.writeBytes(encryptedAnswer);
  }
}

/// Predicate Server D H Inner Data.
abstract class ServerDHInnerDataBase extends TlConstructor {
  /// Predicate Server D H Inner Data constructor.
  const ServerDHInnerDataBase._() : super._();
}

/// Server D H Inner Data.
///
/// ID: `b5890dba`.
class ServerDHInnerData extends ServerDHInnerDataBase {
  /// Server D H Inner Data constructor.
  const ServerDHInnerData({
    required this.nonce,
    required this.serverNonce,
    required this.g,
    required this.dhPrime,
    required this.gA,
    required this.serverTime,
  }) : super._();

  /// Deserialize.
  factory ServerDHInnerData.deserialize(Uint8List buffer) {
    // final nonce = _readint128(buffer);
    // final serverNonce = _readint128(buffer);
    // final g = _readint(buffer);
    // final dhPrime = _readbytes(buffer);
    // final gA = _readbytes(buffer);
    // final serverTime = _readint(buffer);
    // final result = ServerDHInnerData(nonce: nonce, serverNonce: serverNonce, g: g, dhPrime: dhPrime, gA: gA, serverTime: serverTime,);

    // return result;

    throw Exception();
  }

  /// Nonce.
  final Int128 nonce;

  /// Server Nonce.
  final Int128 serverNonce;

  /// G.
  final int g;

  /// Dh Prime.
  final Uint8List dhPrime;

  /// G A.
  final Uint8List gA;

  /// Server Time.
  final int serverTime;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xb5890dba);
    buffer.writeInt128(nonce);
    buffer.writeInt128(serverNonce);
    buffer.writeInt32(g);
    buffer.writeBytes(dhPrime);
    buffer.writeBytes(gA);
    buffer.writeInt32(serverTime);
  }
}

/// Predicate Client D H Inner Data.
abstract class ClientDHInnerDataBase extends TlConstructor {
  /// Predicate Client D H Inner Data constructor.
  const ClientDHInnerDataBase._() : super._();
}

/// Client D H Inner Data.
///
/// ID: `6643b654`.
class ClientDHInnerData extends ClientDHInnerDataBase {
  /// Client D H Inner Data constructor.
  const ClientDHInnerData({
    required this.nonce,
    required this.serverNonce,
    required this.retryId,
    required this.gB,
  }) : super._();

  /// Deserialize.
  factory ClientDHInnerData.deserialize(Uint8List buffer) {
    // final nonce = _readint128(buffer);
    // final serverNonce = _readint128(buffer);
    // final retryId = _readlong(buffer);
    // final gB = _readbytes(buffer);
    // final result = ClientDHInnerData(nonce: nonce, serverNonce: serverNonce, retryId: retryId, gB: gB,);

    // return result;

    throw Exception();
  }

  /// Nonce.
  final Int128 nonce;

  /// Server Nonce.
  final Int128 serverNonce;

  /// Retry Id.
  final int retryId;

  /// G B.
  final Uint8List gB;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x6643b654);
    buffer.writeInt128(nonce);
    buffer.writeInt128(serverNonce);
    buffer.writeInt64(retryId);
    buffer.writeBytes(gB);
  }
}

/// Predicate Set Client D H Params Answer.
abstract class SetClientDHParamsAnswerBase extends TlConstructor {
  /// Predicate Set Client D H Params Answer constructor.
  const SetClientDHParamsAnswerBase._() : super._();
}

/// Dh Gen Ok.
///
/// ID: `3bcbf734`.
class DhGenOk extends SetClientDHParamsAnswerBase {
  /// Dh Gen Ok constructor.
  const DhGenOk({
    required this.nonce,
    required this.serverNonce,
    required this.newNonceHash1,
  }) : super._();

  /// Deserialize.
  factory DhGenOk.deserialize(Uint8List buffer) {
    // final nonce = _readint128(buffer);
    // final serverNonce = _readint128(buffer);
    // final newNonceHash1 = _readint128(buffer);
    // final result = DhGenOk(nonce: nonce, serverNonce: serverNonce, newNonceHash1: newNonceHash1,);

    // return result;

    throw Exception();
  }

  /// Nonce.
  final Int128 nonce;

  /// Server Nonce.
  final Int128 serverNonce;

  /// New Nonce Hash1.
  final Int128 newNonceHash1;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x3bcbf734);
    buffer.writeInt128(nonce);
    buffer.writeInt128(serverNonce);
    buffer.writeInt128(newNonceHash1);
  }
}

/// Dh Gen Retry.
///
/// ID: `46dc1fb9`.
class DhGenRetry extends SetClientDHParamsAnswerBase {
  /// Dh Gen Retry constructor.
  const DhGenRetry({
    required this.nonce,
    required this.serverNonce,
    required this.newNonceHash2,
  }) : super._();

  /// Deserialize.
  factory DhGenRetry.deserialize(Uint8List buffer) {
    // final nonce = _readint128(buffer);
    // final serverNonce = _readint128(buffer);
    // final newNonceHash2 = _readint128(buffer);
    // final result = DhGenRetry(nonce: nonce, serverNonce: serverNonce, newNonceHash2: newNonceHash2,);

    // return result;

    throw Exception();
  }

  /// Nonce.
  final Int128 nonce;

  /// Server Nonce.
  final Int128 serverNonce;

  /// New Nonce Hash2.
  final Int128 newNonceHash2;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x46dc1fb9);
    buffer.writeInt128(nonce);
    buffer.writeInt128(serverNonce);
    buffer.writeInt128(newNonceHash2);
  }
}

/// Dh Gen Fail.
///
/// ID: `a69dae02`.
class DhGenFail extends SetClientDHParamsAnswerBase {
  /// Dh Gen Fail constructor.
  const DhGenFail({
    required this.nonce,
    required this.serverNonce,
    required this.newNonceHash3,
  }) : super._();

  /// Deserialize.
  factory DhGenFail.deserialize(Uint8List buffer) {
    // final nonce = _readint128(buffer);
    // final serverNonce = _readint128(buffer);
    // final newNonceHash3 = _readint128(buffer);
    // final result = DhGenFail(nonce: nonce, serverNonce: serverNonce, newNonceHash3: newNonceHash3,);

    // return result;

    throw Exception();
  }

  /// Nonce.
  final Int128 nonce;

  /// Server Nonce.
  final Int128 serverNonce;

  /// New Nonce Hash3.
  final Int128 newNonceHash3;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xa69dae02);
    buffer.writeInt128(nonce);
    buffer.writeInt128(serverNonce);
    buffer.writeInt128(newNonceHash3);
  }
}

/// Predicate Bind Auth Key Inner.
abstract class BindAuthKeyInnerBase extends TlConstructor {
  /// Predicate Bind Auth Key Inner constructor.
  const BindAuthKeyInnerBase._() : super._();
}

/// Bind Auth Key Inner.
///
/// ID: `75a3f765`.
class BindAuthKeyInner extends BindAuthKeyInnerBase {
  /// Bind Auth Key Inner constructor.
  const BindAuthKeyInner({
    required this.nonce,
    required this.tempAuthKeyId,
    required this.permAuthKeyId,
    required this.tempSessionId,
    required this.expiresAt,
  }) : super._();

  /// Deserialize.
  factory BindAuthKeyInner.deserialize(Uint8List buffer) {
    // final nonce = _readlong(buffer);
    // final tempAuthKeyId = _readlong(buffer);
    // final permAuthKeyId = _readlong(buffer);
    // final tempSessionId = _readlong(buffer);
    // final expiresAt = _readint(buffer);
    // final result = BindAuthKeyInner(nonce: nonce, tempAuthKeyId: tempAuthKeyId, permAuthKeyId: permAuthKeyId, tempSessionId: tempSessionId, expiresAt: expiresAt,);

    // return result;

    throw Exception();
  }

  /// Nonce.
  final int nonce;

  /// Temp Auth Key Id.
  final int tempAuthKeyId;

  /// Perm Auth Key Id.
  final int permAuthKeyId;

  /// Temp Session Id.
  final int tempSessionId;

  /// Expires At.
  final int expiresAt;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x75a3f765);
    buffer.writeInt64(nonce);
    buffer.writeInt64(tempAuthKeyId);
    buffer.writeInt64(permAuthKeyId);
    buffer.writeInt64(tempSessionId);
    buffer.writeInt32(expiresAt);
  }
}

/// Predicate Rpc Result.
abstract class RpcResultBase extends TlConstructor {
  /// Predicate Rpc Result constructor.
  const RpcResultBase._() : super._();
}

/// Rpc Result.
///
/// ID: `f35c6d01`.
class RpcResult extends RpcResultBase {
  /// Rpc Result constructor.
  const RpcResult({
    required this.reqMsgId,
    required this.result,
  }) : super._();

  /// Deserialize.
  factory RpcResult.deserialize(Uint8List buffer) {
    // final reqMsgId = _readlong(buffer);
    // final result = _readObject(buffer);
    // final result = RpcResult(reqMsgId: reqMsgId, result: result,);

    // return result;

    throw Exception();
  }

  /// Req Msg Id.
  final int reqMsgId;

  /// Result.
  final ObjectBase result;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xf35c6d01);
    buffer.writeInt64(reqMsgId);
    buffer.writeObject(result);
  }
}

/// Predicate Rpc Error.
abstract class RpcErrorBase extends TlConstructor {
  /// Predicate Rpc Error constructor.
  const RpcErrorBase._() : super._();
}

/// Rpc Error.
///
/// ID: `2144ca19`.
class RpcError extends RpcErrorBase {
  /// Rpc Error constructor.
  const RpcError({
    required this.errorCode,
    required this.errorMessage,
  }) : super._();

  /// Deserialize.
  factory RpcError.deserialize(Uint8List buffer) {
    // final errorCode = _readint(buffer);
    // final errorMessage = _readstring(buffer);
    // final result = RpcError(errorCode: errorCode, errorMessage: errorMessage,);

    // return result;

    throw Exception();
  }

  /// Error Code.
  final int errorCode;

  /// Error Message.
  final String errorMessage;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x2144ca19);
    buffer.writeInt32(errorCode);
    buffer.writeString(errorMessage);
  }
}

/// Predicate Rpc Drop Answer.
abstract class RpcDropAnswerBase extends TlConstructor {
  /// Predicate Rpc Drop Answer constructor.
  const RpcDropAnswerBase._() : super._();
}

/// Rpc Answer Unknown.
///
/// ID: `5e2ad36e`.
class RpcAnswerUnknown extends RpcDropAnswerBase {
  /// Rpc Answer Unknown constructor.
  const RpcAnswerUnknown() : super._();

  /// Deserialize.
  factory RpcAnswerUnknown.deserialize(Uint8List buffer) {
    // final result = RpcAnswerUnknown();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x5e2ad36e);
  }
}

/// Rpc Answer Dropped Running.
///
/// ID: `cd78e586`.
class RpcAnswerDroppedRunning extends RpcDropAnswerBase {
  /// Rpc Answer Dropped Running constructor.
  const RpcAnswerDroppedRunning() : super._();

  /// Deserialize.
  factory RpcAnswerDroppedRunning.deserialize(Uint8List buffer) {
    // final result = RpcAnswerDroppedRunning();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xcd78e586);
  }
}

/// Rpc Answer Dropped.
///
/// ID: `a43ad8b7`.
class RpcAnswerDropped extends RpcDropAnswerBase {
  /// Rpc Answer Dropped constructor.
  const RpcAnswerDropped({
    required this.msgId,
    required this.seqNo,
    required this.bytes,
  }) : super._();

  /// Deserialize.
  factory RpcAnswerDropped.deserialize(Uint8List buffer) {
    // final msgId = _readlong(buffer);
    // final seqNo = _readint(buffer);
    // final bytes = _readint(buffer);
    // final result = RpcAnswerDropped(msgId: msgId, seqNo: seqNo, bytes: bytes,);

    // return result;

    throw Exception();
  }

  /// Msg Id.
  final int msgId;

  /// Seq No.
  final int seqNo;

  /// Bytes.
  final int bytes;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xa43ad8b7);
    buffer.writeInt64(msgId);
    buffer.writeInt32(seqNo);
    buffer.writeInt32(bytes);
  }
}

/// Predicate Future Salt.
abstract class FutureSaltBase extends TlConstructor {
  /// Predicate Future Salt constructor.
  const FutureSaltBase._() : super._();
}

/// Future Salt.
///
/// ID: `0949d9dc`.
class FutureSalt extends FutureSaltBase {
  /// Future Salt constructor.
  const FutureSalt({
    required this.validSince,
    required this.validUntil,
    required this.salt,
  }) : super._();

  /// Deserialize.
  factory FutureSalt.deserialize(Uint8List buffer) {
    // final validSince = _readint(buffer);
    // final validUntil = _readint(buffer);
    // final salt = _readlong(buffer);
    // final result = FutureSalt(validSince: validSince, validUntil: validUntil, salt: salt,);

    // return result;

    throw Exception();
  }

  /// Valid Since.
  final int validSince;

  /// Valid Until.
  final int validUntil;

  /// Salt.
  final int salt;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x0949d9dc);
    buffer.writeInt32(validSince);
    buffer.writeInt32(validUntil);
    buffer.writeInt64(salt);
  }
}

/// Predicate Future Salts.
abstract class FutureSaltsBase extends TlConstructor {
  /// Predicate Future Salts constructor.
  const FutureSaltsBase._() : super._();
}

/// Future Salts.
///
/// ID: `ae500895`.
class FutureSalts extends FutureSaltsBase {
  /// Future Salts constructor.
  const FutureSalts({
    required this.reqMsgId,
    required this.now,
    required this.salts,
  }) : super._();

  /// Deserialize.
  factory FutureSalts.deserialize(Uint8List buffer) {
    // final reqMsgId = _readlong(buffer);
    // final now = _readint(buffer);
    // final salts = _readvector<future_salt>(buffer);
    // final result = FutureSalts(reqMsgId: reqMsgId, now: now, salts: salts,);

    // return result;

    throw Exception();
  }

  /// Req Msg Id.
  final int reqMsgId;

  /// Now.
  final int now;

  /// Salts.
  final List<FutureSaltBase> salts;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xae500895);
    buffer.writeInt64(reqMsgId);
    buffer.writeInt32(now);
    buffer.writeVectorObject(salts);
  }
}

/// Predicate Pong.
abstract class PongBase extends TlConstructor {
  /// Predicate Pong constructor.
  const PongBase._() : super._();
}

/// Pong.
///
/// ID: `347773c5`.
class Pong extends PongBase {
  /// Pong constructor.
  const Pong({
    required this.msgId,
    required this.pingId,
  }) : super._();

  /// Deserialize.
  factory Pong.deserialize(Uint8List buffer) {
    // final msgId = _readlong(buffer);
    // final pingId = _readlong(buffer);
    // final result = Pong(msgId: msgId, pingId: pingId,);

    // return result;

    throw Exception();
  }

  /// Msg Id.
  final int msgId;

  /// Ping Id.
  final int pingId;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x347773c5);
    buffer.writeInt64(msgId);
    buffer.writeInt64(pingId);
  }
}

/// Predicate Destroy Session Res.
abstract class DestroySessionResBase extends TlConstructor {
  /// Predicate Destroy Session Res constructor.
  const DestroySessionResBase._() : super._();
}

/// Destroy Session Ok.
///
/// ID: `e22045fc`.
class DestroySessionOk extends DestroySessionResBase {
  /// Destroy Session Ok constructor.
  const DestroySessionOk({
    required this.sessionId,
  }) : super._();

  /// Deserialize.
  factory DestroySessionOk.deserialize(Uint8List buffer) {
    // final sessionId = _readlong(buffer);
    // final result = DestroySessionOk(sessionId: sessionId,);

    // return result;

    throw Exception();
  }

  /// Session Id.
  final int sessionId;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xe22045fc);
    buffer.writeInt64(sessionId);
  }
}

/// Destroy Session None.
///
/// ID: `62d350c9`.
class DestroySessionNone extends DestroySessionResBase {
  /// Destroy Session None constructor.
  const DestroySessionNone({
    required this.sessionId,
  }) : super._();

  /// Deserialize.
  factory DestroySessionNone.deserialize(Uint8List buffer) {
    // final sessionId = _readlong(buffer);
    // final result = DestroySessionNone(sessionId: sessionId,);

    // return result;

    throw Exception();
  }

  /// Session Id.
  final int sessionId;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x62d350c9);
    buffer.writeInt64(sessionId);
  }
}

/// Predicate New Session.
abstract class NewSessionBase extends TlConstructor {
  /// Predicate New Session constructor.
  const NewSessionBase._() : super._();
}

/// New Session Created.
///
/// ID: `9ec20908`.
class NewSessionCreated extends NewSessionBase {
  /// New Session Created constructor.
  const NewSessionCreated({
    required this.firstMsgId,
    required this.uniqueId,
    required this.serverSalt,
  }) : super._();

  /// Deserialize.
  factory NewSessionCreated.deserialize(Uint8List buffer) {
    // final firstMsgId = _readlong(buffer);
    // final uniqueId = _readlong(buffer);
    // final serverSalt = _readlong(buffer);
    // final result = NewSessionCreated(firstMsgId: firstMsgId, uniqueId: uniqueId, serverSalt: serverSalt,);

    // return result;

    throw Exception();
  }

  /// First Msg Id.
  final int firstMsgId;

  /// Unique Id.
  final int uniqueId;

  /// Server Salt.
  final int serverSalt;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x9ec20908);
    buffer.writeInt64(firstMsgId);
    buffer.writeInt64(uniqueId);
    buffer.writeInt64(serverSalt);
  }
}

/// Predicate Message Container.
abstract class MessageContainerBase extends TlConstructor {
  /// Predicate Message Container constructor.
  const MessageContainerBase._() : super._();
}

/// Msg Container.
///
/// ID: `73f1f8dc`.
class MsgContainer extends MessageContainerBase {
  /// Msg Container constructor.
  const MsgContainer({
    required this.messages,
  }) : super._();

  /// Deserialize.
  factory MsgContainer.deserialize(Uint8List buffer) {
    // final messages = _readvector<%Message>(buffer);
    // final result = MsgContainer(messages: messages,);

    // return result;

    throw Exception();
  }

  /// Messages.
  final List<Msg> messages;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x73f1f8dc);
    buffer.writeVectorObject(messages);
  }
}

/// Message.
///
/// ID: `5bb8e511`.
class Msg extends TlConstructor {
  /// Message constructor.
  const Msg({
    required this.msgId,
    required this.seqno,
    required this.bytes,
    required this.body,
  }) : super._();

  /// Deserialize.
  factory Msg.deserialize(Uint8List buffer) {
    // final msgId = _readlong(buffer);
    // final seqno = _readint(buffer);
    // final bytes = _readint(buffer);
    // final body = _readObject(buffer);
    // final result = Message(msgId: msgId, seqno: seqno, bytes: bytes, body: body,);

    // return result;

    throw Exception();
  }

  /// Msg Id.
  final int msgId;

  /// Seqno.
  final int seqno;

  /// Bytes.
  final int bytes;

  /// Body.
  final ObjectBase body;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x5bb8e511);
    buffer.writeInt64(msgId);
    buffer.writeInt32(seqno);
    buffer.writeInt32(bytes);
    buffer.writeObject(body);
  }
}

/// Predicate Message Copy.
abstract class MessageCopyBase extends TlConstructor {
  /// Predicate Message Copy constructor.
  const MessageCopyBase._() : super._();
}

/// Msg Copy.
///
/// ID: `e06046b2`.
class MsgCopy extends MessageCopyBase {
  /// Msg Copy constructor.
  const MsgCopy({
    required this.origMessage,
  }) : super._();

  /// Deserialize.
  factory MsgCopy.deserialize(Uint8List buffer) {
    // final origMessage = _readMessage(buffer);
    // final result = MsgCopy(origMessage: origMessage,);

    // return result;

    throw Exception();
  }

  /// Orig Message.
  final Msg origMessage;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xe06046b2);
    buffer.writeObject(origMessage);
  }
}

/// Predicate Object.
abstract class ObjectBase extends TlConstructor {
  /// Predicate Object constructor.
  const ObjectBase._() : super._();
}

/// Gzip Packed.
///
/// ID: `3072cfa1`.
class GzipPacked extends ObjectBase {
  /// Gzip Packed constructor.
  const GzipPacked({
    required this.packedData,
  }) : super._();

  /// Deserialize.
  factory GzipPacked.deserialize(Uint8List buffer) {
    // final packedData = _readbytes(buffer);
    // final result = GzipPacked(packedData: packedData,);

    // return result;

    throw Exception();
  }

  /// Packed Data.
  final Uint8List packedData;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x3072cfa1);
    buffer.writeBytes(packedData);
  }
}

/// Predicate Msgs Ack.
abstract class MsgsAckBase extends TlConstructor {
  /// Predicate Msgs Ack constructor.
  const MsgsAckBase._() : super._();
}

/// Msgs Ack.
///
/// ID: `62d6b459`.
class MsgsAck extends MsgsAckBase {
  /// Msgs Ack constructor.
  const MsgsAck({
    required this.msgIds,
  }) : super._();

  /// Deserialize.
  factory MsgsAck.deserialize(Uint8List buffer) {
    // final msgIds = _readVector<long>(buffer);
    // final result = MsgsAck(msgIds: msgIds,);

    // return result;

    throw Exception();
  }

  /// Msg Ids.
  final List<int> msgIds;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x62d6b459);
    buffer.writeVectorInt64(msgIds);
  }
}

/// Predicate Bad Msg Notification.
abstract class BadMsgNotificationBase extends TlConstructor {
  /// Predicate Bad Msg Notification constructor.
  const BadMsgNotificationBase._() : super._();
}

/// Bad Msg Notification.
///
/// ID: `a7eff811`.
class BadMsgNotification extends BadMsgNotificationBase {
  /// Bad Msg Notification constructor.
  const BadMsgNotification({
    required this.badMsgId,
    required this.badMsgSeqno,
    required this.errorCode,
  }) : super._();

  /// Deserialize.
  factory BadMsgNotification.deserialize(Uint8List buffer) {
    // final badMsgId = _readlong(buffer);
    // final badMsgSeqno = _readint(buffer);
    // final errorCode = _readint(buffer);
    // final result = BadMsgNotification(badMsgId: badMsgId, badMsgSeqno: badMsgSeqno, errorCode: errorCode,);

    // return result;

    throw Exception();
  }

  /// Bad Msg Id.
  final int badMsgId;

  /// Bad Msg Seqno.
  final int badMsgSeqno;

  /// Error Code.
  final int errorCode;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xa7eff811);
    buffer.writeInt64(badMsgId);
    buffer.writeInt32(badMsgSeqno);
    buffer.writeInt32(errorCode);
  }
}

/// Bad Server Salt.
///
/// ID: `edab447b`.
class BadServerSalt extends BadMsgNotificationBase {
  /// Bad Server Salt constructor.
  const BadServerSalt({
    required this.badMsgId,
    required this.badMsgSeqno,
    required this.errorCode,
    required this.newServerSalt,
  }) : super._();

  /// Deserialize.
  factory BadServerSalt.deserialize(Uint8List buffer) {
    // final badMsgId = _readlong(buffer);
    // final badMsgSeqno = _readint(buffer);
    // final errorCode = _readint(buffer);
    // final newServerSalt = _readlong(buffer);
    // final result = BadServerSalt(badMsgId: badMsgId, badMsgSeqno: badMsgSeqno, errorCode: errorCode, newServerSalt: newServerSalt,);

    // return result;

    throw Exception();
  }

  /// Bad Msg Id.
  final int badMsgId;

  /// Bad Msg Seqno.
  final int badMsgSeqno;

  /// Error Code.
  final int errorCode;

  /// New Server Salt.
  final int newServerSalt;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xedab447b);
    buffer.writeInt64(badMsgId);
    buffer.writeInt32(badMsgSeqno);
    buffer.writeInt32(errorCode);
    buffer.writeInt64(newServerSalt);
  }
}

/// Predicate Msg Resend Req.
abstract class MsgResendReqBase extends TlConstructor {
  /// Predicate Msg Resend Req constructor.
  const MsgResendReqBase._() : super._();
}

/// Msg Resend Req.
///
/// ID: `7d861a08`.
class MsgResendReq extends MsgResendReqBase {
  /// Msg Resend Req constructor.
  const MsgResendReq({
    required this.msgIds,
  }) : super._();

  /// Deserialize.
  factory MsgResendReq.deserialize(Uint8List buffer) {
    // final msgIds = _readVector<long>(buffer);
    // final result = MsgResendReq(msgIds: msgIds,);

    // return result;

    throw Exception();
  }

  /// Msg Ids.
  final List<int> msgIds;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x7d861a08);
    buffer.writeVectorInt64(msgIds);
  }
}

/// Predicate Msgs State Req.
abstract class MsgsStateReqBase extends TlConstructor {
  /// Predicate Msgs State Req constructor.
  const MsgsStateReqBase._() : super._();
}

/// Msgs State Req.
///
/// ID: `da69fb52`.
class MsgsStateReq extends MsgsStateReqBase {
  /// Msgs State Req constructor.
  const MsgsStateReq({
    required this.msgIds,
  }) : super._();

  /// Deserialize.
  factory MsgsStateReq.deserialize(Uint8List buffer) {
    // final msgIds = _readVector<long>(buffer);
    // final result = MsgsStateReq(msgIds: msgIds,);

    // return result;

    throw Exception();
  }

  /// Msg Ids.
  final List<int> msgIds;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xda69fb52);
    buffer.writeVectorInt64(msgIds);
  }
}

/// Predicate Msgs State Info.
abstract class MsgsStateInfoBase extends TlConstructor {
  /// Predicate Msgs State Info constructor.
  const MsgsStateInfoBase._() : super._();
}

/// Msgs State Info.
///
/// ID: `04deb57d`.
class MsgsStateInfo extends MsgsStateInfoBase {
  /// Msgs State Info constructor.
  const MsgsStateInfo({
    required this.reqMsgId,
    required this.info,
  }) : super._();

  /// Deserialize.
  factory MsgsStateInfo.deserialize(Uint8List buffer) {
    // final reqMsgId = _readlong(buffer);
    // final info = _readbytes(buffer);
    // final result = MsgsStateInfo(reqMsgId: reqMsgId, info: info,);

    // return result;

    throw Exception();
  }

  /// Req Msg Id.
  final int reqMsgId;

  /// Info.
  final Uint8List info;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x04deb57d);
    buffer.writeInt64(reqMsgId);
    buffer.writeBytes(info);
  }
}

/// Predicate Msgs All Info.
abstract class MsgsAllInfoBase extends TlConstructor {
  /// Predicate Msgs All Info constructor.
  const MsgsAllInfoBase._() : super._();
}

/// Msgs All Info.
///
/// ID: `8cc0d131`.
class MsgsAllInfo extends MsgsAllInfoBase {
  /// Msgs All Info constructor.
  const MsgsAllInfo({
    required this.msgIds,
    required this.info,
  }) : super._();

  /// Deserialize.
  factory MsgsAllInfo.deserialize(Uint8List buffer) {
    // final msgIds = _readVector<long>(buffer);
    // final info = _readbytes(buffer);
    // final result = MsgsAllInfo(msgIds: msgIds, info: info,);

    // return result;

    throw Exception();
  }

  /// Msg Ids.
  final List<int> msgIds;

  /// Info.
  final Uint8List info;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x8cc0d131);
    buffer.writeVectorInt64(msgIds);
    buffer.writeBytes(info);
  }
}

/// Predicate Msg Detailed Info.
abstract class MsgDetailedInfoBase extends TlConstructor {
  /// Predicate Msg Detailed Info constructor.
  const MsgDetailedInfoBase._() : super._();
}

/// Msg Detailed Info.
///
/// ID: `276d3ec6`.
class MsgDetailedInfo extends MsgDetailedInfoBase {
  /// Msg Detailed Info constructor.
  const MsgDetailedInfo({
    required this.msgId,
    required this.answerMsgId,
    required this.bytes,
    required this.status,
  }) : super._();

  /// Deserialize.
  factory MsgDetailedInfo.deserialize(Uint8List buffer) {
    // final msgId = _readlong(buffer);
    // final answerMsgId = _readlong(buffer);
    // final bytes = _readint(buffer);
    // final status = _readint(buffer);
    // final result = MsgDetailedInfo(msgId: msgId, answerMsgId: answerMsgId, bytes: bytes, status: status,);

    // return result;

    throw Exception();
  }

  /// Msg Id.
  final int msgId;

  /// Answer Msg Id.
  final int answerMsgId;

  /// Bytes.
  final int bytes;

  /// Status.
  final int status;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x276d3ec6);
    buffer.writeInt64(msgId);
    buffer.writeInt64(answerMsgId);
    buffer.writeInt32(bytes);
    buffer.writeInt32(status);
  }
}

/// Msg New Detailed Info.
///
/// ID: `809db6df`.
class MsgNewDetailedInfo extends MsgDetailedInfoBase {
  /// Msg New Detailed Info constructor.
  const MsgNewDetailedInfo({
    required this.answerMsgId,
    required this.bytes,
    required this.status,
  }) : super._();

  /// Deserialize.
  factory MsgNewDetailedInfo.deserialize(Uint8List buffer) {
    // final answerMsgId = _readlong(buffer);
    // final bytes = _readint(buffer);
    // final status = _readint(buffer);
    // final result = MsgNewDetailedInfo(answerMsgId: answerMsgId, bytes: bytes, status: status,);

    // return result;

    throw Exception();
  }

  /// Answer Msg Id.
  final int answerMsgId;

  /// Bytes.
  final int bytes;

  /// Status.
  final int status;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x809db6df);
    buffer.writeInt64(answerMsgId);
    buffer.writeInt32(bytes);
    buffer.writeInt32(status);
  }
}

/// Predicate Destroy Auth Key Res.
abstract class DestroyAuthKeyResBase extends TlConstructor {
  /// Predicate Destroy Auth Key Res constructor.
  const DestroyAuthKeyResBase._() : super._();
}

/// Destroy Auth Key Ok.
///
/// ID: `f660e1d4`.
class DestroyAuthKeyOk extends DestroyAuthKeyResBase {
  /// Destroy Auth Key Ok constructor.
  const DestroyAuthKeyOk() : super._();

  /// Deserialize.
  factory DestroyAuthKeyOk.deserialize(Uint8List buffer) {
    // final result = DestroyAuthKeyOk();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xf660e1d4);
  }
}

/// Destroy Auth Key None.
///
/// ID: `0a9f2259`.
class DestroyAuthKeyNone extends DestroyAuthKeyResBase {
  /// Destroy Auth Key None constructor.
  const DestroyAuthKeyNone() : super._();

  /// Deserialize.
  factory DestroyAuthKeyNone.deserialize(Uint8List buffer) {
    // final result = DestroyAuthKeyNone();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x0a9f2259);
  }
}

/// Destroy Auth Key Fail.
///
/// ID: `ea109b13`.
class DestroyAuthKeyFail extends DestroyAuthKeyResBase {
  /// Destroy Auth Key Fail constructor.
  const DestroyAuthKeyFail() : super._();

  /// Deserialize.
  factory DestroyAuthKeyFail.deserialize(Uint8List buffer) {
    // final result = DestroyAuthKeyFail();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xea109b13);
  }
}

/// Req Pq Multi.
///
/// ID: `be7e8ef1`.
class ReqPqMulti extends TlMethod<ResPQBase> {
  /// Req Pq Multi constructor.
  const ReqPqMulti({
    required this.nonce,
  }) : super._();

  /// Deserialize.
  factory ReqPqMulti.deserialize(Uint8List buffer) {
    // final nonce = _readint128(buffer);
    // final result = ReqPqMulti(nonce: nonce,);

    // return result;

    throw Exception();
  }

  /// Nonce.
  final Int128 nonce;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xbe7e8ef1);
    buffer.writeInt128(nonce);
  }
}

/// Req D H Params.
///
/// ID: `d712e4be`.
class ReqDHParams extends TlMethod<ServerDHParamsBase> {
  /// Req D H Params constructor.
  const ReqDHParams({
    required this.nonce,
    required this.serverNonce,
    required this.p,
    required this.q,
    required this.publicKeyFingerprint,
    required this.encryptedData,
  }) : super._();

  /// Deserialize.
  factory ReqDHParams.deserialize(Uint8List buffer) {
    // final nonce = _readint128(buffer);
    // final serverNonce = _readint128(buffer);
    // final p = _readbytes(buffer);
    // final q = _readbytes(buffer);
    // final publicKeyFingerprint = _readlong(buffer);
    // final encryptedData = _readbytes(buffer);
    // final result = ReqDHParams(nonce: nonce, serverNonce: serverNonce, p: p, q: q, publicKeyFingerprint: publicKeyFingerprint, encryptedData: encryptedData,);

    // return result;

    throw Exception();
  }

  /// Nonce.
  final Int128 nonce;

  /// Server Nonce.
  final Int128 serverNonce;

  /// P.
  final Uint8List p;

  /// Q.
  final Uint8List q;

  /// Public Key Fingerprint.
  final int publicKeyFingerprint;

  /// Encrypted Data.
  final Uint8List encryptedData;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xd712e4be);
    buffer.writeInt128(nonce);
    buffer.writeInt128(serverNonce);
    buffer.writeBytes(p);
    buffer.writeBytes(q);
    buffer.writeInt64(publicKeyFingerprint);
    buffer.writeBytes(encryptedData);
  }
}

/// Set Client D H Params.
///
/// ID: `f5045f1f`.
class SetClientDHParams extends TlMethod<SetClientDHParamsAnswerBase> {
  /// Set Client D H Params constructor.
  const SetClientDHParams({
    required this.nonce,
    required this.serverNonce,
    required this.encryptedData,
  }) : super._();

  /// Deserialize.
  factory SetClientDHParams.deserialize(Uint8List buffer) {
    // final nonce = _readint128(buffer);
    // final serverNonce = _readint128(buffer);
    // final encryptedData = _readbytes(buffer);
    // final result = SetClientDHParams(nonce: nonce, serverNonce: serverNonce, encryptedData: encryptedData,);

    // return result;

    throw Exception();
  }

  /// Nonce.
  final Int128 nonce;

  /// Server Nonce.
  final Int128 serverNonce;

  /// Encrypted Data.
  final Uint8List encryptedData;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xf5045f1f);
    buffer.writeInt128(nonce);
    buffer.writeInt128(serverNonce);
    buffer.writeBytes(encryptedData);
  }
}

/// Rpc Drop Answer.
///
/// ID: `58e4a740`.
class RpcDropAnswer extends TlMethod<RpcDropAnswerBase> {
  /// Rpc Drop Answer constructor.
  const RpcDropAnswer({
    required this.reqMsgId,
  }) : super._();

  /// Deserialize.
  factory RpcDropAnswer.deserialize(Uint8List buffer) {
    // final reqMsgId = _readlong(buffer);
    // final result = RpcDropAnswer(reqMsgId: reqMsgId,);

    // return result;

    throw Exception();
  }

  /// Req Msg Id.
  final int reqMsgId;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x58e4a740);
    buffer.writeInt64(reqMsgId);
  }
}

/// Get Future Salts.
///
/// ID: `b921bd04`.
class GetFutureSalts extends TlMethod<FutureSaltsBase> {
  /// Get Future Salts constructor.
  const GetFutureSalts({
    required this.num,
  }) : super._();

  /// Deserialize.
  factory GetFutureSalts.deserialize(Uint8List buffer) {
    // final num = _readint(buffer);
    // final result = GetFutureSalts(num: num,);

    // return result;

    throw Exception();
  }

  /// Num.
  final int num;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xb921bd04);
    buffer.writeInt32(num);
  }
}

/// Ping.
///
/// ID: `7abe77ec`.
class Ping extends TlMethod<PongBase> {
  /// Ping constructor.
  const Ping({
    required this.pingId,
  }) : super._();

  /// Deserialize.
  factory Ping.deserialize(Uint8List buffer) {
    // final pingId = _readlong(buffer);
    // final result = Ping(pingId: pingId,);

    // return result;

    throw Exception();
  }

  /// Ping Id.
  final int pingId;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x7abe77ec);
    buffer.writeInt64(pingId);
  }
}

/// Ping Delay Disconnect.
///
/// ID: `f3427b8c`.
class PingDelayDisconnect extends TlMethod<PongBase> {
  /// Ping Delay Disconnect constructor.
  const PingDelayDisconnect({
    required this.pingId,
    required this.disconnectDelay,
  }) : super._();

  /// Deserialize.
  factory PingDelayDisconnect.deserialize(Uint8List buffer) {
    // final pingId = _readlong(buffer);
    // final disconnectDelay = _readint(buffer);
    // final result = PingDelayDisconnect(pingId: pingId, disconnectDelay: disconnectDelay,);

    // return result;

    throw Exception();
  }

  /// Ping Id.
  final int pingId;

  /// Disconnect Delay.
  final int disconnectDelay;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xf3427b8c);
    buffer.writeInt64(pingId);
    buffer.writeInt32(disconnectDelay);
  }
}

/// Destroy Session.
///
/// ID: `e7512126`.
class DestroySession extends TlMethod<DestroySessionResBase> {
  /// Destroy Session constructor.
  const DestroySession({
    required this.sessionId,
  }) : super._();

  /// Deserialize.
  factory DestroySession.deserialize(Uint8List buffer) {
    // final sessionId = _readlong(buffer);
    // final result = DestroySession(sessionId: sessionId,);

    // return result;

    throw Exception();
  }

  /// Session Id.
  final int sessionId;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xe7512126);
    buffer.writeInt64(sessionId);
  }
}

/// Http Wait.
///
/// ID: `9299359f`.
class HttpWait extends TlMethod<HttpWait> {
  /// Http Wait constructor.
  const HttpWait({
    required this.maxDelay,
    required this.waitAfter,
    required this.maxWait,
  }) : super._();

  /// Deserialize.
  factory HttpWait.deserialize(Uint8List buffer) {
    // final maxDelay = _readint(buffer);
    // final waitAfter = _readint(buffer);
    // final maxWait = _readint(buffer);
    // final result = HttpWait(maxDelay: maxDelay, waitAfter: waitAfter, maxWait: maxWait,);

    // return result;

    throw Exception();
  }

  /// Max Delay.
  final int maxDelay;

  /// Wait After.
  final int waitAfter;

  /// Max Wait.
  final int maxWait;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x9299359f);
    buffer.writeInt32(maxDelay);
    buffer.writeInt32(waitAfter);
    buffer.writeInt32(maxWait);
  }
}

/// Destroy Auth Key.
///
/// ID: `d1435160`.
class DestroyAuthKey extends TlMethod<DestroyAuthKeyResBase> {
  /// Destroy Auth Key constructor.
  const DestroyAuthKey() : super._();

  /// Deserialize.
  factory DestroyAuthKey.deserialize(Uint8List buffer) {
    // final result = DestroyAuthKey();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xd1435160);
  }
}
