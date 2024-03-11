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
  const DCSession(
    this.id,
    this.authKeyID,
    this.authKey,
    this.userId,
    this.oldSalt,
    this.salt,
    this.salts,
    this.seqno,
    this.serverTicksOffset,
    this.lastSentMsgId,
    this.dataCenter,
    this.withoutUpdates,
    this.layer,
  );

  /// Long.
  final int id;

  /// Long.
  final int authKeyID;

  /// Auth Key.
  final Uint8List authKey; // 2048-bit = 256 bytes

  /// Long.
  final int userId;

  /// Long.
  /// still accepted for a further 1800 seconds
  final int oldSalt;

  /// Long.
  final int salt;

  /// Long.
  /// TODO (xclud): SortedMap.
  final Map<DateTime, int> salts;

  /// Seq No.
  final int seqno;

  /// Long.
  final int serverTicksOffset;

  /// Long.
  final int lastSentMsgId;

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
