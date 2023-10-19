import 'package:flutter/material.dart';
import 'package:grpc/grpc.dart';
import 'dart:async';
import 'client/client.dart' as MyClient;
import 'widgets/login.dart';
import 'exceptions/exceptions.dart';

class AuthInterceptor implements ClientInterceptor {
  late BuildContext context;
  final MyClient.Client client;
  late String username;
  late String password;
  late String token;
  late Timer tokenRefreshTimer;

  AuthInterceptor(this.client) {}

  @override
  ResponseFuture<R> interceptUnary<Q, R>(
      ClientMethod<Q, R> method,
      Q request,
      CallOptions options,
      ResponseFuture<R> Function(
              ClientMethod<Q, R> method, Q request, CallOptions options)
          invoker) {
    var newOptions = options.mergedWith(CallOptions(metadata: <String, String>{
      'authorization': token,
    }));

    return invoker(method, request, newOptions);
  }

  Future<void> refreshToken() async {
    try {
      final response = await client.login(username, password);
      token = response.accessToken;
      print(token);
    } on AuthorizationError catch (e) {
      // Handle any errors when refreshing the token.
      print('Failed to refresh access token: $e');
      resetCredentials();
      final snackBar = SnackBar(
        content: Text(e.message),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) =>
                LoginPage(client: client, authInterceptor: this)),
      );
    }
  }

  void _startTokenRefreshBackgroundProcess() {
    final interval = Duration(seconds: 15);
    tokenRefreshTimer = Timer.periodic(interval, (timer) async {
      refreshToken();
    });
  }

  void updateCredentials(BuildContext newContext, String newUsername,
      String newPassword, String newToken) {
    context = newContext;
    username = newUsername;
    password = newPassword;
    token = newToken;
    _startTokenRefreshBackgroundProcess();
  }

  void resetCredentials() {
    username = '';
    password = '';
    token = '';
    tokenRefreshTimer.cancel();
  }

  @override
  ResponseStream<R> interceptStreaming<Q, R>(
      ClientMethod<Q, R> method,
      Stream<Q> requests,
      CallOptions options,
      ClientStreamingInvoker<Q, R> invoker) {
    throw UnimplementedError(
        "interceptStreaming is not implemented in this interceptor");
  }
}
