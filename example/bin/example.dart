import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:tg/tg.dart' as tg;
import 'package:socks5_proxy/socks.dart';

void main(List<String> arguments) async {
  final obf = tg.Obfuscation.random(false, 4);

  final socket = await SocksTCPClient.connect(
    [
      ProxySettings(InternetAddress.loopbackIPv4, 1080),
    ],
    InternetAddress('149.154.167.50'),
    443,
  );

  print('Connected.');

  final sender = StreamController<List<int>>();
  final receiver = StreamController<Uint8List>();

  sender.stream.listen((v) {
    print('SEND: ${hex(v)}');
    socket.add(v);
  });

  socket.listen((v) {
    print('RECV: ${hex(v)}');
    receiver.add(v);
  });

  final c = tg.Client(
    apiId: 123456,
    receiver: receiver.stream,
    sender: sender.sink,
    obfuscation: obf,
  );

  sender.add(obf.preamble);
  await Future.delayed(Duration(seconds: 1));
  final resPQ = await c.reqPqMulti();

  final serverDHparams = await c.reqDHParams(resPQ);
  print(serverDHparams);

  await Future.delayed(Duration(seconds: 1));

  while (true) {
    await Future.delayed(Duration(seconds: 1));
  }
}

String hex(Iterable<int> v) {
  final h = v
      .map((vv) => vv.toRadixString(16).padLeft(2, '0'))
      .join('')
      .toUpperCase();

  return '0x$h';
}
