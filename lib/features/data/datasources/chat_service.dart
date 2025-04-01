import 'package:app/features/data/models/gen_image_model.dart';
import 'package:injectable/injectable.dart';


@factoryMethod
abstract class ChatService {

  Future<GenImageModel> generateImage({prompt, n});

}