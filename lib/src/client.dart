part of '../tg.dart';

const int _layer = 174;

class Client {
  const Client({required this.apiId});

  /// API Id.
  final int apiId;

  /// Invoke.
  Future<X> invoke<X>(TlMethod<X> query) async {
    final buffer = <int>[];
    query.serialize(buffer);

    print(buffer);

    throw Exception();
  }

  Future<X> invokeWithLayer<X>(int layer, TlMethod<X> query) =>
      invoke(InvokeWithLayer<X>(layer: layer, query: query));

  Future<ConfigBase> initConnection() {
    final q = InitConnection(
      apiId: apiId,
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

    return invokeWithLayer<ConfigBase>(_layer, q);
  }
}
