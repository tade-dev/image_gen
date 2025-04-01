// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gen_image_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GenImageModelImpl _$$GenImageModelImplFromJson(Map<String, dynamic> json) =>
    _$GenImageModelImpl(
      created: (json['created'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ImageDatum.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GenImageModelImplToJson(_$GenImageModelImpl instance) =>
    <String, dynamic>{
      'created': instance.created,
      'data': instance.data,
    };

_$ImageDatumImpl _$$ImageDatumImplFromJson(Map<String, dynamic> json) =>
    _$ImageDatumImpl(
      url: json['url'] as String?,
    );

Map<String, dynamic> _$$ImageDatumImplToJson(_$ImageDatumImpl instance) =>
    <String, dynamic>{
      'url': instance.url,
    };
