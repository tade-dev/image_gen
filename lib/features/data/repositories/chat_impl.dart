import 'dart:developer';

import 'package:app/core/entites/app_error.dart';
import 'package:app/features/data/datasources/chat_service.dart';
import 'package:app/features/data/models/gen_image_model.dart';
import 'package:app/features/domain/repository/chat_r.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@Named("ChatRepository")
@Injectable(as: ChatRepository)

class ChatImpl extends ChatRepository {

  final ChatService chatService;

  ChatImpl(@Named("chatsource") this.chatService);

  @override
  Future<Either<AppError, GenImageModel>> generateImage(
    {prompt, n}
  ) async {
    try {
      final dataResp = await chatService.generateImage(
        prompt: prompt,
        n: n
      );
      log('dataResp:: $dataResp');
      return Right(dataResp);
    } on DioException catch (e) {
      if (e.response?.statusCode == 400) {
        return Right(GenImageModel.fromJson(e.response!.data));
      } else {
        return Left(AppError(e.message ?? "Unexpected error please try again"));
      }
    }
  }
}
