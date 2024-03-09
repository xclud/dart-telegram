import 'package:example/example.dart' as example;

void main(List<String> arguments) async {
  final c = example.createClient();
  final result = await c.initConnection();

  print('Result: $result!');
}
