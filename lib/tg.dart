/// Telegram Client API (MTProto) to connect to Telegram and control a user programmatically.
library tg;

import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

part 'src/core.dart';
part 'src/client.dart';
part 'src/stream.dart';
part 'src/schema.dart';
part 'src/mtproto.dart';
part 'src/obfuscation.dart';
