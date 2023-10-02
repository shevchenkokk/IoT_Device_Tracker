//
//  Generated code. Do not modify.
//  source: device-tracker.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'device-tracker.pb.dart' as $0;
import 'device-tracker.pbjson.dart';

export 'device-tracker.pb.dart';

abstract class DeviceTrackerServiceBase extends $pb.GeneratedService {
  $async.Future<$0.ToUpperResponse> toUpper($pb.ServerContext ctx, $0.ToUpperRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'ToUpper': return $0.ToUpperRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'ToUpper': return this.toUpper(ctx, request as $0.ToUpperRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => DeviceTrackerServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => DeviceTrackerServiceBase$messageJson;
}

