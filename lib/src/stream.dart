part of '../tg.dart';

extension _Y on List<int> {
  void writeInt(int v) {
    final b = Uint8List(4);
    b.buffer.asUint32List(0, 1)[0] = v;

    addAll(b);
  }

  void writeLong(int v) {
    final b = Uint8List(4);
    b.buffer.asUint64List(0, 1)[0] = v;

    addAll(b);
  }

  void writeString(String v) {
    //add(0);
  }

  void writeDouble(double v) {
    //add(0);
  }

  void writeBytes(Uint8List v) {
    addAll(v);
  }

  void writeDateTime(DateTime v) {
    final time = DateTime.now().millisecondsSinceEpoch;
    writeInt(time);
  }

  void writeBool(bool v) {
    //add(0);
  }

  void writeVectorObject<T extends TlObject>(Iterable<T> v) {
    //add(length);

    for (final item in v) {
      writeObject(item);
    }
  }

  void writeVectorInt(Iterable<int> v) {
    //add(0);
  }
  void writeVectorLong(Iterable<int> v) {
    //add(0);
  }

  void writeVectorString(Iterable<String> v) {
    //add(0);
  }

  void writeVectorBytes(Iterable<Uint8List> v) {
    //add(0);
  }

  void writeObject<T extends TlObject>(T v) {
    final buffer = <int>[];
    v.serialize(buffer);

    addAll(buffer);
  }
}
