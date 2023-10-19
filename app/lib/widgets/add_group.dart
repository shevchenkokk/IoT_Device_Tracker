import 'package:app/auth-interceptor.dart';
import 'package:app/widgets/groups_page.dart';
import 'package:flutter/material.dart';
import '../client/client.dart';

class AddGroupPage extends StatelessWidget {
  final Client client;
  final AuthInterceptor authInterceptor;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  AddGroupPage({required this.client, required this.authInterceptor});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавление группы устройств'),
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
                  decoration:
                      InputDecoration(labelText: 'Имя группы устройств'),
                  controller: nameController),
              SizedBox(height: 20),
              TextField(
                  decoration: InputDecoration(labelText: 'Статус'),
                  controller: statusController),
              SizedBox(height: 20),
              TextField(
                  decoration: InputDecoration(labelText: 'Описание'),
                  controller: descriptionController),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  final name = nameController.text;
                  final status = statusController.text;
                  final description = descriptionController.text;

                  final groupId =
                      await client.CreateDeviceGroup(name, status, description);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => GroupsPage(
                            client: client, authInterceptor: authInterceptor)),
                  );
                },
                child: Text('Добавить группу'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
