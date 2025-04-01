import 'dart:developer';
import 'package:app/core/api/api.dart';
import 'package:app/core/keys/endpoints.dart';
import 'package:app/features/data/datasources/chat_service.dart';
import 'package:app/features/data/models/gen_image_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';


@Named("chatsource")
@Injectable(as: ChatService)

class ChatSource extends ChatService {

  final Api api;

  var baseUrl = dotenv.env['BASE_URL'] ?? '';

  ChatSource({required this.api});

  @override
  Future<GenImageModel> generateImage({
    prompt,
    n
  }) async {
    try {
      String token = dotenv.env["OPEN_AI_KEY"] ?? "";
      log(token);
      Response? response = await api.post(
        "$baseUrl${key.generateImage}",
        data: {
          "prompt": prompt,
          "n": n,
        },
        options: Options(headers: {
          "Content-Type": "application/json",
          "Accept": "application/json",
          "Authorization": "Bearer $token"
        }),
      );
      log('api-resp==> ${response?.data}');
      final r = GenImageModel.fromJson(response?.data);
      return r;
    } catch (e) {
      rethrow;
    }
  }

}