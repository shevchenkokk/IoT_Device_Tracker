import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../generated/device-tracker.pb.dart';
import '../client/client.dart';
import 'devices_page.dart';

class GroupsPage extends StatelessWidget {
  final Client client;
  final List<DeviceGroupData>? groups;

  GroupsPage({required this.client, required this.groups});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Группы устройств'),
      ),
      body: groups == null
          ? Center(
              child: Text('Ошибка загрузки данных'),
            )
          : groups!.isEmpty
          ? Center(
              child: Text('Нет доступных групп'),
            )
      : ListView.builder(
        itemCount: groups!.length,
        itemBuilder: (context, index) {
          final group = groups![index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: Text(
                  group.name,
                  style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
              ),
              subtitle: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Дата создания: ${DateFormat('yyyy/MM/dd hh:mm').format(DateTime.fromMillisecondsSinceEpoch(group.createdAt.seconds.toInt() * 1000)).toString()}'),
                  Text('Статус: ${group.status}'),
                  Text('Описание: ${group.description}')
                ],
              ),
              // Обработчик для перехода к устройствам в группе
              onTap: () async {
                var devices = await client.fetchDevices(group.id);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DevicesPage(client: client, devices: devices)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

