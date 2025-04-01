// To parse this JSON data, do
//
//     final chatErrorModel = chatErrorModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'chat_error_model.freezed.dart';
part 'chat_error_model.g.dart';

ChatErrorModel chatErrorModelFromJson(String str) => ChatErrorModel.fromJson(json.decode(str));

String chatErrorModelToJson(ChatErrorModel data) => json.encode(data.toJson());

@freezed
class ChatErrorModel with _$ChatErrorModel {
    const factory ChatErrorModel({
        Error? error,
    }) = _ChatErrorModel;

    factory ChatErrorModel.fromJson(Map<String, dynamic> json) => _$ChatErrorModelFromJson(json);
}

@freezed
class Error with _$Error {
    const factory Error({
        dynamic code,
        String? message,
        dynamic param,
        String? type,
    }) = _Error;

    factory Error.fromJson(Map<String, dynamic> json) => _$ErrorFromJson(json);
}
