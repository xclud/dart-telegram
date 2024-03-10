import 'package:tg/tg.dart' as tg;

tg.Client createClient(int apiId) {
  final c = tg.Client(apiId: apiId);
  return c;
}
