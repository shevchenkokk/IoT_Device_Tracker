import 'package:flutter/material.dart';
import 'widgets/login.dart';
import 'client/client.dart';

void main() async {
  var client = Client();
  runApp(App(client: client));
}

class App extends StatelessWidget {
  final Client client;

  App({required this.client});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoT Tracking App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light
      ),
      home: LoginPage(client: client),
      debugShowCheckedModeBanner: false,
    );
  }
}
