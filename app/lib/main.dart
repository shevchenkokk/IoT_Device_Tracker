import 'package:flutter/material.dart';
import 'widgets/login.dart';
import 'client/client.dart';
import '../auth-interceptor.dart';

void main() async {
  var client = Client();
  var authInterceptor = AuthInterceptor(client);
  runApp(App(client: client, authInterceptor: authInterceptor));
}

class App extends StatelessWidget {
  final Client client;
  final AuthInterceptor authInterceptor;

  App({required this.client, required this.authInterceptor});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoT Tracking App',
      theme: ThemeData(primarySwatch: Colors.red, brightness: Brightness.light),
      home: LoginPage(client: client, authInterceptor: authInterceptor),
      debugShowCheckedModeBanner: false,
    );
  }
}
