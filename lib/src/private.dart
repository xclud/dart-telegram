part of '../tg.dart';

final _rng = Random();

Uint8List _int64ToBigEndian(int value) {
  int i = 1;
  for (int temp = value; (temp >>= 8) != 0;) {
    i++;
  }

  final result = Uint8List(i);
  for (; --i >= 0; value >>= 8) {
    result[i] = value % 256;
  }

  return result;
}

String _hex(Iterable<int> v) {
  final h = v
      .map((vv) => vv.toRadixString(16).padLeft(2, '0'))
      .join('')
      .toUpperCase();

  return h;
}

BigInt _bigEndianInteger(Uint8List value) {
  final data = _hex(value);
  return BigInt.parse(data, radix: 16);
}

Uint8List _fromHexToUint8List(String value) {
  if (value.length.isOdd) {
    value = '0$value';
  }

  final r = Uint8List(value.length ~/ 2);

  for (int i = 0; i < value.length ~/ 2; i += 1) {
    final sub = value.substring(i * 2, i * 2 + 2);
    r[i] = int.parse(sub, radix: 16);
  }

  return r;
}

Uint8List _aesIgeEncryptDecrypt(
    Uint8List input, Uint8List aesKey, Uint8List aesIV, bool encrypt) {
  assert(input.length % 16 == 0, 'AES_IGE input size not divisible by 16.');
  final aes = AES(Key(aesKey), mode: AESMode.ecb, padding: null);

  final output = Uint8List(input.length);
  final prevBytes = Uint8List.fromList(aesIV);
  final span = input.buffer.asInt64List();
  final sout = output.buffer.asInt64List();
  final prev = prevBytes.buffer.asInt64List();

  if (!encrypt) {
    {
      final temp = prev[2];
      prev[2] = prev[0];
      prev[0] = temp;
    }

    {
      final temp = prev[3];
      prev[3] = prev[1];
      prev[1] = temp;
    }
  }

  if (encrypt) {
    for (int i = 0, count = input.length ~/ 8; i < count;) {
      sout[i] = span[i] ^ prev[0];
      sout[i + 1] = span[i + 1] ^ prev[1];
      aes.encrypt2(output, i * 8, 16, output, i * 8);
      prev[0] = sout[i] ^= prev[2];
      prev[1] = sout[i + 1] ^= prev[3];
      prev[2] = span[i++];
      prev[3] = span[i++];
    }
  } else {
    for (int i = 0, count = input.length ~/ 8; i < count;) {
      sout[i] = span[i] ^ prev[0];
      sout[i + 1] = span[i + 1] ^ prev[1];
      aes.decrypt2(output, i * 8, 16, output, i * 8);
      prev[0] = sout[i] ^= prev[2];
      prev[1] = sout[i + 1] ^= prev[3];
      prev[2] = span[i++];
      prev[3] = span[i++];
    }
  }

  return output;
}

// _KeyIV _constructTmpAESKeyIV(Int128 server_nonce, Int256 new_nonce) {
//   final tmp_aes_key = Uint8List(32);
//   final tmp_aes_iv = Uint8List(32);
//   sha1.convert(new_nonce, 0, 32, null, 0);
//   sha1.TransformFinalBlock(server_nonce, 0, 16);
//   sha1.Hash.CopyTo(
//       tmp_aes_key, 0); // tmp_aes_key := SHA1(new_nonce + server_nonce)
//   sha1.Initialize();
//   sha1.TransformBlock(server_nonce, 0, 16, null, 0);
//   sha1.TransformFinalBlock(new_nonce, 0, 32);
//   Array.Copy(sha1.Hash, 0, tmp_aes_key, 20,
//       12); //              + SHA1(server_nonce, new_nonce)[0:12]
//   Array.Copy(sha1.Hash, 12, tmp_aes_iv, 0,
//       8); // tmp_aes_iv  != SHA1(server_nonce, new_nonce)[12:8]
//   sha1.Initialize();
//   sha1.TransformBlock(new_nonce, 0, 32, null, 0);
//   sha1.TransformFinalBlock(new_nonce, 0, 32);
//   sha1.Hash.CopyTo(tmp_aes_iv, 8); //              + SHA(new_nonce + new_nonce)
//   Array.Copy(new_nonce, 0, tmp_aes_iv, 28, 4); //              + new_nonce[0:4]
//   sha1.Initialize();
//   return _KeyIV(tmp_aes_key, tmp_aes_iv);
// }

class _KeyIV {
  const _KeyIV(this.key, this.iv);

  final Uint8List key;
  final Uint8List iv;
}
