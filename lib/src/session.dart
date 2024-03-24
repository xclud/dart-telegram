part of '../tg.dart';

class Session {
  Session(
    this.apiId,
    this.userId,
    this.mainDC,
    this.dcSessions,
    this.dcOptions,
  );

  final int apiId;

  /// User Id, Long.
  final int userId;

  /// Main DC.
  final int mainDC;

  /// Sessions.
  final Map<int, DCSession> dcSessions;

  /// Options.
  final List<DcOptionBase> dcOptions;
}

class DCSession {
  DCSession({
    required this.id,
    this.authKeyID = 0,
    this.authKey,
    this.userId = 0,
    this.oldSalt = 0,
    this.salt = 0,
    this.salts,
    this.seqno = 0,
    this.serverTicksOffset = 0,
    this.lastSentMsgId = 0,
    this.dataCenter,
    this.withoutUpdates = false,
    this.layer = 0,
  });

  /// Long.
  final int id;

  /// Long.
  int authKeyID;

  /// Auth Key.
  Uint8List? authKey; // 2048-bit = 256 bytes

  /// Long.
  int userId;

  /// Long.
  /// still accepted for a further 1800 seconds
  final int oldSalt;

  /// Long.
  final int salt;

  /// Long.
  /// TODO (xclud): SortedMap.
  Map<DateTime, int>? salts;

  /// Seq No.
  int seqno;

  /// Long.
  int serverTicksOffset;

  /// Long.
  int lastSentMsgId;

  /// DC.
  final DcOptionBase? dataCenter;

  /// Without Updates.
  final bool withoutUpdates;

  /// Layer
  final int layer;
}

abstract class SessionStore {
  Future<void> save();
}
