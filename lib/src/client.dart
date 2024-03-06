part of '../tg.dart';

class Client {
  /// Invoke.
  Future<X> invoke<X>(TlMethod<X> query) async {
    throw Exception();
  }

  Future<X> invokeWithLayer<X>(int layer, TlMethod<X> query) =>
      invoke(InvokeWithLayer<X>(layer: layer, query: query));

  Future<ConfigBase> initConnection() {
    final q = InitConnection(
      flags: 0,
      apiId: 0,
      deviceModel: "Windows",
      appVersion: "1.0.0",
      systemVersion: "10",
      systemLangCode: "fa",
      langCode: "fa",
      langPack: "",
      proxy: null,
      params: null,
      query: HelpGetConfig(),
    );

    return invokeWithLayer<ConfigBase>(174, q);
  }
}
