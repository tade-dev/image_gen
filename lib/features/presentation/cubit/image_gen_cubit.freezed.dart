// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_gen_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ImageGenState {
  TextEditingController? get prompt => throw _privateConstructorUsedError;
  String get promptString => throw _privateConstructorUsedError;
  GenImageModel? get genImage => throw _privateConstructorUsedError;
  List<ImageDatum>? get genImageData => throw _privateConstructorUsedError;
  String? get promptError => throw _privateConstructorUsedError;
  List<String> get recentImages => throw _privateConstructorUsedError;
  List<RecentPromptModel>? get recentsPrompts =>
      throw _privateConstructorUsedError;
  List<Message>? get promptMessages => throw _privateConstructorUsedError;
  ChatErrorModel? get chatErrorModel => throw _privateConstructorUsedError;
  String get currentMessageId => throw _privateConstructorUsedError;
  FormzSubmissionStatus get generateImageStatus =>
      throw _privateConstructorUsedError;
  FormzSubmissionStatus get reGenerateImageStatus =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ImageGenStateCopyWith<ImageGenState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageGenStateCopyWith<$Res> {
  factory $ImageGenStateCopyWith(
          ImageGenState value, $Res Function(ImageGenState) then) =
      _$ImageGenStateCopyWithImpl<$Res, ImageGenState>;
  @useResult
  $Res call(
      {TextEditingController? prompt,
      String promptString,
      GenImageModel? genImage,
      List<ImageDatum>? genImageData,
      String? promptError,
      List<String> recentImages,
      List<RecentPromptModel>? recentsPrompts,
      List<Message>? promptMessages,
      ChatErrorModel? chatErrorModel,
      String currentMessageId,
      FormzSubmissionStatus generateImageStatus,
      FormzSubmissionStatus reGenerateImageStatus});

  $GenImageModelCopyWith<$Res>? get genImage;
  $ChatErrorModelCopyWith<$Res>? get chatErrorModel;
}

/// @nodoc
class _$ImageGenStateCopyWithImpl<$Res, $Val extends ImageGenState>
    implements $ImageGenStateCopyWith<$Res> {
  _$ImageGenStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = freezed,
    Object? promptString = null,
    Object? genImage = freezed,
    Object? genImageData = freezed,
    Object? promptError = freezed,
    Object? recentImages = null,
    Object? recentsPrompts = freezed,
    Object? promptMessages = freezed,
    Object? chatErrorModel = freezed,
    Object? currentMessageId = null,
    Object? generateImageStatus = null,
    Object? reGenerateImageStatus = null,
  }) {
    return _then(_value.copyWith(
      prompt: freezed == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      promptString: null == promptString
          ? _value.promptString
          : promptString // ignore: cast_nullable_to_non_nullable
              as String,
      genImage: freezed == genImage
          ? _value.genImage
          : genImage // ignore: cast_nullable_to_non_nullable
              as GenImageModel?,
      genImageData: freezed == genImageData
          ? _value.genImageData
          : genImageData // ignore: cast_nullable_to_non_nullable
              as List<ImageDatum>?,
      promptError: freezed == promptError
          ? _value.promptError
          : promptError // ignore: cast_nullable_to_non_nullable
              as String?,
      recentImages: null == recentImages
          ? _value.recentImages
          : recentImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recentsPrompts: freezed == recentsPrompts
          ? _value.recentsPrompts
          : recentsPrompts // ignore: cast_nullable_to_non_nullable
              as List<RecentPromptModel>?,
      promptMessages: freezed == promptMessages
          ? _value.promptMessages
          : promptMessages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
      chatErrorModel: freezed == chatErrorModel
          ? _value.chatErrorModel
          : chatErrorModel // ignore: cast_nullable_to_non_nullable
              as ChatErrorModel?,
      currentMessageId: null == currentMessageId
          ? _value.currentMessageId
          : currentMessageId // ignore: cast_nullable_to_non_nullable
              as String,
      generateImageStatus: null == generateImageStatus
          ? _value.generateImageStatus
          : generateImageStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      reGenerateImageStatus: null == reGenerateImageStatus
          ? _value.reGenerateImageStatus
          : reGenerateImageStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $GenImageModelCopyWith<$Res>? get genImage {
    if (_value.genImage == null) {
      return null;
    }

    return $GenImageModelCopyWith<$Res>(_value.genImage!, (value) {
      return _then(_value.copyWith(genImage: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatErrorModelCopyWith<$Res>? get chatErrorModel {
    if (_value.chatErrorModel == null) {
      return null;
    }

    return $ChatErrorModelCopyWith<$Res>(_value.chatErrorModel!, (value) {
      return _then(_value.copyWith(chatErrorModel: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res>
    implements $ImageGenStateCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {TextEditingController? prompt,
      String promptString,
      GenImageModel? genImage,
      List<ImageDatum>? genImageData,
      String? promptError,
      List<String> recentImages,
      List<RecentPromptModel>? recentsPrompts,
      List<Message>? promptMessages,
      ChatErrorModel? chatErrorModel,
      String currentMessageId,
      FormzSubmissionStatus generateImageStatus,
      FormzSubmissionStatus reGenerateImageStatus});

  @override
  $GenImageModelCopyWith<$Res>? get genImage;
  @override
  $ChatErrorModelCopyWith<$Res>? get chatErrorModel;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$ImageGenStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? prompt = freezed,
    Object? promptString = null,
    Object? genImage = freezed,
    Object? genImageData = freezed,
    Object? promptError = freezed,
    Object? recentImages = null,
    Object? recentsPrompts = freezed,
    Object? promptMessages = freezed,
    Object? chatErrorModel = freezed,
    Object? currentMessageId = null,
    Object? generateImageStatus = null,
    Object? reGenerateImageStatus = null,
  }) {
    return _then(_$InitialImpl(
      prompt: freezed == prompt
          ? _value.prompt
          : prompt // ignore: cast_nullable_to_non_nullable
              as TextEditingController?,
      promptString: null == promptString
          ? _value.promptString
          : promptString // ignore: cast_nullable_to_non_nullable
              as String,
      genImage: freezed == genImage
          ? _value.genImage
          : genImage // ignore: cast_nullable_to_non_nullable
              as GenImageModel?,
      genImageData: freezed == genImageData
          ? _value._genImageData
          : genImageData // ignore: cast_nullable_to_non_nullable
              as List<ImageDatum>?,
      promptError: freezed == promptError
          ? _value.promptError
          : promptError // ignore: cast_nullable_to_non_nullable
              as String?,
      recentImages: null == recentImages
          ? _value._recentImages
          : recentImages // ignore: cast_nullable_to_non_nullable
              as List<String>,
      recentsPrompts: freezed == recentsPrompts
          ? _value._recentsPrompts
          : recentsPrompts // ignore: cast_nullable_to_non_nullable
              as List<RecentPromptModel>?,
      promptMessages: freezed == promptMessages
          ? _value._promptMessages
          : promptMessages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
      chatErrorModel: freezed == chatErrorModel
          ? _value.chatErrorModel
          : chatErrorModel // ignore: cast_nullable_to_non_nullable
              as ChatErrorModel?,
      currentMessageId: null == currentMessageId
          ? _value.currentMessageId
          : currentMessageId // ignore: cast_nullable_to_non_nullable
              as String,
      generateImageStatus: null == generateImageStatus
          ? _value.generateImageStatus
          : generateImageStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
      reGenerateImageStatus: null == reGenerateImageStatus
          ? _value.reGenerateImageStatus
          : reGenerateImageStatus // ignore: cast_nullable_to_non_nullable
              as FormzSubmissionStatus,
    ));
  }
}

/// @nodoc

class _$InitialImpl extends _Initial {
  const _$InitialImpl(
      {this.prompt,
      this.promptString = "",
      this.genImage,
      final List<ImageDatum>? genImageData,
      this.promptError,
      final List<String> recentImages = const [],
      final List<RecentPromptModel>? recentsPrompts,
      final List<Message>? promptMessages,
      this.chatErrorModel,
      this.currentMessageId = "",
      this.generateImageStatus = FormzSubmissionStatus.initial,
      this.reGenerateImageStatus = FormzSubmissionStatus.initial})
      : _genImageData = genImageData,
        _recentImages = recentImages,
        _recentsPrompts = recentsPrompts,
        _promptMessages = promptMessages,
        super._();

  @override
  final TextEditingController? prompt;
  @override
  @JsonKey()
  final String promptString;
  @override
  final GenImageModel? genImage;
  final List<ImageDatum>? _genImageData;
  @override
  List<ImageDatum>? get genImageData {
    final value = _genImageData;
    if (value == null) return null;
    if (_genImageData is EqualUnmodifiableListView) return _genImageData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? promptError;
  final List<String> _recentImages;
  @override
  @JsonKey()
  List<String> get recentImages {
    if (_recentImages is EqualUnmodifiableListView) return _recentImages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentImages);
  }

  final List<RecentPromptModel>? _recentsPrompts;
  @override
  List<RecentPromptModel>? get recentsPrompts {
    final value = _recentsPrompts;
    if (value == null) return null;
    if (_recentsPrompts is EqualUnmodifiableListView) return _recentsPrompts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Message>? _promptMessages;
  @override
  List<Message>? get promptMessages {
    final value = _promptMessages;
    if (value == null) return null;
    if (_promptMessages is EqualUnmodifiableListView) return _promptMessages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final ChatErrorModel? chatErrorModel;
  @override
  @JsonKey()
  final String currentMessageId;
  @override
  @JsonKey()
  final FormzSubmissionStatus generateImageStatus;
  @override
  @JsonKey()
  final FormzSubmissionStatus reGenerateImageStatus;

  @override
  String toString() {
    return 'ImageGenState(prompt: $prompt, promptString: $promptString, genImage: $genImage, genImageData: $genImageData, promptError: $promptError, recentImages: $recentImages, recentsPrompts: $recentsPrompts, promptMessages: $promptMessages, chatErrorModel: $chatErrorModel, currentMessageId: $currentMessageId, generateImageStatus: $generateImageStatus, reGenerateImageStatus: $reGenerateImageStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitialImpl &&
            (identical(other.prompt, prompt) || other.prompt == prompt) &&
            (identical(other.promptString, promptString) ||
                other.promptString == promptString) &&
            (identical(other.genImage, genImage) ||
                other.genImage == genImage) &&
            const DeepCollectionEquality()
                .equals(other._genImageData, _genImageData) &&
            (identical(other.promptError, promptError) ||
                other.promptError == promptError) &&
            const DeepCollectionEquality()
                .equals(other._recentImages, _recentImages) &&
            const DeepCollectionEquality()
                .equals(other._recentsPrompts, _recentsPrompts) &&
            const DeepCollectionEquality()
                .equals(other._promptMessages, _promptMessages) &&
            (identical(other.chatErrorModel, chatErrorModel) ||
                other.chatErrorModel == chatErrorModel) &&
            (identical(other.currentMessageId, currentMessageId) ||
                other.currentMessageId == currentMessageId) &&
            (identical(other.generateImageStatus, generateImageStatus) ||
                other.generateImageStatus == generateImageStatus) &&
            (identical(other.reGenerateImageStatus, reGenerateImageStatus) ||
                other.reGenerateImageStatus == reGenerateImageStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      prompt,
      promptString,
      genImage,
      const DeepCollectionEquality().hash(_genImageData),
      promptError,
      const DeepCollectionEquality().hash(_recentImages),
      const DeepCollectionEquality().hash(_recentsPrompts),
      const DeepCollectionEquality().hash(_promptMessages),
      chatErrorModel,
      currentMessageId,
      generateImageStatus,
      reGenerateImageStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      __$$InitialImplCopyWithImpl<_$InitialImpl>(this, _$identity);
}

abstract class _Initial extends ImageGenState {
  const factory _Initial(
      {final TextEditingController? prompt,
      final String promptString,
      final GenImageModel? genImage,
      final List<ImageDatum>? genImageData,
      final String? promptError,
      final List<String> recentImages,
      final List<RecentPromptModel>? recentsPrompts,
      final List<Message>? promptMessages,
      final ChatErrorModel? chatErrorModel,
      final String currentMessageId,
      final FormzSubmissionStatus generateImageStatus,
      final FormzSubmissionStatus reGenerateImageStatus}) = _$InitialImpl;
  const _Initial._() : super._();

  @override
  TextEditingController? get prompt;
  @override
  String get promptString;
  @override
  GenImageModel? get genImage;
  @override
  List<ImageDatum>? get genImageData;
  @override
  String? get promptError;
  @override
  List<String> get recentImages;
  @override
  List<RecentPromptModel>? get recentsPrompts;
  @override
  List<Message>? get promptMessages;
  @override
  ChatErrorModel? get chatErrorModel;
  @override
  String get currentMessageId;
  @override
  FormzSubmissionStatus get generateImageStatus;
  @override
  FormzSubmissionStatus get reGenerateImageStatus;
  @override
  @JsonKey(ignore: true)
  _$$InitialImplCopyWith<_$InitialImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
