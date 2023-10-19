import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../generated/device-tracker.pb.dart';
import '../client/client.dart';
import 'devices_page.dart';
import 'login.dart';
import 'add_group.dart';
import '../auth-interceptor.dart';

class GroupsPage extends StatefulWidget {
  final Client client;
  final AuthInterceptor authInterceptor;

  GroupsPage({required this.client, required this.authInterceptor});

  @override
  _GroupsPageState createState() => _GroupsPageState();
}

class _GroupsPageState extends State<GroupsPage> {
  List<DeviceGroupData>? groups;

  @override
  void initState() {
    super.initState();
    _loadGroups();
  }

  Future<void> _loadGroups() async {
    try {
      final loadedGroups = await widget.client.getDeviceGroups();
      setState(() {
        groups = loadedGroups;
      });
    } catch (error) {
      print('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Группы устройств'),
        leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new_rounded),
            onPressed: () {
              widget.authInterceptor.resetCredentials();
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LoginPage(
                        client: widget.client,
                        authInterceptor: widget.authInterceptor)),
              );
            }),
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
                      builder: (context) => AddGroupPage(
                          client: widget.client,
                          authInterceptor: widget.authInterceptor)),
                );
              },
              child: Text('Добавить группу устройств'),
            ),
          ),
          if (groups == null)
            Center(
              child: Text('Ошибка загрузки данных'),
            )
          else if (groups!.isEmpty)
            Center(
              child: Text('Нет доступных групп'),
            )
          else
            Expanded(
              child: ListView.builder(
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
                          color: Colors.red,
                        ),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              'Дата создания: ${DateFormat('yyyy/MM/dd hh:mm').format(DateTime.fromMillisecondsSinceEpoch(group.createdAt.seconds.toInt() * 1000)).toString()}'),
                          Text('Статус: ${group.status}'),
                          Text('Описание: ${group.description}')
                        ],
                      ),
                      onTap: () async {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => DevicesPage(
                                  client: widget.client,
                                  authInterceptor: widget.authInterceptor,
                                  group: group)),
                        );
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
