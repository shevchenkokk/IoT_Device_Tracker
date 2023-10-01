import 'package:flutter/material.dart';
import 'widgets/login.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoT Tracking App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        brightness: Brightness.light
      ),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
