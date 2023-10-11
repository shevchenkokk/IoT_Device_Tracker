//
//  Generated code. Do not modify.
//  source: device-tracker.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use getDeviceGroupsRequestDescriptor instead')
const GetDeviceGroupsRequest$json = {
  '1': 'GetDeviceGroupsRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 3, '10': 'userId'},
  ],
};

/// Descriptor for `GetDeviceGroupsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDeviceGroupsRequestDescriptor = $convert.base64Decode(
    'ChZHZXREZXZpY2VHcm91cHNSZXF1ZXN0EhcKB3VzZXJfaWQYASABKANSBnVzZXJJZA==');

@$core.Deprecated('Use deviceGroupDataDescriptor instead')
const DeviceGroupData$json = {
  '1': 'DeviceGroupData',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'status', '3': 3, '4': 1, '5': 9, '10': 'status'},
    {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `DeviceGroupData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceGroupDataDescriptor = $convert.base64Decode(
    'Cg9EZXZpY2VHcm91cERhdGESDgoCaWQYASABKANSAmlkEhIKBG5hbWUYAiABKAlSBG5hbWUSFg'
    'oGc3RhdHVzGAMgASgJUgZzdGF0dXMSOQoKY3JlYXRlZF9hdBgEIAEoCzIaLmdvb2dsZS5wcm90'
    'b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBIgCgtkZXNjcmlwdGlvbhgFIAEoCVILZGVzY3JpcH'
    'Rpb24=');

@$core.Deprecated('Use getDeviceGroupsResponseDescriptor instead')
const GetDeviceGroupsResponse$json = {
  '1': 'GetDeviceGroupsResponse',
  '2': [
    {'1': 'groups', '3': 1, '4': 3, '5': 11, '6': '.device_tracker.DeviceGroupData', '10': 'groups'},
  ],
};

/// Descriptor for `GetDeviceGroupsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDeviceGroupsResponseDescriptor = $convert.base64Decode(
    'ChdHZXREZXZpY2VHcm91cHNSZXNwb25zZRI3CgZncm91cHMYASADKAsyHy5kZXZpY2VfdHJhY2'
    'tlci5EZXZpY2VHcm91cERhdGFSBmdyb3Vwcw==');

@$core.Deprecated('Use getDevicesFromGroupRequestDescriptor instead')
const GetDevicesFromGroupRequest$json = {
  '1': 'GetDevicesFromGroupRequest',
  '2': [
    {'1': 'group_id', '3': 1, '4': 1, '5': 3, '10': 'groupId'},
  ],
};

/// Descriptor for `GetDevicesFromGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDevicesFromGroupRequestDescriptor = $convert.base64Decode(
    'ChpHZXREZXZpY2VzRnJvbUdyb3VwUmVxdWVzdBIZCghncm91cF9pZBgBIAEoA1IHZ3JvdXBJZA'
    '==');

@$core.Deprecated('Use deviceDataDescriptor instead')
const DeviceData$json = {
  '1': 'DeviceData',
  '2': [
    {'1': 'id', '3': 1, '4': 1, '5': 3, '10': 'id'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'status', '3': 3, '4': 1, '5': 9, '10': 'status'},
    {'1': 'created_at', '3': 4, '4': 1, '5': 11, '6': '.google.protobuf.Timestamp', '10': 'createdAt'},
    {'1': 'description', '3': 5, '4': 1, '5': 9, '10': 'description'},
  ],
};

/// Descriptor for `DeviceData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deviceDataDescriptor = $convert.base64Decode(
    'CgpEZXZpY2VEYXRhEg4KAmlkGAEgASgDUgJpZBISCgRuYW1lGAIgASgJUgRuYW1lEhYKBnN0YX'
    'R1cxgDIAEoCVIGc3RhdHVzEjkKCmNyZWF0ZWRfYXQYBCABKAsyGi5nb29nbGUucHJvdG9idWYu'
    'VGltZXN0YW1wUgljcmVhdGVkQXQSIAoLZGVzY3JpcHRpb24YBSABKAlSC2Rlc2NyaXB0aW9u');

@$core.Deprecated('Use getDevicesFromGroupResponseDescriptor instead')
const GetDevicesFromGroupResponse$json = {
  '1': 'GetDevicesFromGroupResponse',
  '2': [
    {'1': 'devices', '3': 1, '4': 3, '5': 11, '6': '.device_tracker.DeviceData', '10': 'devices'},
  ],
};

/// Descriptor for `GetDevicesFromGroupResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDevicesFromGroupResponseDescriptor = $convert.base64Decode(
    'ChtHZXREZXZpY2VzRnJvbUdyb3VwUmVzcG9uc2USNAoHZGV2aWNlcxgBIAMoCzIaLmRldmljZV'
    '90cmFja2VyLkRldmljZURhdGFSB2RldmljZXM=');

