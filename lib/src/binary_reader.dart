part of '../tg.dart';

class BinaryReader {
  BinaryReader(this.buffer);

  final Uint8List buffer;
  int _position = 0;

  int readInt32() {
    final b = Uint8List.sublistView(buffer, _position);
    final x = b.buffer.asUint32List(0, 1);

    _position += 4;
    return x.first;
  }

  int readInt64() {
    final b = Uint8List.sublistView(buffer, _position);
    final x = b.buffer.asUint64List(0, 1);

    _position += 8;
    return x.first;
  }

  double readFloat64() {
    final b = Uint8List.sublistView(buffer, _position);
    final x = b.buffer.asFloat64List(0, 1);

    _position += 8;
    return x.first;
  }

  bool readBool() {
    final b = buffer[_position];

    if (b == 0x997275B5) {
      _position++;
      return true;
    } else if (b == 0xBC799737) {
      _position++;
      return false;
    }

    throw Exception('Invalid boolean value.');
  }

  DateTime readDateTime() {
    final seconds = readInt32();
    final tmp = DateTime.fromMicrosecondsSinceEpoch(seconds * 1000);

    return tmp;
  }

  List<T> readVectorObject<T extends TlObject>() {
    throw Exception();
  }

  List<int> readVectorInt32() {
    throw Exception();
  }

  List<int> readVectorInt64() {
    throw Exception();
  }

  List<Uint8List> readVectorBytes() {
    throw Exception();
  }

  List<String> readVectorString() {
    throw Exception();
  }

  Uint8List readBytes() {
    final l = buffer[_position];

    if (l < 254) {
      final tmp =
          Uint8List.sublistView(buffer, _position + 1, _position + 1 + l);

      _position += 1 + l;
      return Uint8List.fromList(tmp);
    } else {
      final b = Uint8List.sublistView(buffer, _position);
      final x = b.buffer.asUint32List(0, 1).first;

      final tmp =
          Uint8List.sublistView(buffer, _position + 4, _position + 4 + x);

      _position += 4 + x;
      return Uint8List.fromList(tmp);
    }
  }

  String readString() {
    final codeUnits = readBytes();
    final tmp = utf8.decode(codeUnits);
    return tmp;
  }

  TlObject readObject<T extends TlObject>() {
    throw Exception();
  }
}
