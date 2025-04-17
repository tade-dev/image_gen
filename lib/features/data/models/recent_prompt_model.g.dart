// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_prompt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecentPromptModelImpl _$$RecentPromptModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecentPromptModelImpl(
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      lastUpdatedAt: json['lastUpdatedAt'] as String?,
      messages: (json['messages'] as List<dynamic>?)
          ?.map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$RecentPromptModelImplToJson(
        _$RecentPromptModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'lastUpdatedAt': instance.lastUpdatedAt,
      'messages': instance.messages,
    };

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
      body: json['body'] as String?,
      attachments: (json['attachments'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      isRegenerating: json['isRegenerating'] as bool?,
      variation: json['variation'] as bool?,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'createdAt': instance.createdAt,
      'body': instance.body,
      'attachments': instance.attachments,
      'isRegenerating': instance.isRegenerating,
      'variation': instance.variation,
    };
