import 'package:fixnum/fixnum.dart';
import 'package:grpc/grpc.dart';
import '../generated/device-tracker.pbgrpc.dart';
import '../auth-service-generated/auth-service.pbgrpc.dart';
import '../auth-interceptor.dart';
import '../exceptions/exceptions.dart';

class Client {
  late final ClientChannel channel;
  late DeviceTrackerServiceClient client;
  late AuthServiceClient authClient;

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
    authClient = AuthServiceClient(channel,
        options: CallOptions(timeout: const Duration(seconds: 30)));
  }

  Future<EmptyResponse> _register(RegistrationRequest request) async {
    return await authClient.registration(request);
  }

  Future<LoginResponse> _login(LoginRequest request) async {
    return await authClient.login(request);
  }

  Future<EmptyResponse> register(String username, String password) async {
    var request = RegistrationRequest()
      ..username = username
      ..password = password;

    try {
      final response = await _register(request);
      return response;
    } catch (e) {
      print('An error occured: $e');
      if (e is GrpcError) {
        if (e.code == 6) {
          throw RegistrationError('Пользователь с таким именем уже существует');
        } else {
          throw RegistrationError('Произошла ошибка при регистрации');
        }
      }
      throw RegistrationError('Произошла неизвестная ошибка');
    }
  }

  Future<LoginResponse> login(String username, String password) async {
    var request = LoginRequest()
      ..username = username
      ..password = password;

    try {
      final response = await _login(request);
      return response;
    } catch (e) {
      print('An error occured: $e');
      if (e is GrpcError) {
        if (e.code == 13) {
          throw AuthorizationError('Пользователь с таким именем не существует');
        } else {
          throw AuthorizationError('Произошла ошибка при авторизации');
        }
      }
      throw AuthorizationError('Произошла неизвестная ошибка');
    }
  }

  void updateState(AuthInterceptor interceptor) {
    client = DeviceTrackerServiceClient(channel,
        options: CallOptions(timeout: const Duration(seconds: 30)),
        interceptors: [interceptor]);
  }

  Future<GetDeviceGroupsResponse> _getDeviceGroups(
      GetDeviceGroupsRequest request) async {
    return await client.getDeviceGroups(request);
  }

  Future<GetDevicesFromGroupResponse> _getDevicesFromGroup(
      GetDevicesFromGroupRequest request) async {
    return await client.getDevicesFromGroup(request);
  }

  Future<List<DeviceGroupData>?> getDeviceGroups() async {
    final request = GetDeviceGroupsRequest();

    try {
      final response = await _getDeviceGroups(request);
      return response.groups;
    } catch (e) {
      print('An error occurred: $e');
      return null;
    }
  }

  Future<List<DeviceData>?> getDevicesFromGroup(Int64 groupId) async {
    final request = GetDevicesFromGroupRequest()..groupId = groupId;

    try {
      final response = await _getDevicesFromGroup(request);
      return response.devices;
    } catch (e) {
      print('An error occurred: $e');
      return null;
    }
  }

  Future<CreateDeviceGroupResponse> _createDeviceGroup(
      CreateDeviceGroupRequest request) async {
    return await client.createDeviceGroup(request);
  }

  Future<Int64?> CreateDeviceGroup(
      String name, String status, String description) async {
    final request = CreateDeviceGroupRequest()
      ..name = name
      ..status = status
      ..description = description;

    try {
      final response = await _createDeviceGroup(request);
      return response.id;
    } catch (e) {
      print('An error occurred: $e');
    }
  }

  Future<CreateDeviceResponse> _createDevice(
      CreateDeviceRequest request) async {
    return await client.createDevice(request);
  }

  Future<Int64?> CreateDevice(
      Int64 groupId, String name, String status, String description) async {
    final request = CreateDeviceRequest()
      ..groupId = groupId
      ..name = name
      ..status = status
      ..description = description;

    try {
      final response = await _createDevice(request);
      return response.id;
    } catch (e) {
      print('An error occurred: $e');
    }
  }
}
