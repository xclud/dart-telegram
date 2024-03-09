part of '../tg.dart';

extension _Y on List<int> {
  void writeInt(int v) {
    add(0);
  }

  void writeLong(int v) {
    //add(0);
  }

  void writeString(String v) {
    //add(0);
  }

  void writeDouble(double v) {
    //add(0);
  }

  void writeBytes(Uint8List v) {
    //add(0);
  }
  void writeDateTime(DateTime v) {
    //add(0);
  }

  void writeBool(bool v) {
    //add(0);
  }

  void writeVectorObject<T extends TlObject>(Iterable<T> v) {
    //add(0);
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
    final buffer = Uint8List.fromList([]);
    v.serialize(buffer);

    addAll(buffer);
  }
}
