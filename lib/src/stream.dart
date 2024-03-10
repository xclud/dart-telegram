part of '../tg.dart';

extension _Y on List<int> {
  void writeInt(int v) {
    final b = Uint8List(4);
    b.buffer.asUint32List(0, 1)[0] = v;

    addAll(b);
  }

  void writeLong(int v) {
    final b = Uint8List(8);
    b.buffer.asUint64List(0, 1)[0] = v;

    addAll(b);
  }

  void writeString(String v) {
    final bytes = utf8.encode(v);

    writeBytes(bytes);
  }

  void writeDouble(double v) {
    final b = Uint8List(8);
    b.buffer.asFloat64List(0, 1)[0] = v;

    addAll(b);
  }

  void writeBytes(Uint8List? bytes) {
    if (bytes == null) {
      add(0);
      return;
    }

    int length = bytes.length;
    if (length < 254) {
      add(length);
    } else {
      writeInt(length << 8 | 254);
      length += 3;
    }
    addAll(bytes);

    while (++length % 4 != 0) {
      add(0);
    }
  }

  void writeDateTime(DateTime v) {
    final seconds = DateTime.now().millisecondsSinceEpoch ~/ 1000;
    writeInt(seconds);
  }

  void writeBool(bool v) {
    writeInt(v ? 0x997275B5 : 0xBC799737);
  }

  void writeVectorObject<T extends TlObject>(Iterable<T> v) {
    writeInt(_vectorCtor);
    writeInt(v.length);

    for (final item in v) {
      writeObject(item);
    }
  }

  void writeVectorInt(Iterable<int> v) {
    writeInt(_vectorCtor);
    writeInt(v.length);

    for (final item in v) {
      writeInt(item);
    }
  }

  void writeVectorLong(Iterable<int> v) {
    writeInt(_vectorCtor);
    writeInt(v.length);

    for (final item in v) {
      writeLong(item);
    }
  }

  void writeVectorString(Iterable<String> v) {
    writeInt(_vectorCtor);
    writeInt(v.length);

    for (final item in v) {
      writeString(item);
    }
  }

  void writeVectorBytes(Iterable<Uint8List> v) {
    writeInt(_vectorCtor);
    writeInt(v.length);

    for (final item in v) {
      writeBytes(item);
    }
  }

  void writeObject<T extends TlObject>(T v) {
    final buffer = <int>[];
    v.serialize(buffer);

    addAll(buffer);
  }
}
