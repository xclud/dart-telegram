/// Telegram Client API (MTProto) to connect to Telegram and control a user programmatically.
library tg;

import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';

part 'src/binary_reader.dart';
part 'src/core.dart';
part 'src/client.dart';
part 'src/constants.dart';
part 'src/stream.dart';
part 'src/schema.dart';
part 'src/end_to_end.dart';
part 'src/flag_builder.dart';
part 'src/mtproto.dart';
part 'src/obfuscation.dart';
