// To parse this JSON data, do
//
//     final recentPromptModel = recentPromptModelFromJson(jsonString);

import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';
part 'recent_prompt_model.freezed.dart';
part 'recent_prompt_model.g.dart';

RecentPromptModel recentPromptModelFromJson(String str) => RecentPromptModel.fromJson(json.decode(str));

String recentPromptModelToJson(RecentPromptModel data) => json.encode(data.toJson());

@freezed
class RecentPromptModel with _$RecentPromptModel {
    const factory RecentPromptModel({
        String? id,
        String? createdAt,
        String? lastUpdatedAt,
        List<Message>? messages,
    }) = _RecentPromptModel;

    factory RecentPromptModel.fromJson(Map<String, dynamic> json) => _$RecentPromptModelFromJson(json);

}

@freezed
class Message with _$Message {
    const factory Message({
        String? id,
        String? createdAt,
        String? body,
        String? variationImg,
        List<String>? attachments,
        bool? isRegenerating,
        bool? variation
    }) = _Message;

    factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
