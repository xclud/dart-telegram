part of '../tg.dart';

class Frame {
  const Frame(this.message, this.messageId, this.authKeyId);

  /// Parse from [Uint8List].
  factory Frame.parse(Uint8List data, Obfuscation? obfuscation) {
    obfuscation?.recv.encryptDecrypt(data, data.length);

    final br = BinaryReader(data);

    final authKeyId = br.readInt64();
    final messageId = br.readInt64();
    final msgLength = br.readInt32(); // Message Length.

    final messageBuffer = br.readRawBytes(msgLength);
    final br2 = BinaryReader(messageBuffer);
    final message = br2.readObject();

    return Frame(message, messageId, authKeyId);
  }

  final TlObject message;
  final int messageId;
  final int authKeyId;

  Uint8List toUint8List(Obfuscation? obfuscation) {
    final payloadBuffer = <int>[];
    final messageBuffer = <int>[];
    messageBuffer.writeObject(message);

    // int32 payloadLength.
    final payloadLength = messageBuffer.length + 20;

    //payloadBuffer.writeInt32(messageBuffer.length + 20);
    payloadBuffer.writeInt64(authKeyId);

    // int64 message_id
    payloadBuffer.writeInt64(messageId);

    // int32 message_data_length (to be patched)
    payloadBuffer.writeInt32(messageBuffer.length);

    // bytes message_data
    payloadBuffer.addAll(messageBuffer);

    final data = <int>[];
    data.writeInt32(payloadLength);
    data.addAll(payloadBuffer);

    obfuscation?.send.encryptDecrypt(data, data.length);

    return Uint8List.fromList(data);
  }

  Map<String, dynamic> toJson() {
    return {
      'authKeyId': authKeyId,
      'messageId': messageId,
      'message': message.runtimeType.toString(),
    };
  }

  @override
  String toString() {
    return jsonEncode(toJson());
  }
}
