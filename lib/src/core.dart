part of '../tg.dart';

/// Telegram object class.
abstract class TlObject {
  /// Constructor.
  const TlObject._();
}

/// Base Constructor class.
abstract class TlConstructor extends TlObject {
  /// Constructor.
  const TlConstructor._() : super._();
}

/// Base Method class.
abstract class TlMethod<ReturnType> extends TlObject {
  /// Constructor.
  const TlMethod._() : super._();
}

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
    this.OldSalt,
    this.Salt,
    this.Salts,
    this.Seqno,
    this.ServerTicksOffset,
    this.LastSentMsgId,
    this.DataCenter,
    this.WithoutUpdates,
    this.Layer,
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
  final int OldSalt;

  /// Long.
  final int Salt;

  /// Long.
  /// TODO (xclud): SortedMap.
  final Map<DateTime, int> Salts;

  /// Seq No.
  final int Seqno;

  /// Long.
  final int ServerTicksOffset;

  /// Long.
  final int LastSentMsgId;

  /// DC.
  final DcOptionBase? DataCenter;

  /// Without Updates.
  final bool WithoutUpdates;

  /// Layer
  final int Layer;
}
