import 'package:app/auth-interceptor.dart';
import 'package:app/widgets/groups_page.dart';
import 'package:flutter/material.dart';
import '../client/client.dart';
import 'register.dart';
import '../exceptions/exceptions.dart';

class LoginPage extends StatelessWidget {
  final Client client;
  final AuthInterceptor authInterceptor;
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginPage({required this.client, required this.authInterceptor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset('assets/images/logo.png'),
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
                ElevatedButton(
                  onPressed: () async {
                    final username = usernameController.text;
                    final password = passwordController.text;

                    try {
                      final response = await client.login(username, password);
                      authInterceptor.updateCredentials(
                          context, username, password, response.accessToken);
                      client.updateState(authInterceptor);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GroupsPage(
                                client: client,
                                authInterceptor: authInterceptor)),
                      );
                    } on AuthorizationError catch (e) {
                      final snackBar = SnackBar(
                        content: Text(e.message),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text('Войти'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegisterPage(
                              client: client,
                              authInterceptor: authInterceptor)),
                    );
                  },
                  child: Text('Зарегистрироваться'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
