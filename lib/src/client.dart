part of '../tg.dart';

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
}
