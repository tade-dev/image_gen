// To parse this JSON data, do
//
//     final genImageModel = genImageModelFromJson(jsonString);

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dart:convert';

part 'gen_image_model.freezed.dart';
part 'gen_image_model.g.dart';

GenImageModel genImageModelFromJson(String str) => GenImageModel.fromJson(json.decode(str));

String genImageModelToJson(GenImageModel data) => json.encode(data.toJson());

@freezed
class GenImageModel with _$GenImageModel {
    const factory GenImageModel({
        int? created,
        List<ImageDatum>? data,
    }) = _GenImageModel;

    factory GenImageModel.fromJson(Map<String, dynamic> json) => _$GenImageModelFromJson(json);
}

@freezed
class ImageDatum with _$ImageDatum {
    const factory ImageDatum({
        String? url,
    }) = _ImageDatum;

    factory ImageDatum.fromJson(Map<String, dynamic> json) => _$ImageDatumFromJson(json);
}
