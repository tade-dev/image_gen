import 'package:app/core/entites/app_error.dart';
import 'package:app/core/model/ranv_model.dart';
import 'package:app/core/usecase/usecase.dart';
import 'package:app/features/data/models/gen_image_model.dart';
import 'package:app/features/domain/repository/chat_r.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class GenerateImageUsecase extends UseCase<GenImageModel, RequestParams> {
  final ChatRepository chatRepository;

  GenerateImageUsecase(@Named("ChatRepository") this.chatRepository);

  @override
  Future<Either<AppError, GenImageModel>> call(RequestParams params) async {
    return await chatRepository.generateImage(
      prompt: params.prompt,
      n: params.numberOfImages
    );
  }
}