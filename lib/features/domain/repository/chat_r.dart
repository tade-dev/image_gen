import 'package:app/core/entites/app_error.dart';
import 'package:app/features/data/models/gen_image_model.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@factoryMethod
abstract class ChatRepository {

  Future<Either<AppError, GenImageModel>> generateImage({
    prompt, n
  });

}