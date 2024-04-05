part of '../tg.dart';

class Client {
  Client({
    required this.apiId,
    required this.apiHash,
    required this.receiver,
    required this.sender,
    required this.obfuscation,
    required this.authKey,
    required this.idSeq,
    //required this.sessionStore,
  }) : _trns = EncryptedObjectTransformer(receiver, authKey, obfuscation) {
    auth = ClientAuth._(this);
    connection = ClientConnection._(this);
    account = ClientAccount._(this);

    _trns.stream.listen((v) {
      print(v);
      _handleIncomingMessage(v);
    });
  }

  /// API Id.
  final int apiId;

  /// API Hash.
  final String apiHash;

  final Obfuscation? obfuscation;
  final Stream<Uint8List> receiver;
  final Sink<Uint8List> sender;
  final AuthorizationKey authKey;

  final EncryptedObjectTransformer _trns;
  //final SessionStore sessionStore;

  final MessageIdSequenceGenerator idSeq;

  late final ClientAuth auth;
  late final ClientConnection connection;
  late final ClientAccount account;

  //final Set<int> _msgsToAck = {};

  DCSession? _dcSession;

  DCSession get dcSession {
    final x = _dcSession ??= DCSession(id: 10);

    return x;
  }

  final Map<int, Completer<Result>> _pending = {};
  // final List<int> _msgsToAck = [];

  final _updateStreamController = StreamController<UpdatesBase>.broadcast();

  Stream<UpdatesBase> get updates => _updateStreamController.stream;

  void _handleIncomingMessage(TlObject msg) {
    if (msg is UpdatesBase) {
      _updateStreamController.add(msg);
    }

    //
    if (msg is MsgContainer) {
      for (final message in msg.messages) {
        _handleIncomingMessage(message);
      }

      return;
    } else if (msg is Msg) {
      _handleIncomingMessage(msg.body);
      return;
    } else if (msg is BadMsgNotification) {
      final badMsgId = msg.badMsgId;
      final task = _pending[badMsgId];
      task?.completeError(BadMessageException._(msg));
      _pending.remove(badMsgId);
    } else if (msg is RpcResult) {
      final reqMsgId = msg.reqMsgId;
      final task = _pending[reqMsgId];

      final result = msg.result;

      if (result is RpcError) {
        task?.complete(Result._(null, result));
        _pending.remove(reqMsgId);
        return;
      } else if (result is GzipPacked) {
        final gZippedData = GZipDecoder().decodeBytes(result.packedData);

        final newObj =
            BinaryReader(Uint8List.fromList(gZippedData)).readObject();

        final newRpcResult = RpcResult(reqMsgId: reqMsgId, result: newObj);
        _handleIncomingMessage(newRpcResult);
        return;
      }

      task?.complete(Result._(msg.result, null));
      _pending.remove(reqMsgId);
    }
  }

  Future<Result> invoke(TlObject msg, bool preferEncryption) async {
    final auth = authKey;

    preferEncryption &= auth.id != 0;

    final completer = Completer<Result>();
    final m = idSeq.next(preferEncryption);

    // if (preferEncryption && _msgsToAck.isNotEmpty) {
    //   final ack = idSeq.next(false);
    //   final ackMsg = MsgsAck(msgIds: _msgsToAck.toList());
    //   _msgsToAck.clear();

    //   final container = MsgContainer(
    //     messages: [
    //       Msg(
    //         msgId: m.msgId,
    //         seqno: m.seqno,
    //         bytes: 0,
    //         body: msg,
    //       ),
    //       Msg(
    //         msgId: ack.msgId,
    //         seqno: ack.seqno,
    //         bytes: 0,
    //         body: ackMsg,
    //       )
    //     ],
    //   );

    //   return send(container, false);
    // }

    _pending[m.id] = completer;
    final buffer = auth.id == 0
        ? _encodeNoAuth(msg, m)
        : _encodeWithAuth(msg, m, 10, auth);

    obfuscation?.send.encryptDecrypt(buffer, buffer.length);
    sender.add(Uint8List.fromList(buffer));

    return completer.future;
  }

  /// Invokes an RPC with package's define layer.
  Future<Result<TlObject>> _invokeWithLayer(TlMethod query) => invoke(
        InvokeWithLayer(
          layer: layer,
          query: query,
        ),
        true,
      );
}

class ClientAuth {
  const ClientAuth._(this._c);

  final Client _c;

  Future<Result<AuthSentCodeBase>> sendCode(String phoneNumber,
      [CodeSettings? settings]) async {
    settings ??= CodeSettings(
      allowFlashcall: false,
      currentNumber: false,
      allowAppHash: false,
      allowMissedCall: false,
      allowFirebase: false,
      appSandbox: false,
    );

    final req = AuthSendCode(
      phoneNumber: phoneNumber,
      apiId: _c.apiId,
      apiHash: _c.apiHash,
      settings: settings,
    );

    final res = await _c.invoke(req, true);

    return res._to<AuthSentCodeBase>();
  }

  Future<Result<AuthAuthorizationBase>> signIn(
    String phoneNumber,
    String phoneCodeHash,
    String phoneCode,
  ) async {
    final req = AuthSignIn(
      phoneNumber: phoneNumber,
      phoneCodeHash: phoneCodeHash,
      phoneCode: phoneCode,
    );

    final res = await _c.invoke(req, true);

    return res._to<AuthAuthorizationBase>();
  }

  Future<Result<AuthAuthorizationBase>> checkPassword(
    InputCheckPasswordSRP password,
  ) async {
    final req = AuthCheckPassword(
      password: password,
    );

    final res = await _c.invoke(req, true);

    return res._to<AuthAuthorizationBase>();
  }
}

class ClientConnection {
  const ClientConnection._(this._c);

  final Client _c;

  Future<Result<Config>> initConnection({
    required String appVersion,
    required String deviceModel,
    required String langCode,
    required String langPack,
    required String systemLangCode,
    required String systemVersion,
  }) async {
    final req = InitConnection(
      apiId: _c.apiId,
      appVersion: 'TG 1.0',
      deviceModel: 'PC 64bit',
      langCode: 'en',
      langPack: '',
      systemLangCode: 'en',
      systemVersion: 'Android',
      params: JsonObject(value: []),
      query: HelpGetConfig(),
    );

    final res = await _c._invokeWithLayer(req);
    return res._to<Config>();
  }
}

class ClientAccount {
  const ClientAccount._(this._c);

  final Client _c;

  Future<Result<AccountPassword>> getPassword() async {
    final req = AccountGetPassword();

    final res = await _c.invoke(req, true);
    return res._to<AccountPassword>();
  }
}
