import 'package:app/auth-interceptor.dart';
import 'package:app/generated/device-tracker.pb.dart';
import 'package:app/widgets/devices_page.dart';
import 'package:flutter/material.dart';
import '../client/client.dart';

class AddDevicePage extends StatelessWidget {
  final Client client;
  final AuthInterceptor authInterceptor;
  final DeviceGroupData group;

  final TextEditingController nameController = TextEditingController();
  final TextEditingController statusController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  AddDevicePage(
      {required this.client,
      required this.authInterceptor,
      required this.group});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Добавление устройства'),
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
                  decoration: InputDecoration(labelText: 'Имя устройства'),
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
                  final deviceId = await client.CreateDevice(
                      group.id, name, status, description);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DevicesPage(
                            client: client,
                            authInterceptor: authInterceptor,
                            group: group)),
                  );
                },
                child: Text('Добавить устройство'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
