part of 'image_gen_cubit.dart';

@freezed
class ImageGenState with _$ImageGenState {

  const ImageGenState._();

  const factory ImageGenState({
    TextEditingController? prompt,
    @Default("") String promptString,
    GenImageModel? genImage,
    List<ImageDatum>? genImageData,
    String? promptError,
    @Default([]) List<String> recentImages,
    List<RecentPromptModel>? recentsPrompts,
    List<Message>? promptMessages,
    ChatErrorModel? chatErrorModel,
    @Default("") String currentMessageId,
    @Default("") String? activeConversationId,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus generateImageStatus,
    @Default(FormzSubmissionStatus.initial) FormzSubmissionStatus reGenerateImageStatus,
  }) = _Initial;

  List<Map<String, dynamic>> get imageSuggestions => [
    {
      'prompt': 'A cat drinking water',
      'image': Assets.images.catmilk.path,
    },
    {
      'prompt': 'Famous historical figures',
      'image': Assets.images.albert.path,
    },
    {
      'prompt': 'A cozy coffee shop',
      'image': Assets.images.coffeeshop.path,
    },
    {
      'prompt': 'A serene mountain lake',
      'image': Assets.images.lake.path,
    },
  ];
}

