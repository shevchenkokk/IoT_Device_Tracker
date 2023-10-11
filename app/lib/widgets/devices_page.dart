import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../generated/device-tracker.pb.dart';
import '../client/client.dart';

class DevicesPage extends StatelessWidget {
  final Client client;
  final List<DeviceData>? devices;

  DevicesPage({required this.client, required this.devices});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Устройства'),
      ),
      body: devices == null
          ? Center(
              child: Text('Ошибка загрузки данных'),
            )
          : devices!.isEmpty
          ? Center(
            child: Text('Нет доступных устройств'),
            )
          : ListView.builder(
        itemCount: devices!.length,
        itemBuilder: (context, index) {
          final device = devices![index];
          return Card(
            elevation: 5,
            margin: EdgeInsets.all(15),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            child: ListTile(
              title: Text(
                device.name,
                style: TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.red
                ),
              ),
              subtitle: Column (
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Дата создания: ${DateFormat('yyyy/MM/dd hh:mm').format(DateTime.fromMillisecondsSinceEpoch(device.createdAt.seconds.toInt() * 1000)).toString()}'),
                  Text('Статус: ${device.status}'),
                  Text('Описание: ${device.description}')
                ],
              ),
                // Обработчик для перехода к параметрам устройства...
              onTap: ()  {
                //
              },
            ),
          );
        },
      ),
    );
  }
}