// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_error_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatErrorModelImpl _$$ChatErrorModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatErrorModelImpl(
      error: json['error'] == null
          ? null
          : Error.fromJson(json['error'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChatErrorModelImplToJson(
        _$ChatErrorModelImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
    };

_$ErrorImpl _$$ErrorImplFromJson(Map<String, dynamic> json) => _$ErrorImpl(
      code: json['code'],
      message: json['message'] as String?,
      param: json['param'],
      type: json['type'] as String?,
    );

Map<String, dynamic> _$$ErrorImplToJson(_$ErrorImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'message': instance.message,
      'param': instance.param,
      'type': instance.type,
    };
