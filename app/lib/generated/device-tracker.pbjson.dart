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

@$core.Deprecated('Use toUpperRequestDescriptor instead')
const ToUpperRequest$json = {
  '1': 'ToUpperRequest',
  '2': [
    {'1': 'input_string', '3': 1, '4': 1, '5': 9, '10': 'inputString'},
  ],
};

/// Descriptor for `ToUpperRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List toUpperRequestDescriptor = $convert.base64Decode(
    'Cg5Ub1VwcGVyUmVxdWVzdBIhCgxpbnB1dF9zdHJpbmcYASABKAlSC2lucHV0U3RyaW5n');

@$core.Deprecated('Use toUpperResponseDescriptor instead')
const ToUpperResponse$json = {
  '1': 'ToUpperResponse',
  '2': [
    {'1': 'converted_string', '3': 1, '4': 1, '5': 9, '10': 'convertedString'},
  ],
};

/// Descriptor for `ToUpperResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List toUpperResponseDescriptor = $convert.base64Decode(
    'Cg9Ub1VwcGVyUmVzcG9uc2USKQoQY29udmVydGVkX3N0cmluZxgBIAEoCVIPY29udmVydGVkU3'
    'RyaW5n');

const $core.Map<$core.String, $core.dynamic> DeviceTrackerServiceBase$json = {
  '1': 'DeviceTrackerService',
  '2': [
    {'1': 'ToUpper', '2': '.device_tracker.ToUpperRequest', '3': '.device_tracker.ToUpperResponse', '4': {}},
  ],
};

@$core.Deprecated('Use deviceTrackerServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> DeviceTrackerServiceBase$messageJson = {
  '.device_tracker.ToUpperRequest': ToUpperRequest$json,
  '.device_tracker.ToUpperResponse': ToUpperResponse$json,
};

/// Descriptor for `DeviceTrackerService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List deviceTrackerServiceDescriptor = $convert.base64Decode(
    'ChREZXZpY2VUcmFja2VyU2VydmljZRJMCgdUb1VwcGVyEh4uZGV2aWNlX3RyYWNrZXIuVG9VcH'
    'BlclJlcXVlc3QaHy5kZXZpY2VfdHJhY2tlci5Ub1VwcGVyUmVzcG9uc2UiAA==');

