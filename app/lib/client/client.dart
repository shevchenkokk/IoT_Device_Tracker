import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import '../generated/device-tracker.pbgrpc.dart';

class Client {
  late final ClientChannel channel;
  late final DeviceTrackerServiceClient client;

  Client() {
    channel = ClientChannel(
      '10.0.2.2',
      port: 50051,
      options: const ChannelOptions(
        credentials: ChannelCredentials.insecure(),
      ),
    );

    client = DeviceTrackerServiceClient(channel,
    options: CallOptions(timeout: const Duration(seconds: 30)));
  }

  Future<GetDeviceGroupsResponse> getDeviceGroups(GetDeviceGroupsRequest request) async {
    return await client.getDeviceGroups(request);
  }

  Future<GetDevicesFromGroupResponse> getDevicesFromGroup(GetDevicesFromGroupRequest request) async {
    return await client.getDevicesFromGroup(request);
  }

  Future<List<DeviceGroupData>?> fetchGroups(Int64 user_id) async {
    final request = GetDeviceGroupsRequest()
      ..userId = user_id;

    try {
      final response = await getDeviceGroups(request);
      return response.groups;
    } catch (e) {
      print('An error occurred: $e');
      return null;
    }
  }

  Future<List<DeviceData>?> fetchDevices(Int64 group_id) async {
    final request = GetDevicesFromGroupRequest()
      ..groupId = group_id;

    try {
      final response = await getDevicesFromGroup(request);
      return response.devices;
    } catch (e) {
      print('An error occurred: $e');
      return null;
    }
  }
}