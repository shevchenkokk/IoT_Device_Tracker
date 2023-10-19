import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../generated/device-tracker.pb.dart';
import '../client/client.dart';
import 'groups_page.dart';
import 'add_device.dart';
import '../auth-interceptor.dart';

class DevicesPage extends StatefulWidget {
  final Client client;
  final AuthInterceptor authInterceptor;
  final DeviceGroupData group;

  DevicesPage(
      {required this.client,
      required this.authInterceptor,
      required this.group});

  @override
  _DevicesPageState createState() => _DevicesPageState();
}

class _DevicesPageState extends State<DevicesPage> {
  List<DeviceData>? devices;

  @override
  void initState() {
    super.initState();
    _loadDevicesInGroup();
  }

  Future<void> _loadDevicesInGroup() async {
    try {
      final loadedDevices =
          await widget.client.getDevicesFromGroup(widget.group.id);
      setState(() {
        devices = loadedDevices;
      });
    } catch (error) {
      print('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Устройства'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_rounded),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => GroupsPage(
                      client: widget.client,
                      authInterceptor: widget.authInterceptor)),
            );
          },
        ),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddDevicePage(
                          client: widget.client,
                          authInterceptor: widget.authInterceptor,
                          group: widget.group)),
                );
              },
              child: Text('Добавить устройство'),
            ),
          ),
          if (devices == null)
            Center(
              child: Text('Ошибка загрузки данных'),
            )
          else if (devices!.isEmpty)
            Center(
              child: Text('Нет доступных устройств'),
            )
          else
            Expanded(
              child: ListView.builder(
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
                            color: Colors.red),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Дата создания: ${DateFormat('yyyy/MM/dd hh:mm').format(DateTime.fromMillisecondsSinceEpoch(device.createdAt.seconds.toInt() * 1000)).toString()}'),
                          Text('Статус: ${device.status}'),
                          Text('Описание: ${device.description}')
                        ],
                      ),
                      onTap: () {
                        //
                      },
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
