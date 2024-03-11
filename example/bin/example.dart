import 'dart:typed_data';

import 'package:tg/tg.dart' as tg;

void main(List<String> arguments) async {
  final buffer = <int>[];

  final q = tg.InitConnection(
    apiId: 123456,
    deviceModel: "Windows",
    appVersion: "1.0.0",
    systemVersion: "10",
    systemLangCode: "fa",
    langCode: "fa",
    langPack: "",
    proxy: null,
    params: null,
    query: tg.HelpGetConfig(),
  );

  q.serialize(buffer);

  final br = tg.BinaryReader(Uint8List.fromList(buffer));
  final x = br.readObject<tg.InitConnection>();

  print(buffer);
  print(x);
}
