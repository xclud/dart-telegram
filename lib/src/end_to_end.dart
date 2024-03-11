part of '../tg.dart';

/// Predicate Decrypted Message.
abstract class DecryptedMessageBase extends TlConstructor {
  /// Predicate Decrypted Message constructor.
  const DecryptedMessageBase._() : super._();
}

/// Decrypted Message.
///
/// Layer: 8.
/// ID: `1f814f1f`.
class DecryptedMessage008 extends DecryptedMessageBase {
  /// Decrypted Message constructor.
  const DecryptedMessage008({
    required this.randomId,
    required this.randomBytes,
    required this.message,
    required this.media,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessage008.deserialize(Uint8List buffer) {
    // final randomId = _readlong(buffer);
    // final randomBytes = _readbytes(buffer);
    // final message = _readstring(buffer);
    // final media = _readDecryptedMessageMedia(buffer);
    // final result = DecryptedMessage008(randomId: randomId, randomBytes: randomBytes, message: message, media: media,);

    // return result;

    throw Exception();
  }

  /// Random Id.
  final int randomId;

  /// Random Bytes.
  final Uint8List randomBytes;

  /// Message.
  final String message;

  /// Media.
  final DecryptedMessageMediaBase media;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x1f814f1f);
    buffer.writeInt64(randomId);
    buffer.writeBytes(randomBytes);
    buffer.writeString(message);
    buffer.writeObject(media);
  }
}

/// Decrypted Message.
///
/// Layer: 17.
/// ID: `204d3878`.
class DecryptedMessage017 extends DecryptedMessageBase {
  /// Decrypted Message constructor.
  const DecryptedMessage017({
    required this.randomId,
    required this.ttl,
    required this.message,
    required this.media,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessage017.deserialize(Uint8List buffer) {
    // final randomId = _readlong(buffer);
    // final ttl = _readint(buffer);
    // final message = _readstring(buffer);
    // final media = _readDecryptedMessageMedia(buffer);
    // final result = DecryptedMessage017(randomId: randomId, ttl: ttl, message: message, media: media,);

    // return result;

    throw Exception();
  }

  /// Random Id.
  final int randomId;

  /// Ttl.
  final int ttl;

  /// Message.
  final String message;

  /// Media.
  final DecryptedMessageMediaBase media;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x204d3878);
    buffer.writeInt64(randomId);
    buffer.writeInt32(ttl);
    buffer.writeString(message);
    buffer.writeObject(media);
  }
}

/// Decrypted Message.
///
/// Layer: 45.
/// ID: `36b091de`.
class DecryptedMessage045 extends DecryptedMessageBase {
  /// Decrypted Message constructor.
  const DecryptedMessage045({
    required this.randomId,
    required this.ttl,
    required this.message,
    this.media,
    this.entities,
    this.viaBotName,
    this.replyToRandomId,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessage045.deserialize(Uint8List buffer) {
    // final flags = _read#(buffer);
    // final randomId = _readlong(buffer);
    // final ttl = _readint(buffer);
    // final message = _readstring(buffer);
    // final media = _readflags.9?DecryptedMessageMedia(buffer);
    // final entities = _readflags.7?Vector<MessageEntity>(buffer);
    // final viaBotName = _readflags.11?string(buffer);
    // final replyToRandomId = _readflags.3?long(buffer);
    // final result = DecryptedMessage045(flags: flags, randomId: randomId, ttl: ttl, message: message, media: media, entities: entities, viaBotName: viaBotName, replyToRandomId: replyToRandomId,);

    // return result;

    throw Exception();
  }

  /// Flags.
  int get flags {
    final v = _flag(
      b09: media != null,
      b07: entities != null,
      b11: viaBotName != null,
      b03: replyToRandomId != null,
    );

    return v;
  }

  /// Random Id.
  final int randomId;

  /// Ttl.
  final int ttl;

  /// Message.
  final String message;

  /// Media.
  final DecryptedMessageMediaBase? media;

  /// Entities.
  final List<MessageEntityBase>? entities;

  /// Via Bot Name.
  final String? viaBotName;

  /// Reply To Random Id.
  final int? replyToRandomId;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x36b091de);
    buffer.writeInt32(flags);
    buffer.writeInt64(randomId);
    buffer.writeInt32(ttl);
    buffer.writeString(message);
    final localMediaCopy = media;
    if (localMediaCopy != null) {
      buffer.writeObject(localMediaCopy);
    }
    final localEntitiesCopy = entities;
    if (localEntitiesCopy != null) {
      buffer.writeVectorObject(localEntitiesCopy);
    }
    final localViaBotNameCopy = viaBotName;
    if (localViaBotNameCopy != null) {
      buffer.writeString(localViaBotNameCopy);
    }
    final localReplyToRandomIdCopy = replyToRandomId;
    if (localReplyToRandomIdCopy != null) {
      buffer.writeInt64(localReplyToRandomIdCopy);
    }
  }
}

/// Decrypted Message.
///
/// Layer: 73.
/// ID: `91cc4674`.
class DecryptedMessage073 extends DecryptedMessageBase {
  /// Decrypted Message constructor.
  const DecryptedMessage073({
    required this.randomId,
    required this.ttl,
    required this.message,
    this.media,
    this.entities,
    this.viaBotName,
    this.replyToRandomId,
    this.groupedId,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessage073.deserialize(Uint8List buffer) {
    // final flags = _read#(buffer);
    // final randomId = _readlong(buffer);
    // final ttl = _readint(buffer);
    // final message = _readstring(buffer);
    // final media = _readflags.9?DecryptedMessageMedia(buffer);
    // final entities = _readflags.7?Vector<MessageEntity>(buffer);
    // final viaBotName = _readflags.11?string(buffer);
    // final replyToRandomId = _readflags.3?long(buffer);
    // final groupedId = _readflags.17?long(buffer);
    // final result = DecryptedMessage073(flags: flags, randomId: randomId, ttl: ttl, message: message, media: media, entities: entities, viaBotName: viaBotName, replyToRandomId: replyToRandomId, groupedId: groupedId,);

    // return result;

    throw Exception();
  }

  /// Flags.
  int get flags {
    final v = _flag(
      b09: media != null,
      b07: entities != null,
      b11: viaBotName != null,
      b03: replyToRandomId != null,
      b17: groupedId != null,
    );

    return v;
  }

  /// Random Id.
  final int randomId;

  /// Ttl.
  final int ttl;

  /// Message.
  final String message;

  /// Media.
  final DecryptedMessageMediaBase? media;

  /// Entities.
  final List<MessageEntityBase>? entities;

  /// Via Bot Name.
  final String? viaBotName;

  /// Reply To Random Id.
  final int? replyToRandomId;

  /// Grouped Id.
  final int? groupedId;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x91cc4674);
    buffer.writeInt32(flags);
    buffer.writeInt64(randomId);
    buffer.writeInt32(ttl);
    buffer.writeString(message);
    final localMediaCopy = media;
    if (localMediaCopy != null) {
      buffer.writeObject(localMediaCopy);
    }
    final localEntitiesCopy = entities;
    if (localEntitiesCopy != null) {
      buffer.writeVectorObject(localEntitiesCopy);
    }
    final localViaBotNameCopy = viaBotName;
    if (localViaBotNameCopy != null) {
      buffer.writeString(localViaBotNameCopy);
    }
    final localReplyToRandomIdCopy = replyToRandomId;
    if (localReplyToRandomIdCopy != null) {
      buffer.writeInt64(localReplyToRandomIdCopy);
    }
    final localGroupedIdCopy = groupedId;
    if (localGroupedIdCopy != null) {
      buffer.writeInt64(localGroupedIdCopy);
    }
  }
}

/// Decrypted Message Service.
///
/// Layer: 8.
/// ID: `aa48327d`.
class DecryptedMessageService008 extends DecryptedMessageBase {
  /// Decrypted Message Service constructor.
  const DecryptedMessageService008({
    required this.randomId,
    required this.randomBytes,
    required this.action,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageService008.deserialize(Uint8List buffer) {
    // final randomId = _readlong(buffer);
    // final randomBytes = _readbytes(buffer);
    // final action = _readDecryptedMessageAction(buffer);
    // final result = DecryptedMessageService008(randomId: randomId, randomBytes: randomBytes, action: action,);

    // return result;

    throw Exception();
  }

  /// Random Id.
  final int randomId;

  /// Random Bytes.
  final Uint8List randomBytes;

  /// Action.
  final DecryptedMessageActionBase action;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xaa48327d);
    buffer.writeInt64(randomId);
    buffer.writeBytes(randomBytes);
    buffer.writeObject(action);
  }
}

/// Decrypted Message Service.
///
/// Layer: 17.
/// ID: `73164160`.
class DecryptedMessageService017 extends DecryptedMessageBase {
  /// Decrypted Message Service constructor.
  const DecryptedMessageService017({
    required this.randomId,
    required this.action,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageService017.deserialize(Uint8List buffer) {
    // final randomId = _readlong(buffer);
    // final action = _readDecryptedMessageAction(buffer);
    // final result = DecryptedMessageService017(randomId: randomId, action: action,);

    // return result;

    throw Exception();
  }

  /// Random Id.
  final int randomId;

  /// Action.
  final DecryptedMessageActionBase action;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x73164160);
    buffer.writeInt64(randomId);
    buffer.writeObject(action);
  }
}

/// Predicate Decrypted Message Media.
abstract class DecryptedMessageMediaBase extends TlConstructor {
  /// Predicate Decrypted Message Media constructor.
  const DecryptedMessageMediaBase._() : super._();
}

/// Decrypted Message Media Empty.
///
/// Layer: 8.
/// ID: `089f5c4a`.
class DecryptedMessageMediaEmpty008 extends DecryptedMessageMediaBase {
  /// Decrypted Message Media Empty constructor.
  const DecryptedMessageMediaEmpty008() : super._();

  /// Deserialize.
  factory DecryptedMessageMediaEmpty008.deserialize(Uint8List buffer) {
    // final result = DecryptedMessageMediaEmpty008();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x089f5c4a);
  }
}

/// Decrypted Message Media Photo.
///
/// Layer: 8.
/// ID: `32798a8c`.
class DecryptedMessageMediaPhoto008 extends DecryptedMessageMediaBase {
  /// Decrypted Message Media Photo constructor.
  const DecryptedMessageMediaPhoto008({
    required this.thumb,
    required this.thumbW,
    required this.thumbH,
    required this.w,
    required this.h,
    required this.size,
    required this.key,
    required this.iv,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageMediaPhoto008.deserialize(Uint8List buffer) {
    // final thumb = _readbytes(buffer);
    // final thumbW = _readint(buffer);
    // final thumbH = _readint(buffer);
    // final w = _readint(buffer);
    // final h = _readint(buffer);
    // final size = _readint(buffer);
    // final key = _readbytes(buffer);
    // final iv = _readbytes(buffer);
    // final result = DecryptedMessageMediaPhoto008(thumb: thumb, thumbW: thumbW, thumbH: thumbH, w: w, h: h, size: size, key: key, iv: iv,);

    // return result;

    throw Exception();
  }

  /// Thumb.
  final Uint8List thumb;

  /// Thumb W.
  final int thumbW;

  /// Thumb H.
  final int thumbH;

  /// W.
  final int w;

  /// H.
  final int h;

  /// Size.
  final int size;

  /// Key.
  final Uint8List key;

  /// Iv.
  final Uint8List iv;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x32798a8c);
    buffer.writeBytes(thumb);
    buffer.writeInt32(thumbW);
    buffer.writeInt32(thumbH);
    buffer.writeInt32(w);
    buffer.writeInt32(h);
    buffer.writeInt32(size);
    buffer.writeBytes(key);
    buffer.writeBytes(iv);
  }
}

/// Decrypted Message Media Photo.
///
/// Layer: 45.
/// ID: `f1fa8d78`.
class DecryptedMessageMediaPhoto045 extends DecryptedMessageMediaBase {
  /// Decrypted Message Media Photo constructor.
  const DecryptedMessageMediaPhoto045({
    required this.thumb,
    required this.thumbW,
    required this.thumbH,
    required this.w,
    required this.h,
    required this.size,
    required this.key,
    required this.iv,
    required this.caption,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageMediaPhoto045.deserialize(Uint8List buffer) {
    // final thumb = _readbytes(buffer);
    // final thumbW = _readint(buffer);
    // final thumbH = _readint(buffer);
    // final w = _readint(buffer);
    // final h = _readint(buffer);
    // final size = _readint(buffer);
    // final key = _readbytes(buffer);
    // final iv = _readbytes(buffer);
    // final caption = _readstring(buffer);
    // final result = DecryptedMessageMediaPhoto045(thumb: thumb, thumbW: thumbW, thumbH: thumbH, w: w, h: h, size: size, key: key, iv: iv, caption: caption,);

    // return result;

    throw Exception();
  }

  /// Thumb.
  final Uint8List thumb;

  /// Thumb W.
  final int thumbW;

  /// Thumb H.
  final int thumbH;

  /// W.
  final int w;

  /// H.
  final int h;

  /// Size.
  final int size;

  /// Key.
  final Uint8List key;

  /// Iv.
  final Uint8List iv;

  /// Caption.
  final String caption;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xf1fa8d78);
    buffer.writeBytes(thumb);
    buffer.writeInt32(thumbW);
    buffer.writeInt32(thumbH);
    buffer.writeInt32(w);
    buffer.writeInt32(h);
    buffer.writeInt32(size);
    buffer.writeBytes(key);
    buffer.writeBytes(iv);
    buffer.writeString(caption);
  }
}

/// Decrypted Message Media Video.
///
/// Layer: 8.
/// ID: `4cee6ef3`.
class DecryptedMessageMediaVideo008 extends DecryptedMessageMediaBase {
  /// Decrypted Message Media Video constructor.
  const DecryptedMessageMediaVideo008({
    required this.thumb,
    required this.thumbW,
    required this.thumbH,
    required this.duration,
    required this.w,
    required this.h,
    required this.size,
    required this.key,
    required this.iv,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageMediaVideo008.deserialize(Uint8List buffer) {
    // final thumb = _readbytes(buffer);
    // final thumbW = _readint(buffer);
    // final thumbH = _readint(buffer);
    // final duration = _readint(buffer);
    // final w = _readint(buffer);
    // final h = _readint(buffer);
    // final size = _readint(buffer);
    // final key = _readbytes(buffer);
    // final iv = _readbytes(buffer);
    // final result = DecryptedMessageMediaVideo008(thumb: thumb, thumbW: thumbW, thumbH: thumbH, duration: duration, w: w, h: h, size: size, key: key, iv: iv,);

    // return result;

    throw Exception();
  }

  /// Thumb.
  final Uint8List thumb;

  /// Thumb W.
  final int thumbW;

  /// Thumb H.
  final int thumbH;

  /// Duration.
  final int duration;

  /// W.
  final int w;

  /// H.
  final int h;

  /// Size.
  final int size;

  /// Key.
  final Uint8List key;

  /// Iv.
  final Uint8List iv;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x4cee6ef3);
    buffer.writeBytes(thumb);
    buffer.writeInt32(thumbW);
    buffer.writeInt32(thumbH);
    buffer.writeInt32(duration);
    buffer.writeInt32(w);
    buffer.writeInt32(h);
    buffer.writeInt32(size);
    buffer.writeBytes(key);
    buffer.writeBytes(iv);
  }
}

/// Decrypted Message Media Video.
///
/// Layer: 17.
/// ID: `524a415d`.
class DecryptedMessageMediaVideo017 extends DecryptedMessageMediaBase {
  /// Decrypted Message Media Video constructor.
  const DecryptedMessageMediaVideo017({
    required this.thumb,
    required this.thumbW,
    required this.thumbH,
    required this.duration,
    required this.mimeType,
    required this.w,
    required this.h,
    required this.size,
    required this.key,
    required this.iv,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageMediaVideo017.deserialize(Uint8List buffer) {
    // final thumb = _readbytes(buffer);
    // final thumbW = _readint(buffer);
    // final thumbH = _readint(buffer);
    // final duration = _readint(buffer);
    // final mimeType = _readstring(buffer);
    // final w = _readint(buffer);
    // final h = _readint(buffer);
    // final size = _readint(buffer);
    // final key = _readbytes(buffer);
    // final iv = _readbytes(buffer);
    // final result = DecryptedMessageMediaVideo017(thumb: thumb, thumbW: thumbW, thumbH: thumbH, duration: duration, mimeType: mimeType, w: w, h: h, size: size, key: key, iv: iv,);

    // return result;

    throw Exception();
  }

  /// Thumb.
  final Uint8List thumb;

  /// Thumb W.
  final int thumbW;

  /// Thumb H.
  final int thumbH;

  /// Duration.
  final int duration;

  /// Mime Type.
  final String mimeType;

  /// W.
  final int w;

  /// H.
  final int h;

  /// Size.
  final int size;

  /// Key.
  final Uint8List key;

  /// Iv.
  final Uint8List iv;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x524a415d);
    buffer.writeBytes(thumb);
    buffer.writeInt32(thumbW);
    buffer.writeInt32(thumbH);
    buffer.writeInt32(duration);
    buffer.writeString(mimeType);
    buffer.writeInt32(w);
    buffer.writeInt32(h);
    buffer.writeInt32(size);
    buffer.writeBytes(key);
    buffer.writeBytes(iv);
  }
}

/// Decrypted Message Media Video.
///
/// Layer: 45.
/// ID: `970c8c0e`.
class DecryptedMessageMediaVideo045 extends DecryptedMessageMediaBase {
  /// Decrypted Message Media Video constructor.
  const DecryptedMessageMediaVideo045({
    required this.thumb,
    required this.thumbW,
    required this.thumbH,
    required this.duration,
    required this.mimeType,
    required this.w,
    required this.h,
    required this.size,
    required this.key,
    required this.iv,
    required this.caption,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageMediaVideo045.deserialize(Uint8List buffer) {
    // final thumb = _readbytes(buffer);
    // final thumbW = _readint(buffer);
    // final thumbH = _readint(buffer);
    // final duration = _readint(buffer);
    // final mimeType = _readstring(buffer);
    // final w = _readint(buffer);
    // final h = _readint(buffer);
    // final size = _readint(buffer);
    // final key = _readbytes(buffer);
    // final iv = _readbytes(buffer);
    // final caption = _readstring(buffer);
    // final result = DecryptedMessageMediaVideo045(thumb: thumb, thumbW: thumbW, thumbH: thumbH, duration: duration, mimeType: mimeType, w: w, h: h, size: size, key: key, iv: iv, caption: caption,);

    // return result;

    throw Exception();
  }

  /// Thumb.
  final Uint8List thumb;

  /// Thumb W.
  final int thumbW;

  /// Thumb H.
  final int thumbH;

  /// Duration.
  final int duration;

  /// Mime Type.
  final String mimeType;

  /// W.
  final int w;

  /// H.
  final int h;

  /// Size.
  final int size;

  /// Key.
  final Uint8List key;

  /// Iv.
  final Uint8List iv;

  /// Caption.
  final String caption;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x970c8c0e);
    buffer.writeBytes(thumb);
    buffer.writeInt32(thumbW);
    buffer.writeInt32(thumbH);
    buffer.writeInt32(duration);
    buffer.writeString(mimeType);
    buffer.writeInt32(w);
    buffer.writeInt32(h);
    buffer.writeInt32(size);
    buffer.writeBytes(key);
    buffer.writeBytes(iv);
    buffer.writeString(caption);
  }
}

/// Decrypted Message Media Geo Point.
///
/// Layer: 8.
/// ID: `35480a59`.
class DecryptedMessageMediaGeoPoint008 extends DecryptedMessageMediaBase {
  /// Decrypted Message Media Geo Point constructor.
  const DecryptedMessageMediaGeoPoint008({
    required this.lat,
    required this.long,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageMediaGeoPoint008.deserialize(Uint8List buffer) {
    // final lat = _readdouble(buffer);
    // final long = _readdouble(buffer);
    // final result = DecryptedMessageMediaGeoPoint008(lat: lat, long: long,);

    // return result;

    throw Exception();
  }

  /// Lat.
  final double lat;

  /// Long.
  final double long;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x35480a59);
    buffer.writeDouble(lat);
    buffer.writeDouble(long);
  }
}

/// Decrypted Message Media Contact.
///
/// Layer: 8.
/// ID: `588a0a97`.
class DecryptedMessageMediaContact008 extends DecryptedMessageMediaBase {
  /// Decrypted Message Media Contact constructor.
  const DecryptedMessageMediaContact008({
    required this.phoneNumber,
    required this.firstName,
    required this.lastName,
    required this.userId,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageMediaContact008.deserialize(Uint8List buffer) {
    // final phoneNumber = _readstring(buffer);
    // final firstName = _readstring(buffer);
    // final lastName = _readstring(buffer);
    // final userId = _readint(buffer);
    // final result = DecryptedMessageMediaContact008(phoneNumber: phoneNumber, firstName: firstName, lastName: lastName, userId: userId,);

    // return result;

    throw Exception();
  }

  /// Phone Number.
  final String phoneNumber;

  /// First Name.
  final String firstName;

  /// Last Name.
  final String lastName;

  /// User Id.
  final int userId;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x588a0a97);
    buffer.writeString(phoneNumber);
    buffer.writeString(firstName);
    buffer.writeString(lastName);
    buffer.writeInt32(userId);
  }
}

/// Decrypted Message Media Document.
///
/// Layer: 8.
/// ID: `b095434b`.
class DecryptedMessageMediaDocument008 extends DecryptedMessageMediaBase {
  /// Decrypted Message Media Document constructor.
  const DecryptedMessageMediaDocument008({
    required this.thumb,
    required this.thumbW,
    required this.thumbH,
    required this.fileName,
    required this.mimeType,
    required this.size,
    required this.key,
    required this.iv,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageMediaDocument008.deserialize(Uint8List buffer) {
    // final thumb = _readbytes(buffer);
    // final thumbW = _readint(buffer);
    // final thumbH = _readint(buffer);
    // final fileName = _readstring(buffer);
    // final mimeType = _readstring(buffer);
    // final size = _readint(buffer);
    // final key = _readbytes(buffer);
    // final iv = _readbytes(buffer);
    // final result = DecryptedMessageMediaDocument008(thumb: thumb, thumbW: thumbW, thumbH: thumbH, fileName: fileName, mimeType: mimeType, size: size, key: key, iv: iv,);

    // return result;

    throw Exception();
  }

  /// Thumb.
  final Uint8List thumb;

  /// Thumb W.
  final int thumbW;

  /// Thumb H.
  final int thumbH;

  /// File Name.
  final String fileName;

  /// Mime Type.
  final String mimeType;

  /// Size.
  final int size;

  /// Key.
  final Uint8List key;

  /// Iv.
  final Uint8List iv;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xb095434b);
    buffer.writeBytes(thumb);
    buffer.writeInt32(thumbW);
    buffer.writeInt32(thumbH);
    buffer.writeString(fileName);
    buffer.writeString(mimeType);
    buffer.writeInt32(size);
    buffer.writeBytes(key);
    buffer.writeBytes(iv);
  }
}

/// Decrypted Message Media Document.
///
/// Layer: 45.
/// ID: `7afe8ae2`.
class DecryptedMessageMediaDocument045 extends DecryptedMessageMediaBase {
  /// Decrypted Message Media Document constructor.
  const DecryptedMessageMediaDocument045({
    required this.thumb,
    required this.thumbW,
    required this.thumbH,
    required this.mimeType,
    required this.size,
    required this.key,
    required this.iv,
    required this.attributes,
    required this.caption,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageMediaDocument045.deserialize(Uint8List buffer) {
    // final thumb = _readbytes(buffer);
    // final thumbW = _readint(buffer);
    // final thumbH = _readint(buffer);
    // final mimeType = _readstring(buffer);
    // final size = _readint(buffer);
    // final key = _readbytes(buffer);
    // final iv = _readbytes(buffer);
    // final attributes = _readVector<DocumentAttribute>(buffer);
    // final caption = _readstring(buffer);
    // final result = DecryptedMessageMediaDocument045(thumb: thumb, thumbW: thumbW, thumbH: thumbH, mimeType: mimeType, size: size, key: key, iv: iv, attributes: attributes, caption: caption,);

    // return result;

    throw Exception();
  }

  /// Thumb.
  final Uint8List thumb;

  /// Thumb W.
  final int thumbW;

  /// Thumb H.
  final int thumbH;

  /// Mime Type.
  final String mimeType;

  /// Size.
  final int size;

  /// Key.
  final Uint8List key;

  /// Iv.
  final Uint8List iv;

  /// Attributes.
  final List<DocumentAttributeBase> attributes;

  /// Caption.
  final String caption;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x7afe8ae2);
    buffer.writeBytes(thumb);
    buffer.writeInt32(thumbW);
    buffer.writeInt32(thumbH);
    buffer.writeString(mimeType);
    buffer.writeInt32(size);
    buffer.writeBytes(key);
    buffer.writeBytes(iv);
    buffer.writeVectorObject(attributes);
    buffer.writeString(caption);
  }
}

/// Decrypted Message Media Document.
///
/// Layer: 143.
/// ID: `6abd9782`.
class DecryptedMessageMediaDocument143 extends DecryptedMessageMediaBase {
  /// Decrypted Message Media Document constructor.
  const DecryptedMessageMediaDocument143({
    required this.thumb,
    required this.thumbW,
    required this.thumbH,
    required this.mimeType,
    required this.size,
    required this.key,
    required this.iv,
    required this.attributes,
    required this.caption,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageMediaDocument143.deserialize(Uint8List buffer) {
    // final thumb = _readbytes(buffer);
    // final thumbW = _readint(buffer);
    // final thumbH = _readint(buffer);
    // final mimeType = _readstring(buffer);
    // final size = _readlong(buffer);
    // final key = _readbytes(buffer);
    // final iv = _readbytes(buffer);
    // final attributes = _readVector<DocumentAttribute>(buffer);
    // final caption = _readstring(buffer);
    // final result = DecryptedMessageMediaDocument143(thumb: thumb, thumbW: thumbW, thumbH: thumbH, mimeType: mimeType, size: size, key: key, iv: iv, attributes: attributes, caption: caption,);

    // return result;

    throw Exception();
  }

  /// Thumb.
  final Uint8List thumb;

  /// Thumb W.
  final int thumbW;

  /// Thumb H.
  final int thumbH;

  /// Mime Type.
  final String mimeType;

  /// Size.
  final int size;

  /// Key.
  final Uint8List key;

  /// Iv.
  final Uint8List iv;

  /// Attributes.
  final List<DocumentAttributeBase> attributes;

  /// Caption.
  final String caption;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x6abd9782);
    buffer.writeBytes(thumb);
    buffer.writeInt32(thumbW);
    buffer.writeInt32(thumbH);
    buffer.writeString(mimeType);
    buffer.writeInt64(size);
    buffer.writeBytes(key);
    buffer.writeBytes(iv);
    buffer.writeVectorObject(attributes);
    buffer.writeString(caption);
  }
}

/// Decrypted Message Media Audio.
///
/// Layer: 8.
/// ID: `6080758f`.
class DecryptedMessageMediaAudio008 extends DecryptedMessageMediaBase {
  /// Decrypted Message Media Audio constructor.
  const DecryptedMessageMediaAudio008({
    required this.duration,
    required this.size,
    required this.key,
    required this.iv,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageMediaAudio008.deserialize(Uint8List buffer) {
    // final duration = _readint(buffer);
    // final size = _readint(buffer);
    // final key = _readbytes(buffer);
    // final iv = _readbytes(buffer);
    // final result = DecryptedMessageMediaAudio008(duration: duration, size: size, key: key, iv: iv,);

    // return result;

    throw Exception();
  }

  /// Duration.
  final int duration;

  /// Size.
  final int size;

  /// Key.
  final Uint8List key;

  /// Iv.
  final Uint8List iv;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x6080758f);
    buffer.writeInt32(duration);
    buffer.writeInt32(size);
    buffer.writeBytes(key);
    buffer.writeBytes(iv);
  }
}

/// Decrypted Message Media Audio.
///
/// Layer: 17.
/// ID: `57e0a9cb`.
class DecryptedMessageMediaAudio017 extends DecryptedMessageMediaBase {
  /// Decrypted Message Media Audio constructor.
  const DecryptedMessageMediaAudio017({
    required this.duration,
    required this.mimeType,
    required this.size,
    required this.key,
    required this.iv,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageMediaAudio017.deserialize(Uint8List buffer) {
    // final duration = _readint(buffer);
    // final mimeType = _readstring(buffer);
    // final size = _readint(buffer);
    // final key = _readbytes(buffer);
    // final iv = _readbytes(buffer);
    // final result = DecryptedMessageMediaAudio017(duration: duration, mimeType: mimeType, size: size, key: key, iv: iv,);

    // return result;

    throw Exception();
  }

  /// Duration.
  final int duration;

  /// Mime Type.
  final String mimeType;

  /// Size.
  final int size;

  /// Key.
  final Uint8List key;

  /// Iv.
  final Uint8List iv;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x57e0a9cb);
    buffer.writeInt32(duration);
    buffer.writeString(mimeType);
    buffer.writeInt32(size);
    buffer.writeBytes(key);
    buffer.writeBytes(iv);
  }
}

/// Decrypted Message Media External Document.
///
/// Layer: 23.
/// ID: `fa95b0dd`.
class DecryptedMessageMediaExternalDocument023
    extends DecryptedMessageMediaBase {
  /// Decrypted Message Media External Document constructor.
  const DecryptedMessageMediaExternalDocument023({
    required this.id,
    required this.accessHash,
    required this.date,
    required this.mimeType,
    required this.size,
    required this.thumb,
    required this.dcId,
    required this.attributes,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageMediaExternalDocument023.deserialize(
      Uint8List buffer) {
    // final id = _readlong(buffer);
    // final accessHash = _readlong(buffer);
    // final date = _readint(buffer);
    // final mimeType = _readstring(buffer);
    // final size = _readint(buffer);
    // final thumb = _readPhotoSize(buffer);
    // final dcId = _readint(buffer);
    // final attributes = _readVector<DocumentAttribute>(buffer);
    // final result = DecryptedMessageMediaExternalDocument023(id: id, accessHash: accessHash, date: date, mimeType: mimeType, size: size, thumb: thumb, dcId: dcId, attributes: attributes,);

    // return result;

    throw Exception();
  }

  /// Id.
  final int id;

  /// Access Hash.
  final int accessHash;

  /// Date.
  final DateTime date;

  /// Mime Type.
  final String mimeType;

  /// Size.
  final int size;

  /// Thumb.
  final PhotoSizeBase thumb;

  /// Dc Id.
  final int dcId;

  /// Attributes.
  final List<DocumentAttributeBase> attributes;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xfa95b0dd);
    buffer.writeInt64(id);
    buffer.writeInt64(accessHash);
    buffer.writeDateTime(date);
    buffer.writeString(mimeType);
    buffer.writeInt32(size);
    buffer.writeObject(thumb);
    buffer.writeInt32(dcId);
    buffer.writeVectorObject(attributes);
  }
}

/// Decrypted Message Media Venue.
///
/// Layer: 45.
/// ID: `8a0df56f`.
class DecryptedMessageMediaVenue045 extends DecryptedMessageMediaBase {
  /// Decrypted Message Media Venue constructor.
  const DecryptedMessageMediaVenue045({
    required this.lat,
    required this.long,
    required this.title,
    required this.address,
    required this.provider,
    required this.venueId,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageMediaVenue045.deserialize(Uint8List buffer) {
    // final lat = _readdouble(buffer);
    // final long = _readdouble(buffer);
    // final title = _readstring(buffer);
    // final address = _readstring(buffer);
    // final provider = _readstring(buffer);
    // final venueId = _readstring(buffer);
    // final result = DecryptedMessageMediaVenue045(lat: lat, long: long, title: title, address: address, provider: provider, venueId: venueId,);

    // return result;

    throw Exception();
  }

  /// Lat.
  final double lat;

  /// Long.
  final double long;

  /// Title.
  final String title;

  /// Address.
  final String address;

  /// Provider.
  final String provider;

  /// Venue Id.
  final String venueId;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x8a0df56f);
    buffer.writeDouble(lat);
    buffer.writeDouble(long);
    buffer.writeString(title);
    buffer.writeString(address);
    buffer.writeString(provider);
    buffer.writeString(venueId);
  }
}

/// Decrypted Message Media Web Page.
///
/// Layer: 45.
/// ID: `e50511d8`.
class DecryptedMessageMediaWebPage045 extends DecryptedMessageMediaBase {
  /// Decrypted Message Media Web Page constructor.
  const DecryptedMessageMediaWebPage045({
    required this.url,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageMediaWebPage045.deserialize(Uint8List buffer) {
    // final url = _readstring(buffer);
    // final result = DecryptedMessageMediaWebPage045(url: url,);

    // return result;

    throw Exception();
  }

  /// Url.
  final String url;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xe50511d8);
    buffer.writeString(url);
  }
}

/// Predicate Decrypted Message Action.
abstract class DecryptedMessageActionBase extends TlConstructor {
  /// Predicate Decrypted Message Action constructor.
  const DecryptedMessageActionBase._() : super._();
}

/// Decrypted Message Action Set Message T T L.
///
/// Layer: 8.
/// ID: `a1733aec`.
class DecryptedMessageActionSetMessageTTL008
    extends DecryptedMessageActionBase {
  /// Decrypted Message Action Set Message T T L constructor.
  const DecryptedMessageActionSetMessageTTL008({
    required this.ttlSeconds,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageActionSetMessageTTL008.deserialize(Uint8List buffer) {
    // final ttlSeconds = _readint(buffer);
    // final result = DecryptedMessageActionSetMessageTTL008(ttlSeconds: ttlSeconds,);

    // return result;

    throw Exception();
  }

  /// Ttl Seconds.
  final int ttlSeconds;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xa1733aec);
    buffer.writeInt32(ttlSeconds);
  }
}

/// Decrypted Message Action Read Messages.
///
/// Layer: 8.
/// ID: `0c4f40be`.
class DecryptedMessageActionReadMessages008 extends DecryptedMessageActionBase {
  /// Decrypted Message Action Read Messages constructor.
  const DecryptedMessageActionReadMessages008({
    required this.randomIds,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageActionReadMessages008.deserialize(Uint8List buffer) {
    // final randomIds = _readVector<long>(buffer);
    // final result = DecryptedMessageActionReadMessages008(randomIds: randomIds,);

    // return result;

    throw Exception();
  }

  /// Random Ids.
  final List<int> randomIds;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x0c4f40be);
    buffer.writeVectorInt64(randomIds);
  }
}

/// Decrypted Message Action Delete Messages.
///
/// Layer: 8.
/// ID: `65614304`.
class DecryptedMessageActionDeleteMessages008
    extends DecryptedMessageActionBase {
  /// Decrypted Message Action Delete Messages constructor.
  const DecryptedMessageActionDeleteMessages008({
    required this.randomIds,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageActionDeleteMessages008.deserialize(
      Uint8List buffer) {
    // final randomIds = _readVector<long>(buffer);
    // final result = DecryptedMessageActionDeleteMessages008(randomIds: randomIds,);

    // return result;

    throw Exception();
  }

  /// Random Ids.
  final List<int> randomIds;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x65614304);
    buffer.writeVectorInt64(randomIds);
  }
}

/// Decrypted Message Action Screenshot Messages.
///
/// Layer: 8.
/// ID: `8ac1f475`.
class DecryptedMessageActionScreenshotMessages008
    extends DecryptedMessageActionBase {
  /// Decrypted Message Action Screenshot Messages constructor.
  const DecryptedMessageActionScreenshotMessages008({
    required this.randomIds,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageActionScreenshotMessages008.deserialize(
      Uint8List buffer) {
    // final randomIds = _readVector<long>(buffer);
    // final result = DecryptedMessageActionScreenshotMessages008(randomIds: randomIds,);

    // return result;

    throw Exception();
  }

  /// Random Ids.
  final List<int> randomIds;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x8ac1f475);
    buffer.writeVectorInt64(randomIds);
  }
}

/// Decrypted Message Action Flush History.
///
/// Layer: 8.
/// ID: `6719e45c`.
class DecryptedMessageActionFlushHistory008 extends DecryptedMessageActionBase {
  /// Decrypted Message Action Flush History constructor.
  const DecryptedMessageActionFlushHistory008() : super._();

  /// Deserialize.
  factory DecryptedMessageActionFlushHistory008.deserialize(Uint8List buffer) {
    // final result = DecryptedMessageActionFlushHistory008();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x6719e45c);
  }
}

/// Decrypted Message Action Resend.
///
/// Layer: 17.
/// ID: `511110b0`.
class DecryptedMessageActionResend017 extends DecryptedMessageActionBase {
  /// Decrypted Message Action Resend constructor.
  const DecryptedMessageActionResend017({
    required this.startSeqNo,
    required this.endSeqNo,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageActionResend017.deserialize(Uint8List buffer) {
    // final startSeqNo = _readint(buffer);
    // final endSeqNo = _readint(buffer);
    // final result = DecryptedMessageActionResend017(startSeqNo: startSeqNo, endSeqNo: endSeqNo,);

    // return result;

    throw Exception();
  }

  /// Start Seq No.
  final int startSeqNo;

  /// End Seq No.
  final int endSeqNo;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x511110b0);
    buffer.writeInt32(startSeqNo);
    buffer.writeInt32(endSeqNo);
  }
}

/// Decrypted Message Action Notify Layer.
///
/// Layer: 17.
/// ID: `f3048883`.
class DecryptedMessageActionNotifyLayer017 extends DecryptedMessageActionBase {
  /// Decrypted Message Action Notify Layer constructor.
  const DecryptedMessageActionNotifyLayer017({
    required this.layer,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageActionNotifyLayer017.deserialize(Uint8List buffer) {
    // final layer = _readint(buffer);
    // final result = DecryptedMessageActionNotifyLayer017(layer: layer,);

    // return result;

    throw Exception();
  }

  /// Layer.
  final int layer;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xf3048883);
    buffer.writeInt32(layer);
  }
}

/// Decrypted Message Action Typing.
///
/// Layer: 17.
/// ID: `ccb27641`.
class DecryptedMessageActionTyping017 extends DecryptedMessageActionBase {
  /// Decrypted Message Action Typing constructor.
  const DecryptedMessageActionTyping017({
    required this.action,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageActionTyping017.deserialize(Uint8List buffer) {
    // final action = _readSendMessageAction(buffer);
    // final result = DecryptedMessageActionTyping017(action: action,);

    // return result;

    throw Exception();
  }

  /// Action.
  final SendMessageActionBase action;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xccb27641);
    buffer.writeObject(action);
  }
}

/// Decrypted Message Action Request Key.
///
/// Layer: 20.
/// ID: `f3c9611b`.
class DecryptedMessageActionRequestKey020 extends DecryptedMessageActionBase {
  /// Decrypted Message Action Request Key constructor.
  const DecryptedMessageActionRequestKey020({
    required this.exchangeId,
    required this.gA,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageActionRequestKey020.deserialize(Uint8List buffer) {
    // final exchangeId = _readlong(buffer);
    // final gA = _readbytes(buffer);
    // final result = DecryptedMessageActionRequestKey020(exchangeId: exchangeId, gA: gA,);

    // return result;

    throw Exception();
  }

  /// Exchange Id.
  final int exchangeId;

  /// G A.
  final Uint8List gA;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xf3c9611b);
    buffer.writeInt64(exchangeId);
    buffer.writeBytes(gA);
  }
}

/// Decrypted Message Action Accept Key.
///
/// Layer: 20.
/// ID: `6fe1735b`.
class DecryptedMessageActionAcceptKey020 extends DecryptedMessageActionBase {
  /// Decrypted Message Action Accept Key constructor.
  const DecryptedMessageActionAcceptKey020({
    required this.exchangeId,
    required this.gB,
    required this.keyFingerprint,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageActionAcceptKey020.deserialize(Uint8List buffer) {
    // final exchangeId = _readlong(buffer);
    // final gB = _readbytes(buffer);
    // final keyFingerprint = _readlong(buffer);
    // final result = DecryptedMessageActionAcceptKey020(exchangeId: exchangeId, gB: gB, keyFingerprint: keyFingerprint,);

    // return result;

    throw Exception();
  }

  /// Exchange Id.
  final int exchangeId;

  /// G B.
  final Uint8List gB;

  /// Key Fingerprint.
  final int keyFingerprint;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x6fe1735b);
    buffer.writeInt64(exchangeId);
    buffer.writeBytes(gB);
    buffer.writeInt64(keyFingerprint);
  }
}

/// Decrypted Message Action Abort Key.
///
/// Layer: 20.
/// ID: `dd05ec6b`.
class DecryptedMessageActionAbortKey020 extends DecryptedMessageActionBase {
  /// Decrypted Message Action Abort Key constructor.
  const DecryptedMessageActionAbortKey020({
    required this.exchangeId,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageActionAbortKey020.deserialize(Uint8List buffer) {
    // final exchangeId = _readlong(buffer);
    // final result = DecryptedMessageActionAbortKey020(exchangeId: exchangeId,);

    // return result;

    throw Exception();
  }

  /// Exchange Id.
  final int exchangeId;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xdd05ec6b);
    buffer.writeInt64(exchangeId);
  }
}

/// Decrypted Message Action Commit Key.
///
/// Layer: 20.
/// ID: `ec2e0b9b`.
class DecryptedMessageActionCommitKey020 extends DecryptedMessageActionBase {
  /// Decrypted Message Action Commit Key constructor.
  const DecryptedMessageActionCommitKey020({
    required this.exchangeId,
    required this.keyFingerprint,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageActionCommitKey020.deserialize(Uint8List buffer) {
    // final exchangeId = _readlong(buffer);
    // final keyFingerprint = _readlong(buffer);
    // final result = DecryptedMessageActionCommitKey020(exchangeId: exchangeId, keyFingerprint: keyFingerprint,);

    // return result;

    throw Exception();
  }

  /// Exchange Id.
  final int exchangeId;

  /// Key Fingerprint.
  final int keyFingerprint;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xec2e0b9b);
    buffer.writeInt64(exchangeId);
    buffer.writeInt64(keyFingerprint);
  }
}

/// Decrypted Message Action Noop.
///
/// Layer: 20.
/// ID: `a82fdd63`.
class DecryptedMessageActionNoop020 extends DecryptedMessageActionBase {
  /// Decrypted Message Action Noop constructor.
  const DecryptedMessageActionNoop020() : super._();

  /// Deserialize.
  factory DecryptedMessageActionNoop020.deserialize(Uint8List buffer) {
    // final result = DecryptedMessageActionNoop020();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xa82fdd63);
  }
}

/// Predicate Decrypted Message Layer.
abstract class DecryptedMessageLayerBase extends TlConstructor {
  /// Predicate Decrypted Message Layer constructor.
  const DecryptedMessageLayerBase._() : super._();
}

/// Decrypted Message Layer.
///
/// Layer: 17.
/// ID: `1be31789`.
class DecryptedMessageLayer017 extends DecryptedMessageLayerBase {
  /// Decrypted Message Layer constructor.
  const DecryptedMessageLayer017({
    required this.randomBytes,
    required this.layer,
    required this.inSeqNo,
    required this.outSeqNo,
    required this.message,
  }) : super._();

  /// Deserialize.
  factory DecryptedMessageLayer017.deserialize(Uint8List buffer) {
    // final randomBytes = _readbytes(buffer);
    // final layer = _readint(buffer);
    // final inSeqNo = _readint(buffer);
    // final outSeqNo = _readint(buffer);
    // final message = _readDecryptedMessage(buffer);
    // final result = DecryptedMessageLayer017(randomBytes: randomBytes, layer: layer, inSeqNo: inSeqNo, outSeqNo: outSeqNo, message: message,);

    // return result;

    throw Exception();
  }

  /// Random Bytes.
  final Uint8List randomBytes;

  /// Layer.
  final int layer;

  /// In Seq No.
  final int inSeqNo;

  /// Out Seq No.
  final int outSeqNo;

  /// Message.
  final DecryptedMessageBase message;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x1be31789);
    buffer.writeBytes(randomBytes);
    buffer.writeInt32(layer);
    buffer.writeInt32(inSeqNo);
    buffer.writeInt32(outSeqNo);
    buffer.writeObject(message);
  }
}

/// Send Message Typing Action.
///
/// Layer: 17.
/// ID: `16bf744e`.
class SendMessageTypingAction017 extends SendMessageActionBase {
  /// Send Message Typing Action constructor.
  const SendMessageTypingAction017() : super._();

  /// Deserialize.
  factory SendMessageTypingAction017.deserialize(Uint8List buffer) {
    // final result = SendMessageTypingAction017();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x16bf744e);
  }
}

/// Send Message Cancel Action.
///
/// Layer: 17.
/// ID: `fd5ec8f5`.
class SendMessageCancelAction017 extends SendMessageActionBase {
  /// Send Message Cancel Action constructor.
  const SendMessageCancelAction017() : super._();

  /// Deserialize.
  factory SendMessageCancelAction017.deserialize(Uint8List buffer) {
    // final result = SendMessageCancelAction017();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xfd5ec8f5);
  }
}

/// Send Message Record Video Action.
///
/// Layer: 17.
/// ID: `a187d66f`.
class SendMessageRecordVideoAction017 extends SendMessageActionBase {
  /// Send Message Record Video Action constructor.
  const SendMessageRecordVideoAction017() : super._();

  /// Deserialize.
  factory SendMessageRecordVideoAction017.deserialize(Uint8List buffer) {
    // final result = SendMessageRecordVideoAction017();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xa187d66f);
  }
}

/// Send Message Upload Video Action.
///
/// Layer: 17.
/// ID: `92042ff7`.
class SendMessageUploadVideoAction017 extends SendMessageActionBase {
  /// Send Message Upload Video Action constructor.
  const SendMessageUploadVideoAction017() : super._();

  /// Deserialize.
  factory SendMessageUploadVideoAction017.deserialize(Uint8List buffer) {
    // final result = SendMessageUploadVideoAction017();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x92042ff7);
  }
}

/// Send Message Record Audio Action.
///
/// Layer: 17.
/// ID: `d52f73f7`.
class SendMessageRecordAudioAction017 extends SendMessageActionBase {
  /// Send Message Record Audio Action constructor.
  const SendMessageRecordAudioAction017() : super._();

  /// Deserialize.
  factory SendMessageRecordAudioAction017.deserialize(Uint8List buffer) {
    // final result = SendMessageRecordAudioAction017();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xd52f73f7);
  }
}

/// Send Message Upload Audio Action.
///
/// Layer: 17.
/// ID: `e6ac8a6f`.
class SendMessageUploadAudioAction017 extends SendMessageActionBase {
  /// Send Message Upload Audio Action constructor.
  const SendMessageUploadAudioAction017() : super._();

  /// Deserialize.
  factory SendMessageUploadAudioAction017.deserialize(Uint8List buffer) {
    // final result = SendMessageUploadAudioAction017();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xe6ac8a6f);
  }
}

/// Send Message Upload Photo Action.
///
/// Layer: 17.
/// ID: `990a3c1a`.
class SendMessageUploadPhotoAction017 extends SendMessageActionBase {
  /// Send Message Upload Photo Action constructor.
  const SendMessageUploadPhotoAction017() : super._();

  /// Deserialize.
  factory SendMessageUploadPhotoAction017.deserialize(Uint8List buffer) {
    // final result = SendMessageUploadPhotoAction017();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x990a3c1a);
  }
}

/// Send Message Upload Document Action.
///
/// Layer: 17.
/// ID: `8faee98e`.
class SendMessageUploadDocumentAction017 extends SendMessageActionBase {
  /// Send Message Upload Document Action constructor.
  const SendMessageUploadDocumentAction017() : super._();

  /// Deserialize.
  factory SendMessageUploadDocumentAction017.deserialize(Uint8List buffer) {
    // final result = SendMessageUploadDocumentAction017();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x8faee98e);
  }
}

/// Send Message Geo Location Action.
///
/// Layer: 17.
/// ID: `176f8ba1`.
class SendMessageGeoLocationAction017 extends SendMessageActionBase {
  /// Send Message Geo Location Action constructor.
  const SendMessageGeoLocationAction017() : super._();

  /// Deserialize.
  factory SendMessageGeoLocationAction017.deserialize(Uint8List buffer) {
    // final result = SendMessageGeoLocationAction017();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x176f8ba1);
  }
}

/// Send Message Choose Contact Action.
///
/// Layer: 17.
/// ID: `628cbc6f`.
class SendMessageChooseContactAction017 extends SendMessageActionBase {
  /// Send Message Choose Contact Action constructor.
  const SendMessageChooseContactAction017() : super._();

  /// Deserialize.
  factory SendMessageChooseContactAction017.deserialize(Uint8List buffer) {
    // final result = SendMessageChooseContactAction017();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x628cbc6f);
  }
}

/// Send Message Record Round Action.
///
/// Layer: 66.
/// ID: `88f27fbc`.
class SendMessageRecordRoundAction066 extends SendMessageActionBase {
  /// Send Message Record Round Action constructor.
  const SendMessageRecordRoundAction066() : super._();

  /// Deserialize.
  factory SendMessageRecordRoundAction066.deserialize(Uint8List buffer) {
    // final result = SendMessageRecordRoundAction066();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x88f27fbc);
  }
}

/// Send Message Upload Round Action.
///
/// Layer: 66.
/// ID: `bb718624`.
class SendMessageUploadRoundAction066 extends SendMessageActionBase {
  /// Send Message Upload Round Action constructor.
  const SendMessageUploadRoundAction066() : super._();

  /// Deserialize.
  factory SendMessageUploadRoundAction066.deserialize(Uint8List buffer) {
    // final result = SendMessageUploadRoundAction066();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xbb718624);
  }
}

/// Document Attribute Image Size.
///
/// Layer: 23.
/// ID: `6c37c15c`.
class DocumentAttributeImageSize023 extends DocumentAttributeBase {
  /// Document Attribute Image Size constructor.
  const DocumentAttributeImageSize023({
    required this.w,
    required this.h,
  }) : super._();

  /// Deserialize.
  factory DocumentAttributeImageSize023.deserialize(Uint8List buffer) {
    // final w = _readint(buffer);
    // final h = _readint(buffer);
    // final result = DocumentAttributeImageSize023(w: w, h: h,);

    // return result;

    throw Exception();
  }

  /// W.
  final int w;

  /// H.
  final int h;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x6c37c15c);
    buffer.writeInt32(w);
    buffer.writeInt32(h);
  }
}

/// Document Attribute Animated.
///
/// Layer: 23.
/// ID: `11b58939`.
class DocumentAttributeAnimated023 extends DocumentAttributeBase {
  /// Document Attribute Animated constructor.
  const DocumentAttributeAnimated023() : super._();

  /// Deserialize.
  factory DocumentAttributeAnimated023.deserialize(Uint8List buffer) {
    // final result = DocumentAttributeAnimated023();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x11b58939);
  }
}

/// Document Attribute Sticker.
///
/// Layer: 23.
/// ID: `fb0a5727`.
class DocumentAttributeSticker023 extends DocumentAttributeBase {
  /// Document Attribute Sticker constructor.
  const DocumentAttributeSticker023() : super._();

  /// Deserialize.
  factory DocumentAttributeSticker023.deserialize(Uint8List buffer) {
    // final result = DocumentAttributeSticker023();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xfb0a5727);
  }
}

/// Document Attribute Sticker.
///
/// Layer: 45.
/// ID: `3a556302`.
class DocumentAttributeSticker045 extends DocumentAttributeBase {
  /// Document Attribute Sticker constructor.
  const DocumentAttributeSticker045({
    required this.alt,
    required this.stickerset,
  }) : super._();

  /// Deserialize.
  factory DocumentAttributeSticker045.deserialize(Uint8List buffer) {
    // final alt = _readstring(buffer);
    // final stickerset = _readInputStickerSet(buffer);
    // final result = DocumentAttributeSticker045(alt: alt, stickerset: stickerset,);

    // return result;

    throw Exception();
  }

  /// Alt.
  final String alt;

  /// Stickerset.
  final InputStickerSetBase stickerset;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x3a556302);
    buffer.writeString(alt);
    buffer.writeObject(stickerset);
  }
}

/// Document Attribute Video.
///
/// Layer: 23.
/// ID: `5910cccb`.
class DocumentAttributeVideo023 extends DocumentAttributeBase {
  /// Document Attribute Video constructor.
  const DocumentAttributeVideo023({
    required this.duration,
    required this.w,
    required this.h,
  }) : super._();

  /// Deserialize.
  factory DocumentAttributeVideo023.deserialize(Uint8List buffer) {
    // final duration = _readint(buffer);
    // final w = _readint(buffer);
    // final h = _readint(buffer);
    // final result = DocumentAttributeVideo023(duration: duration, w: w, h: h,);

    // return result;

    throw Exception();
  }

  /// Duration.
  final int duration;

  /// W.
  final int w;

  /// H.
  final int h;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x5910cccb);
    buffer.writeInt32(duration);
    buffer.writeInt32(w);
    buffer.writeInt32(h);
  }
}

/// Document Attribute Video.
///
/// Layer: 66.
/// ID: `0ef02ce6`.
class DocumentAttributeVideo066 extends DocumentAttributeBase {
  /// Document Attribute Video constructor.
  const DocumentAttributeVideo066({
    required this.duration,
    required this.w,
    required this.h,
  }) : super._();

  /// Deserialize.
  factory DocumentAttributeVideo066.deserialize(Uint8List buffer) {
    // final flags = _read#(buffer);
    // final duration = _readint(buffer);
    // final w = _readint(buffer);
    // final h = _readint(buffer);
    // final result = DocumentAttributeVideo066(flags: flags, duration: duration, w: w, h: h,);

    // return result;

    throw Exception();
  }

  /// Flags.
  int get flags {
    final v = _flag();

    return v;
  }

  /// Duration.
  final int duration;

  /// W.
  final int w;

  /// H.
  final int h;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x0ef02ce6);
    buffer.writeInt32(flags);
    buffer.writeInt32(duration);
    buffer.writeInt32(w);
    buffer.writeInt32(h);
  }
}

/// Document Attribute Audio.
///
/// Layer: 23.
/// ID: `051448e5`.
class DocumentAttributeAudio023 extends DocumentAttributeBase {
  /// Document Attribute Audio constructor.
  const DocumentAttributeAudio023({
    required this.duration,
  }) : super._();

  /// Deserialize.
  factory DocumentAttributeAudio023.deserialize(Uint8List buffer) {
    // final duration = _readint(buffer);
    // final result = DocumentAttributeAudio023(duration: duration,);

    // return result;

    throw Exception();
  }

  /// Duration.
  final int duration;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x051448e5);
    buffer.writeInt32(duration);
  }
}

/// Document Attribute Audio.
///
/// Layer: 45.
/// ID: `ded218e0`.
class DocumentAttributeAudio045 extends DocumentAttributeBase {
  /// Document Attribute Audio constructor.
  const DocumentAttributeAudio045({
    required this.duration,
    required this.title,
    required this.performer,
  }) : super._();

  /// Deserialize.
  factory DocumentAttributeAudio045.deserialize(Uint8List buffer) {
    // final duration = _readint(buffer);
    // final title = _readstring(buffer);
    // final performer = _readstring(buffer);
    // final result = DocumentAttributeAudio045(duration: duration, title: title, performer: performer,);

    // return result;

    throw Exception();
  }

  /// Duration.
  final int duration;

  /// Title.
  final String title;

  /// Performer.
  final String performer;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xded218e0);
    buffer.writeInt32(duration);
    buffer.writeString(title);
    buffer.writeString(performer);
  }
}

/// Document Attribute Audio.
///
/// Layer: 46.
/// ID: `9852f9c6`.
class DocumentAttributeAudio046 extends DocumentAttributeBase {
  /// Document Attribute Audio constructor.
  const DocumentAttributeAudio046({
    required this.duration,
    this.title,
    this.performer,
    this.waveform,
  }) : super._();

  /// Deserialize.
  factory DocumentAttributeAudio046.deserialize(Uint8List buffer) {
    // final flags = _read#(buffer);
    // final duration = _readint(buffer);
    // final title = _readflags.0?string(buffer);
    // final performer = _readflags.1?string(buffer);
    // final waveform = _readflags.2?bytes(buffer);
    // final result = DocumentAttributeAudio046(flags: flags, duration: duration, title: title, performer: performer, waveform: waveform,);

    // return result;

    throw Exception();
  }

  /// Flags.
  int get flags {
    final v = _flag(
      b00: title != null,
      b01: performer != null,
      b02: waveform != null,
    );

    return v;
  }

  /// Duration.
  final int duration;

  /// Title.
  final String? title;

  /// Performer.
  final String? performer;

  /// Waveform.
  final Uint8List? waveform;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x9852f9c6);
    buffer.writeInt32(flags);
    buffer.writeInt32(duration);
    final localTitleCopy = title;
    if (localTitleCopy != null) {
      buffer.writeString(localTitleCopy);
    }
    final localPerformerCopy = performer;
    if (localPerformerCopy != null) {
      buffer.writeString(localPerformerCopy);
    }
    final localWaveformCopy = waveform;
    if (localWaveformCopy != null) {
      buffer.writeBytes(localWaveformCopy);
    }
  }
}

/// Document Attribute Filename.
///
/// Layer: 23.
/// ID: `15590068`.
class DocumentAttributeFilename023 extends DocumentAttributeBase {
  /// Document Attribute Filename constructor.
  const DocumentAttributeFilename023({
    required this.fileName,
  }) : super._();

  /// Deserialize.
  factory DocumentAttributeFilename023.deserialize(Uint8List buffer) {
    // final fileName = _readstring(buffer);
    // final result = DocumentAttributeFilename023(fileName: fileName,);

    // return result;

    throw Exception();
  }

  /// File Name.
  final String fileName;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x15590068);
    buffer.writeString(fileName);
  }
}

/// Photo Size Empty.
///
/// Layer: 23.
/// ID: `0e17e23c`.
class PhotoSizeEmpty023 extends PhotoSizeBase {
  /// Photo Size Empty constructor.
  const PhotoSizeEmpty023({
    required this.type,
  }) : super._();

  /// Deserialize.
  factory PhotoSizeEmpty023.deserialize(Uint8List buffer) {
    // final type = _readstring(buffer);
    // final result = PhotoSizeEmpty023(type: type,);

    // return result;

    throw Exception();
  }

  /// Type.
  final String type;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x0e17e23c);
    buffer.writeString(type);
  }
}

/// Photo Size.
///
/// Layer: 23.
/// ID: `77bfb61b`.
class PhotoSize023 extends PhotoSizeBase {
  /// Photo Size constructor.
  const PhotoSize023({
    required this.type,
    required this.location,
    required this.w,
    required this.h,
    required this.size,
  }) : super._();

  /// Deserialize.
  factory PhotoSize023.deserialize(Uint8List buffer) {
    // final type = _readstring(buffer);
    // final location = _readFileLocation(buffer);
    // final w = _readint(buffer);
    // final h = _readint(buffer);
    // final size = _readint(buffer);
    // final result = PhotoSize023(type: type, location: location, w: w, h: h, size: size,);

    // return result;

    throw Exception();
  }

  /// Type.
  final String type;

  /// Location.
  final FileLocationBase location;

  /// W.
  final int w;

  /// H.
  final int h;

  /// Size.
  final int size;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x77bfb61b);
    buffer.writeString(type);
    buffer.writeObject(location);
    buffer.writeInt32(w);
    buffer.writeInt32(h);
    buffer.writeInt32(size);
  }
}

/// Photo Cached Size.
///
/// Layer: 23.
/// ID: `e9a734fa`.
class PhotoCachedSize023 extends PhotoSizeBase {
  /// Photo Cached Size constructor.
  const PhotoCachedSize023({
    required this.type,
    required this.location,
    required this.w,
    required this.h,
    required this.bytes,
  }) : super._();

  /// Deserialize.
  factory PhotoCachedSize023.deserialize(Uint8List buffer) {
    // final type = _readstring(buffer);
    // final location = _readFileLocation(buffer);
    // final w = _readint(buffer);
    // final h = _readint(buffer);
    // final bytes = _readbytes(buffer);
    // final result = PhotoCachedSize023(type: type, location: location, w: w, h: h, bytes: bytes,);

    // return result;

    throw Exception();
  }

  /// Type.
  final String type;

  /// Location.
  final FileLocationBase location;

  /// W.
  final int w;

  /// H.
  final int h;

  /// Bytes.
  final Uint8List bytes;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xe9a734fa);
    buffer.writeString(type);
    buffer.writeObject(location);
    buffer.writeInt32(w);
    buffer.writeInt32(h);
    buffer.writeBytes(bytes);
  }
}

/// Predicate File Location.
abstract class FileLocationBase extends TlConstructor {
  /// Predicate File Location constructor.
  const FileLocationBase._() : super._();
}

/// File Location Unavailable.
///
/// Layer: 23.
/// ID: `7c596b46`.
class FileLocationUnavailable023 extends FileLocationBase {
  /// File Location Unavailable constructor.
  const FileLocationUnavailable023({
    required this.volumeId,
    required this.localId,
    required this.secret,
  }) : super._();

  /// Deserialize.
  factory FileLocationUnavailable023.deserialize(Uint8List buffer) {
    // final volumeId = _readlong(buffer);
    // final localId = _readint(buffer);
    // final secret = _readlong(buffer);
    // final result = FileLocationUnavailable023(volumeId: volumeId, localId: localId, secret: secret,);

    // return result;

    throw Exception();
  }

  /// Volume Id.
  final int volumeId;

  /// Local Id.
  final int localId;

  /// Secret.
  final int secret;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x7c596b46);
    buffer.writeInt64(volumeId);
    buffer.writeInt32(localId);
    buffer.writeInt64(secret);
  }
}

/// File Location.
///
/// Layer: 23.
/// ID: `53d69076`.
class FileLocation023 extends FileLocationBase {
  /// File Location constructor.
  const FileLocation023({
    required this.dcId,
    required this.volumeId,
    required this.localId,
    required this.secret,
  }) : super._();

  /// Deserialize.
  factory FileLocation023.deserialize(Uint8List buffer) {
    // final dcId = _readint(buffer);
    // final volumeId = _readlong(buffer);
    // final localId = _readint(buffer);
    // final secret = _readlong(buffer);
    // final result = FileLocation023(dcId: dcId, volumeId: volumeId, localId: localId, secret: secret,);

    // return result;

    throw Exception();
  }

  /// Dc Id.
  final int dcId;

  /// Volume Id.
  final int volumeId;

  /// Local Id.
  final int localId;

  /// Secret.
  final int secret;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x53d69076);
    buffer.writeInt32(dcId);
    buffer.writeInt64(volumeId);
    buffer.writeInt32(localId);
    buffer.writeInt64(secret);
  }
}

/// Message Entity Unknown.
///
/// Layer: 45.
/// ID: `bb92ba95`.
class MessageEntityUnknown045 extends MessageEntityBase {
  /// Message Entity Unknown constructor.
  const MessageEntityUnknown045({
    required this.offset,
    required this.length,
  }) : super._();

  /// Deserialize.
  factory MessageEntityUnknown045.deserialize(Uint8List buffer) {
    // final offset = _readint(buffer);
    // final length = _readint(buffer);
    // final result = MessageEntityUnknown045(offset: offset, length: length,);

    // return result;

    throw Exception();
  }

  /// Offset.
  final int offset;

  /// Length.
  final int length;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xbb92ba95);
    buffer.writeInt32(offset);
    buffer.writeInt32(length);
  }
}

/// Message Entity Mention.
///
/// Layer: 45.
/// ID: `fa04579d`.
class MessageEntityMention045 extends MessageEntityBase {
  /// Message Entity Mention constructor.
  const MessageEntityMention045({
    required this.offset,
    required this.length,
  }) : super._();

  /// Deserialize.
  factory MessageEntityMention045.deserialize(Uint8List buffer) {
    // final offset = _readint(buffer);
    // final length = _readint(buffer);
    // final result = MessageEntityMention045(offset: offset, length: length,);

    // return result;

    throw Exception();
  }

  /// Offset.
  final int offset;

  /// Length.
  final int length;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xfa04579d);
    buffer.writeInt32(offset);
    buffer.writeInt32(length);
  }
}

/// Message Entity Hashtag.
///
/// Layer: 45.
/// ID: `6f635b0d`.
class MessageEntityHashtag045 extends MessageEntityBase {
  /// Message Entity Hashtag constructor.
  const MessageEntityHashtag045({
    required this.offset,
    required this.length,
  }) : super._();

  /// Deserialize.
  factory MessageEntityHashtag045.deserialize(Uint8List buffer) {
    // final offset = _readint(buffer);
    // final length = _readint(buffer);
    // final result = MessageEntityHashtag045(offset: offset, length: length,);

    // return result;

    throw Exception();
  }

  /// Offset.
  final int offset;

  /// Length.
  final int length;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x6f635b0d);
    buffer.writeInt32(offset);
    buffer.writeInt32(length);
  }
}

/// Message Entity Bot Command.
///
/// Layer: 45.
/// ID: `6cef8ac7`.
class MessageEntityBotCommand045 extends MessageEntityBase {
  /// Message Entity Bot Command constructor.
  const MessageEntityBotCommand045({
    required this.offset,
    required this.length,
  }) : super._();

  /// Deserialize.
  factory MessageEntityBotCommand045.deserialize(Uint8List buffer) {
    // final offset = _readint(buffer);
    // final length = _readint(buffer);
    // final result = MessageEntityBotCommand045(offset: offset, length: length,);

    // return result;

    throw Exception();
  }

  /// Offset.
  final int offset;

  /// Length.
  final int length;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x6cef8ac7);
    buffer.writeInt32(offset);
    buffer.writeInt32(length);
  }
}

/// Message Entity Url.
///
/// Layer: 45.
/// ID: `6ed02538`.
class MessageEntityUrl045 extends MessageEntityBase {
  /// Message Entity Url constructor.
  const MessageEntityUrl045({
    required this.offset,
    required this.length,
  }) : super._();

  /// Deserialize.
  factory MessageEntityUrl045.deserialize(Uint8List buffer) {
    // final offset = _readint(buffer);
    // final length = _readint(buffer);
    // final result = MessageEntityUrl045(offset: offset, length: length,);

    // return result;

    throw Exception();
  }

  /// Offset.
  final int offset;

  /// Length.
  final int length;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x6ed02538);
    buffer.writeInt32(offset);
    buffer.writeInt32(length);
  }
}

/// Message Entity Email.
///
/// Layer: 45.
/// ID: `64e475c2`.
class MessageEntityEmail045 extends MessageEntityBase {
  /// Message Entity Email constructor.
  const MessageEntityEmail045({
    required this.offset,
    required this.length,
  }) : super._();

  /// Deserialize.
  factory MessageEntityEmail045.deserialize(Uint8List buffer) {
    // final offset = _readint(buffer);
    // final length = _readint(buffer);
    // final result = MessageEntityEmail045(offset: offset, length: length,);

    // return result;

    throw Exception();
  }

  /// Offset.
  final int offset;

  /// Length.
  final int length;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x64e475c2);
    buffer.writeInt32(offset);
    buffer.writeInt32(length);
  }
}

/// Message Entity Bold.
///
/// Layer: 45.
/// ID: `bd610bc9`.
class MessageEntityBold045 extends MessageEntityBase {
  /// Message Entity Bold constructor.
  const MessageEntityBold045({
    required this.offset,
    required this.length,
  }) : super._();

  /// Deserialize.
  factory MessageEntityBold045.deserialize(Uint8List buffer) {
    // final offset = _readint(buffer);
    // final length = _readint(buffer);
    // final result = MessageEntityBold045(offset: offset, length: length,);

    // return result;

    throw Exception();
  }

  /// Offset.
  final int offset;

  /// Length.
  final int length;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xbd610bc9);
    buffer.writeInt32(offset);
    buffer.writeInt32(length);
  }
}

/// Message Entity Italic.
///
/// Layer: 45.
/// ID: `826f8b60`.
class MessageEntityItalic045 extends MessageEntityBase {
  /// Message Entity Italic constructor.
  const MessageEntityItalic045({
    required this.offset,
    required this.length,
  }) : super._();

  /// Deserialize.
  factory MessageEntityItalic045.deserialize(Uint8List buffer) {
    // final offset = _readint(buffer);
    // final length = _readint(buffer);
    // final result = MessageEntityItalic045(offset: offset, length: length,);

    // return result;

    throw Exception();
  }

  /// Offset.
  final int offset;

  /// Length.
  final int length;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x826f8b60);
    buffer.writeInt32(offset);
    buffer.writeInt32(length);
  }
}

/// Message Entity Code.
///
/// Layer: 45.
/// ID: `28a20571`.
class MessageEntityCode045 extends MessageEntityBase {
  /// Message Entity Code constructor.
  const MessageEntityCode045({
    required this.offset,
    required this.length,
  }) : super._();

  /// Deserialize.
  factory MessageEntityCode045.deserialize(Uint8List buffer) {
    // final offset = _readint(buffer);
    // final length = _readint(buffer);
    // final result = MessageEntityCode045(offset: offset, length: length,);

    // return result;

    throw Exception();
  }

  /// Offset.
  final int offset;

  /// Length.
  final int length;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x28a20571);
    buffer.writeInt32(offset);
    buffer.writeInt32(length);
  }
}

/// Message Entity Pre.
///
/// Layer: 45.
/// ID: `73924be0`.
class MessageEntityPre045 extends MessageEntityBase {
  /// Message Entity Pre constructor.
  const MessageEntityPre045({
    required this.offset,
    required this.length,
    required this.language,
  }) : super._();

  /// Deserialize.
  factory MessageEntityPre045.deserialize(Uint8List buffer) {
    // final offset = _readint(buffer);
    // final length = _readint(buffer);
    // final language = _readstring(buffer);
    // final result = MessageEntityPre045(offset: offset, length: length, language: language,);

    // return result;

    throw Exception();
  }

  /// Offset.
  final int offset;

  /// Length.
  final int length;

  /// Language.
  final String language;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x73924be0);
    buffer.writeInt32(offset);
    buffer.writeInt32(length);
    buffer.writeString(language);
  }
}

/// Message Entity Text Url.
///
/// Layer: 45.
/// ID: `76a6d327`.
class MessageEntityTextUrl045 extends MessageEntityBase {
  /// Message Entity Text Url constructor.
  const MessageEntityTextUrl045({
    required this.offset,
    required this.length,
    required this.url,
  }) : super._();

  /// Deserialize.
  factory MessageEntityTextUrl045.deserialize(Uint8List buffer) {
    // final offset = _readint(buffer);
    // final length = _readint(buffer);
    // final url = _readstring(buffer);
    // final result = MessageEntityTextUrl045(offset: offset, length: length, url: url,);

    // return result;

    throw Exception();
  }

  /// Offset.
  final int offset;

  /// Length.
  final int length;

  /// Url.
  final String url;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x76a6d327);
    buffer.writeInt32(offset);
    buffer.writeInt32(length);
    buffer.writeString(url);
  }
}

/// Message Entity Underline.
///
/// Layer: 101.
/// ID: `9c4e7e8b`.
class MessageEntityUnderline101 extends MessageEntityBase {
  /// Message Entity Underline constructor.
  const MessageEntityUnderline101({
    required this.offset,
    required this.length,
  }) : super._();

  /// Deserialize.
  factory MessageEntityUnderline101.deserialize(Uint8List buffer) {
    // final offset = _readint(buffer);
    // final length = _readint(buffer);
    // final result = MessageEntityUnderline101(offset: offset, length: length,);

    // return result;

    throw Exception();
  }

  /// Offset.
  final int offset;

  /// Length.
  final int length;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x9c4e7e8b);
    buffer.writeInt32(offset);
    buffer.writeInt32(length);
  }
}

/// Message Entity Strike.
///
/// Layer: 101.
/// ID: `bf0693d4`.
class MessageEntityStrike101 extends MessageEntityBase {
  /// Message Entity Strike constructor.
  const MessageEntityStrike101({
    required this.offset,
    required this.length,
  }) : super._();

  /// Deserialize.
  factory MessageEntityStrike101.deserialize(Uint8List buffer) {
    // final offset = _readint(buffer);
    // final length = _readint(buffer);
    // final result = MessageEntityStrike101(offset: offset, length: length,);

    // return result;

    throw Exception();
  }

  /// Offset.
  final int offset;

  /// Length.
  final int length;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xbf0693d4);
    buffer.writeInt32(offset);
    buffer.writeInt32(length);
  }
}

/// Message Entity Blockquote.
///
/// Layer: 101.
/// ID: `020df5d0`.
class MessageEntityBlockquote101 extends MessageEntityBase {
  /// Message Entity Blockquote constructor.
  const MessageEntityBlockquote101({
    required this.offset,
    required this.length,
  }) : super._();

  /// Deserialize.
  factory MessageEntityBlockquote101.deserialize(Uint8List buffer) {
    // final offset = _readint(buffer);
    // final length = _readint(buffer);
    // final result = MessageEntityBlockquote101(offset: offset, length: length,);

    // return result;

    throw Exception();
  }

  /// Offset.
  final int offset;

  /// Length.
  final int length;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x020df5d0);
    buffer.writeInt32(offset);
    buffer.writeInt32(length);
  }
}

/// Message Entity Spoiler.
///
/// Layer: 144.
/// ID: `32ca960f`.
class MessageEntitySpoiler144 extends MessageEntityBase {
  /// Message Entity Spoiler constructor.
  const MessageEntitySpoiler144({
    required this.offset,
    required this.length,
  }) : super._();

  /// Deserialize.
  factory MessageEntitySpoiler144.deserialize(Uint8List buffer) {
    // final offset = _readint(buffer);
    // final length = _readint(buffer);
    // final result = MessageEntitySpoiler144(offset: offset, length: length,);

    // return result;

    throw Exception();
  }

  /// Offset.
  final int offset;

  /// Length.
  final int length;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x32ca960f);
    buffer.writeInt32(offset);
    buffer.writeInt32(length);
  }
}

/// Message Entity Custom Emoji.
///
/// Layer: 144.
/// ID: `c8cf05f8`.
class MessageEntityCustomEmoji144 extends MessageEntityBase {
  /// Message Entity Custom Emoji constructor.
  const MessageEntityCustomEmoji144({
    required this.offset,
    required this.length,
    required this.documentId,
  }) : super._();

  /// Deserialize.
  factory MessageEntityCustomEmoji144.deserialize(Uint8List buffer) {
    // final offset = _readint(buffer);
    // final length = _readint(buffer);
    // final documentId = _readlong(buffer);
    // final result = MessageEntityCustomEmoji144(offset: offset, length: length, documentId: documentId,);

    // return result;

    throw Exception();
  }

  /// Offset.
  final int offset;

  /// Length.
  final int length;

  /// Document Id.
  final int documentId;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xc8cf05f8);
    buffer.writeInt32(offset);
    buffer.writeInt32(length);
    buffer.writeInt64(documentId);
  }
}

/// Input Sticker Set Short Name.
///
/// Layer: 45.
/// ID: `861cc8a0`.
class InputStickerSetShortName045 extends InputStickerSetBase {
  /// Input Sticker Set Short Name constructor.
  const InputStickerSetShortName045({
    required this.shortName,
  }) : super._();

  /// Deserialize.
  factory InputStickerSetShortName045.deserialize(Uint8List buffer) {
    // final shortName = _readstring(buffer);
    // final result = InputStickerSetShortName045(shortName: shortName,);

    // return result;

    throw Exception();
  }

  /// Short Name.
  final String shortName;

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0x861cc8a0);
    buffer.writeString(shortName);
  }
}

/// Input Sticker Set Empty.
///
/// Layer: 45.
/// ID: `ffb62b95`.
class InputStickerSetEmpty045 extends InputStickerSetBase {
  /// Input Sticker Set Empty constructor.
  const InputStickerSetEmpty045() : super._();

  /// Deserialize.
  factory InputStickerSetEmpty045.deserialize(Uint8List buffer) {
    // final result = InputStickerSetEmpty045();

    // return result;

    throw Exception();
  }

  /// Serialize.
  @override
  void serialize(List<int> buffer) {
    buffer.writeInt32(0xffb62b95);
  }
}
