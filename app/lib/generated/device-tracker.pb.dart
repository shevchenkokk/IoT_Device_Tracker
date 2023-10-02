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

import 'package:protobuf/protobuf.dart' as $pb;

class ToUpperRequest extends $pb.GeneratedMessage {
  factory ToUpperRequest({
    $core.String? inputString,
  }) {
    final $result = create();
    if (inputString != null) {
      $result.inputString = inputString;
    }
    return $result;
  }
  ToUpperRequest._() : super();
  factory ToUpperRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ToUpperRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ToUpperRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'device_tracker'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'inputString')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ToUpperRequest clone() => ToUpperRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ToUpperRequest copyWith(void Function(ToUpperRequest) updates) => super.copyWith((message) => updates(message as ToUpperRequest)) as ToUpperRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ToUpperRequest create() => ToUpperRequest._();
  ToUpperRequest createEmptyInstance() => create();
  static $pb.PbList<ToUpperRequest> createRepeated() => $pb.PbList<ToUpperRequest>();
  @$core.pragma('dart2js:noInline')
  static ToUpperRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ToUpperRequest>(create);
  static ToUpperRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get inputString => $_getSZ(0);
  @$pb.TagNumber(1)
  set inputString($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasInputString() => $_has(0);
  @$pb.TagNumber(1)
  void clearInputString() => clearField(1);
}

class ToUpperResponse extends $pb.GeneratedMessage {
  factory ToUpperResponse({
    $core.String? convertedString,
  }) {
    final $result = create();
    if (convertedString != null) {
      $result.convertedString = convertedString;
    }
    return $result;
  }
  ToUpperResponse._() : super();
  factory ToUpperResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ToUpperResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ToUpperResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'device_tracker'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'convertedString')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ToUpperResponse clone() => ToUpperResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ToUpperResponse copyWith(void Function(ToUpperResponse) updates) => super.copyWith((message) => updates(message as ToUpperResponse)) as ToUpperResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ToUpperResponse create() => ToUpperResponse._();
  ToUpperResponse createEmptyInstance() => create();
  static $pb.PbList<ToUpperResponse> createRepeated() => $pb.PbList<ToUpperResponse>();
  @$core.pragma('dart2js:noInline')
  static ToUpperResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ToUpperResponse>(create);
  static ToUpperResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get convertedString => $_getSZ(0);
  @$pb.TagNumber(1)
  set convertedString($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasConvertedString() => $_has(0);
  @$pb.TagNumber(1)
  void clearConvertedString() => clearField(1);
}

class DeviceTrackerServiceApi {
  $pb.RpcClient _client;
  DeviceTrackerServiceApi(this._client);

  $async.Future<ToUpperResponse> toUpper($pb.ClientContext? ctx, ToUpperRequest request) =>
    _client.invoke<ToUpperResponse>(ctx, 'DeviceTrackerService', 'ToUpper', request, ToUpperResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
