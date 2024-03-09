import 'package:tg/tg.dart' as tg;

tg.Client createClient() {
  const c = tg.Client(apiId: 12345);
  return c;
}
