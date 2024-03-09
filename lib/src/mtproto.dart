part of '../tg.dart';

// From https://core.telegram.org/schema/mtproto

/// RSA Public Key
///
/// ID: `7a19cb76`.
class RSAPublicKey extends TlObject {
  /// Constructor.
  const RSAPublicKey(this.n, this.e) : super._();

  /// N
  final Uint8List n;

  /// E
  final Uint8List e;

  @override
  int serialize(List<int> buffer) {
    throw UnimplementedError();
  }
}

/// Rpc Result
///
/// ID: `f35c6d01`.
class RpcResult extends TlObject {
  /// Constructor.
  const RpcResult(this.reqMsgId, this.result) : super._();

  /// Long.
  final int reqMsgId;

  /// Result.
  final Object result;

  @override
  int serialize(List<int> buffer) {
    throw UnimplementedError();
  }
}

/// Message
///
/// ID: `5bb8e511`.
class MsgMessage extends TlObject {
  /// Constructor.
  MsgMessage(this.msgId, this.seqNo, this.bytes, this.body) : super._();

  /// Long.
  final int msgId;

  /// Seq No.
  final int seqNo;

  /// Bytes.
  final int bytes;

  /// Body.
  final TlObject? body;

  @override
  int serialize(List<int> buffer) {
    throw UnimplementedError();
  }
}

/// Message Container
///
/// ID: `73f1f8dc`.
class MsgContainer extends TlObject {
  /// Constructor.
  const MsgContainer(this.messages) : super._();

  /// Messages
  final List<MsgMessage> messages;

  @override
  int serialize(List<int> buffer) {
    throw UnimplementedError();
  }
}

/// Message Copy
///
/// ID: `e06046b2`.
class MsgCopy extends TlObject {
  /// Constructor.
  const MsgCopy(this.origMessage) : super._();

  /// Original Message.
  final MsgMessage origMessage;

  @override
  int serialize(List<int> buffer) {
    throw UnimplementedError();
  }
}

/// Gzip Packed
///
/// ID: `3072cfa1`.
class GzipPacked extends TlObject {
  /// Constructor.
  const GzipPacked(this.packedData) : super._();

  /// Packed data.
  final Uint8List packedData;

  @override
  int serialize(List<int> buffer) {
    throw UnimplementedError();
  }
}
