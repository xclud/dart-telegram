part of '../tg.dart';

class Client {
  Client({
    required this.apiId,
    required this.receiver,
    required this.sender,
    //required this.sessionStore,
  });

  /// API Id.
  final int apiId;
  final Stream<Uint8List> receiver;
  final Sink<List<int>> sender;
  //final SessionStore sessionStore;

  DCSession? _dcSession;

  final List<int> _msgsToAck = [];
  MsgsAck? _checkMsgsToAck() {
    if (_msgsToAck.isEmpty) {
      return null;
    }

    final msgsAck = MsgsAck(msgIds: [..._msgsToAck]);
    _msgsToAck.clear();
    return msgsAck;
  }

  // Future<void> send(TlObject msg, bool isContent) async {
  //   final dcSession = _dcSession!;
  //   isContent &= dcSession.authKeyID != 0;

  //   final msgId = await _newMessageId(false);

  //   final container = MsgContainer(
  //     messages: [
  //       Msg(msgId: msgId.msgId, seqno: msgId.seqno, body: msg),
  //       Msg(msgId: ackId, seqno: ackSeqno, body: msgsAck),
  //     ],
  //   );
  // }

  // Future<_MessageIdSeq> _newMessageId(bool isContent) async {
  //   final dcSession = _dcSession!;
  //   int seqno;
  //   var msgId = DateTime.now().toUtc().ticks +
  //       dcSession.serverTicksOffset -
  //       621355968000000000;
  //   msgId = msgId * 428 +
  //       (msgId >> 24) *
  //           25110956; // approximately unixtime*2^32 and divisible by 4

  //   if (msgId <= dcSession.lastSentMsgId) {
  //     msgId = dcSession.lastSentMsgId += 4;
  //   } else {
  //     dcSession.lastSentMsgId = msgId;
  //   }

  //   seqno = isContent ? dcSession.seqno++ * 2 + 1 : dcSession.seqno * 2;
  //   await sessionStore.save(/*_session*/);

  //   return _MessageIdSeq(msgId, seqno);
  // }

  /// Invoke.
  Future<X> invoke<X>(TlMethod<X> query) async {
    final buffer = <int>[];
    query.serialize(buffer);

    sender.add(buffer);

    throw Exception();
  }

  Future<X> invokeWithLayer<X>(int layer, TlMethod<X> query) =>
      invoke(InvokeWithLayer<X>(layer: layer, query: query));
}

class _MessageIdSeq {
  const _MessageIdSeq(this.msgId, this.seqno);
  final int msgId;
  final int seqno;
}
