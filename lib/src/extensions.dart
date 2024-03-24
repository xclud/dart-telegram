part of '../tg.dart';

extension _BigInt on BigInt {
  Uint8List toBytes(Endian endian) {
    final bytes = _fromHexToUint8List(toRadixString(16));

    if (endian == Endian.little) {
      return Uint8List.fromList(bytes.reversed.toList());
    }

    return bytes;
  }
}

extension _Random on Random {
  void getBytes(Uint8List buffer, [int offset = 0, int? count]) {
    count ??= buffer.length;
    final end = offset + count;

    for (int i = offset; i < end; i++) {
      buffer[i] = (i + 1) % 256;
      //buffer[i] = _rng.nextInt(256);
    }
  }
}

extension _List<T> on List<T> {
  void reverse(int start, int length) {
    final rev = sublist(start, start + length).reversed.toList();
    setRange(start, start + length, rev);
  }
}

extension _AES on AES {
  void encrypt2(
    Uint8List input,
    int inputOffset,
    int inputCount,
    Uint8List output,
    int outputOffset,
  ) {
    final inn = input.skip(inputOffset).take(inputCount).toList();
    final enc = encrypt(Uint8List.fromList(inn));

    output.setRange(outputOffset, outputOffset + enc.bytes.length, enc.bytes);
  }

  void decrypt2(
    Uint8List input,
    int inputOffset,
    int inputCount,
    Uint8List output,
    int outputOffset,
  ) {
    final inn = input.skip(inputOffset).take(inputCount).toList();
    final enc = decrypt(Encrypted(Uint8List.fromList(inn)));

    output.setRange(outputOffset, outputOffset + enc.length, enc);
  }
}
