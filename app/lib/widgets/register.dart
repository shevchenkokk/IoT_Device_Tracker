import 'package:app/auth-interceptor.dart';
import 'package:flutter/material.dart';
import '../client/client.dart';
import '../exceptions/exceptions.dart';
import 'login.dart';

class RegisterPage extends StatelessWidget {
  final Client client;
  final AuthInterceptor authInterceptor;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repeatedPasswordController =
      TextEditingController();

  RegisterPage({required this.client, required this.authInterceptor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Регистрация'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: 20),
              TextField(
                  decoration: InputDecoration(labelText: 'Имя пользователя'),
                  controller: usernameController),
              SizedBox(height: 20),
              TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Пароль'),
                  controller: passwordController),
              SizedBox(height: 20),
              TextField(
                  obscureText: true,
                  decoration: InputDecoration(labelText: 'Повторите пароль'),
                  controller: repeatedPasswordController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final username = usernameController.text;
                  final password = passwordController.text;
                  final repeatedPassword = repeatedPasswordController.text;

                  if (password != repeatedPassword) {
                    final snackBar = SnackBar(
                      content:
                          Text('Пароль и подтверждение пароля не совпадают'),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    return;
                  }

                  try {
                    final response = await client.register(username, password);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPage(
                              client: client,
                              authInterceptor: authInterceptor)),
                    );
                  } on RegistrationError catch (e) {
                    final snackBar = SnackBar(
                      content: Text(e.message),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: Text('Зарегистрироваться'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
