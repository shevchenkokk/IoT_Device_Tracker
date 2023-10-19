//
//  Generated code. Do not modify.
//  source: device-tracker.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'package:protobuf/protobuf.dart' as $pb;

import 'device-tracker.pb.dart' as $0;

export 'device-tracker.pb.dart';

@$pb.GrpcServiceName('device_tracker.DeviceTrackerService')
class DeviceTrackerServiceClient extends $grpc.Client {
  static final _$getDeviceGroups = $grpc.ClientMethod<$0.GetDeviceGroupsRequest, $0.GetDeviceGroupsResponse>(
      '/device_tracker.DeviceTrackerService/GetDeviceGroups',
      ($0.GetDeviceGroupsRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetDeviceGroupsResponse.fromBuffer(value));
  static final _$getDevicesFromGroup = $grpc.ClientMethod<$0.GetDevicesFromGroupRequest, $0.GetDevicesFromGroupResponse>(
      '/device_tracker.DeviceTrackerService/GetDevicesFromGroup',
      ($0.GetDevicesFromGroupRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.GetDevicesFromGroupResponse.fromBuffer(value));
  static final _$createDeviceGroup = $grpc.ClientMethod<$0.CreateDeviceGroupRequest, $0.CreateDeviceGroupResponse>(
      '/device_tracker.DeviceTrackerService/CreateDeviceGroup',
      ($0.CreateDeviceGroupRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateDeviceGroupResponse.fromBuffer(value));
  static final _$createDevice = $grpc.ClientMethod<$0.CreateDeviceRequest, $0.CreateDeviceResponse>(
      '/device_tracker.DeviceTrackerService/CreateDevice',
      ($0.CreateDeviceRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.CreateDeviceResponse.fromBuffer(value));

  DeviceTrackerServiceClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options,
        interceptors: interceptors);

  $grpc.ResponseFuture<$0.GetDeviceGroupsResponse> getDeviceGroups($0.GetDeviceGroupsRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDeviceGroups, request, options: options);
  }

  $grpc.ResponseFuture<$0.GetDevicesFromGroupResponse> getDevicesFromGroup($0.GetDevicesFromGroupRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$getDevicesFromGroup, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateDeviceGroupResponse> createDeviceGroup($0.CreateDeviceGroupRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createDeviceGroup, request, options: options);
  }

  $grpc.ResponseFuture<$0.CreateDeviceResponse> createDevice($0.CreateDeviceRequest request, {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$createDevice, request, options: options);
  }
}

@$pb.GrpcServiceName('device_tracker.DeviceTrackerService')
abstract class DeviceTrackerServiceBase extends $grpc.Service {
  $core.String get $name => 'device_tracker.DeviceTrackerService';

  DeviceTrackerServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.GetDeviceGroupsRequest, $0.GetDeviceGroupsResponse>(
        'GetDeviceGroups',
        getDeviceGroups_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetDeviceGroupsRequest.fromBuffer(value),
        ($0.GetDeviceGroupsResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.GetDevicesFromGroupRequest, $0.GetDevicesFromGroupResponse>(
        'GetDevicesFromGroup',
        getDevicesFromGroup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.GetDevicesFromGroupRequest.fromBuffer(value),
        ($0.GetDevicesFromGroupResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateDeviceGroupRequest, $0.CreateDeviceGroupResponse>(
        'CreateDeviceGroup',
        createDeviceGroup_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateDeviceGroupRequest.fromBuffer(value),
        ($0.CreateDeviceGroupResponse value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.CreateDeviceRequest, $0.CreateDeviceResponse>(
        'CreateDevice',
        createDevice_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.CreateDeviceRequest.fromBuffer(value),
        ($0.CreateDeviceResponse value) => value.writeToBuffer()));
  }

  $async.Future<$0.GetDeviceGroupsResponse> getDeviceGroups_Pre($grpc.ServiceCall call, $async.Future<$0.GetDeviceGroupsRequest> request) async {
    return getDeviceGroups(call, await request);
  }

  $async.Future<$0.GetDevicesFromGroupResponse> getDevicesFromGroup_Pre($grpc.ServiceCall call, $async.Future<$0.GetDevicesFromGroupRequest> request) async {
    return getDevicesFromGroup(call, await request);
  }

  $async.Future<$0.CreateDeviceGroupResponse> createDeviceGroup_Pre($grpc.ServiceCall call, $async.Future<$0.CreateDeviceGroupRequest> request) async {
    return createDeviceGroup(call, await request);
  }

  $async.Future<$0.CreateDeviceResponse> createDevice_Pre($grpc.ServiceCall call, $async.Future<$0.CreateDeviceRequest> request) async {
    return createDevice(call, await request);
  }

  $async.Future<$0.GetDeviceGroupsResponse> getDeviceGroups($grpc.ServiceCall call, $0.GetDeviceGroupsRequest request);
  $async.Future<$0.GetDevicesFromGroupResponse> getDevicesFromGroup($grpc.ServiceCall call, $0.GetDevicesFromGroupRequest request);
  $async.Future<$0.CreateDeviceGroupResponse> createDeviceGroup($grpc.ServiceCall call, $0.CreateDeviceGroupRequest request);
  $async.Future<$0.CreateDeviceResponse> createDevice($grpc.ServiceCall call, $0.CreateDeviceRequest request);
}
