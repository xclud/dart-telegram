/// Telegram Client API (MTProto) to connect to Telegram and control a user programmatically.
library tg;

import 'dart:async';

import 'dart:math';
import 'dart:typed_data';

import 'package:crypto/crypto.dart';
import 'package:encrypt/encrypt.dart';
import 'package:t/t.dart';

part 'src/client.dart';
part 'src/constants.dart';
part 'src/obfuscation.dart';
part 'src/session.dart';
