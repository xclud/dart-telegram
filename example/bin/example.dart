import 'dart:io';
import 'dart:typed_data';

import 'package:t/t.dart' as t;
import 'package:tg/tg.dart' as tg;

void main(List<String> arguments) async {
  final obf = tg.Obfuscation.random(false, 4);
  final socket = await Socket.connect('149.154.167.50', 443);

  final c = tg.Client(
    apiId: 123456,
    receiver: socket,
    sender: socket,
  );

  final buffer = <int>[];

  final q = t.InitConnection(
    apiId: 123456,
    deviceModel: "Windows",
    appVersion: "1.0.0",
    systemVersion: "10",
    systemLangCode: "fa",
    langCode: "fa",
    langPack: "",
    proxy: null,
    params: null,
    query: t.HelpGetConfig(),
  );

  q.serialize(buffer);

  socket.listen((event) {
    print(event);
  });

  final br = t.BinaryReader(Uint8List.fromList(buffer));
  final x = br.readObject<t.InitConnection>();

  print(buffer);
  print(x);
}
