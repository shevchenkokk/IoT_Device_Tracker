import 'package:flutter/material.dart';
import 'package:fixnum/fixnum.dart';
import '../client/client.dart';
import 'register.dart';
import 'groups_page.dart';

class LoginPage extends StatelessWidget {
  final Client client;

  LoginPage({required this.client});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/logo.png'),
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(labelText: 'Имя пользователя'),
              ),
              SizedBox(height: 20),
              TextField(
                obscureText: true,
                decoration: InputDecoration(labelText: 'Пароль'),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  var groups = await client.fetchGroups(Int64(1));
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GroupsPage(client: client, groups: groups)), // GroupsPage - новый экран для списка групп
                  );
                },
                child: Text('Войти'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegisterPage()),
                  );
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