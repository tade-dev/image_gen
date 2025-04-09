// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recent_prompt_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

RecentPromptModel _$RecentPromptModelFromJson(Map<String, dynamic> json) {
  return _RecentPromptModel.fromJson(json);
}

/// @nodoc
mixin _$RecentPromptModel {
  String? get id => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get lastUpdatedAt => throw _privateConstructorUsedError;
  List<Message>? get messages => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecentPromptModelCopyWith<RecentPromptModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecentPromptModelCopyWith<$Res> {
  factory $RecentPromptModelCopyWith(
          RecentPromptModel value, $Res Function(RecentPromptModel) then) =
      _$RecentPromptModelCopyWithImpl<$Res, RecentPromptModel>;
  @useResult
  $Res call(
      {String? id,
      String? createdAt,
      String? lastUpdatedAt,
      List<Message>? messages});
}

/// @nodoc
class _$RecentPromptModelCopyWithImpl<$Res, $Val extends RecentPromptModel>
    implements $RecentPromptModelCopyWith<$Res> {
  _$RecentPromptModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? lastUpdatedAt = freezed,
    Object? messages = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedAt: freezed == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: freezed == messages
          ? _value.messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecentPromptModelImplCopyWith<$Res>
    implements $RecentPromptModelCopyWith<$Res> {
  factory _$$RecentPromptModelImplCopyWith(_$RecentPromptModelImpl value,
          $Res Function(_$RecentPromptModelImpl) then) =
      __$$RecentPromptModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? createdAt,
      String? lastUpdatedAt,
      List<Message>? messages});
}

/// @nodoc
class __$$RecentPromptModelImplCopyWithImpl<$Res>
    extends _$RecentPromptModelCopyWithImpl<$Res, _$RecentPromptModelImpl>
    implements _$$RecentPromptModelImplCopyWith<$Res> {
  __$$RecentPromptModelImplCopyWithImpl(_$RecentPromptModelImpl _value,
      $Res Function(_$RecentPromptModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? lastUpdatedAt = freezed,
    Object? messages = freezed,
  }) {
    return _then(_$RecentPromptModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      lastUpdatedAt: freezed == lastUpdatedAt
          ? _value.lastUpdatedAt
          : lastUpdatedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      messages: freezed == messages
          ? _value._messages
          : messages // ignore: cast_nullable_to_non_nullable
              as List<Message>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecentPromptModelImpl implements _RecentPromptModel {
  const _$RecentPromptModelImpl(
      {this.id,
      this.createdAt,
      this.lastUpdatedAt,
      final List<Message>? messages})
      : _messages = messages;

  factory _$RecentPromptModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecentPromptModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? createdAt;
  @override
  final String? lastUpdatedAt;
  final List<Message>? _messages;
  @override
  List<Message>? get messages {
    final value = _messages;
    if (value == null) return null;
    if (_messages is EqualUnmodifiableListView) return _messages;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'RecentPromptModel(id: $id, createdAt: $createdAt, lastUpdatedAt: $lastUpdatedAt, messages: $messages)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecentPromptModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastUpdatedAt, lastUpdatedAt) ||
                other.lastUpdatedAt == lastUpdatedAt) &&
            const DeepCollectionEquality().equals(other._messages, _messages));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, lastUpdatedAt,
      const DeepCollectionEquality().hash(_messages));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecentPromptModelImplCopyWith<_$RecentPromptModelImpl> get copyWith =>
      __$$RecentPromptModelImplCopyWithImpl<_$RecentPromptModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecentPromptModelImplToJson(
      this,
    );
  }
}

abstract class _RecentPromptModel implements RecentPromptModel {
  const factory _RecentPromptModel(
      {final String? id,
      final String? createdAt,
      final String? lastUpdatedAt,
      final List<Message>? messages}) = _$RecentPromptModelImpl;

  factory _RecentPromptModel.fromJson(Map<String, dynamic> json) =
      _$RecentPromptModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get createdAt;
  @override
  String? get lastUpdatedAt;
  @override
  List<Message>? get messages;
  @override
  @JsonKey(ignore: true)
  _$$RecentPromptModelImplCopyWith<_$RecentPromptModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Message _$MessageFromJson(Map<String, dynamic> json) {
  return _Message.fromJson(json);
}

/// @nodoc
mixin _$Message {
  String? get id => throw _privateConstructorUsedError;
  String? get createdAt => throw _privateConstructorUsedError;
  String? get body => throw _privateConstructorUsedError;
  List<String>? get attachments => throw _privateConstructorUsedError;
  bool? get isRegenerating => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageCopyWith<Message> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) then) =
      _$MessageCopyWithImpl<$Res, Message>;
  @useResult
  $Res call(
      {String? id,
      String? createdAt,
      String? body,
      List<String>? attachments,
      bool? isRegenerating});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res, $Val extends Message>
    implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? body = freezed,
    Object? attachments = freezed,
    Object? isRegenerating = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _value.attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isRegenerating: freezed == isRegenerating
          ? _value.isRegenerating
          : isRegenerating // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MessageImplCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$$MessageImplCopyWith(
          _$MessageImpl value, $Res Function(_$MessageImpl) then) =
      __$$MessageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? createdAt,
      String? body,
      List<String>? attachments,
      bool? isRegenerating});
}

/// @nodoc
class __$$MessageImplCopyWithImpl<$Res>
    extends _$MessageCopyWithImpl<$Res, _$MessageImpl>
    implements _$$MessageImplCopyWith<$Res> {
  __$$MessageImplCopyWithImpl(
      _$MessageImpl _value, $Res Function(_$MessageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? createdAt = freezed,
    Object? body = freezed,
    Object? attachments = freezed,
    Object? isRegenerating = freezed,
  }) {
    return _then(_$MessageImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String?,
      body: freezed == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String?,
      attachments: freezed == attachments
          ? _value._attachments
          : attachments // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      isRegenerating: freezed == isRegenerating
          ? _value.isRegenerating
          : isRegenerating // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MessageImpl implements _Message {
  const _$MessageImpl(
      {this.id,
      this.createdAt,
      this.body,
      final List<String>? attachments,
      this.isRegenerating})
      : _attachments = attachments;

  factory _$MessageImpl.fromJson(Map<String, dynamic> json) =>
      _$$MessageImplFromJson(json);

  @override
  final String? id;
  @override
  final String? createdAt;
  @override
  final String? body;
  final List<String>? _attachments;
  @override
  List<String>? get attachments {
    final value = _attachments;
    if (value == null) return null;
    if (_attachments is EqualUnmodifiableListView) return _attachments;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isRegenerating;

  @override
  String toString() {
    return 'Message(id: $id, createdAt: $createdAt, body: $body, attachments: $attachments, isRegenerating: $isRegenerating)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MessageImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.body, body) || other.body == body) &&
            const DeepCollectionEquality()
                .equals(other._attachments, _attachments) &&
            (identical(other.isRegenerating, isRegenerating) ||
                other.isRegenerating == isRegenerating));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, createdAt, body,
      const DeepCollectionEquality().hash(_attachments), isRegenerating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      __$$MessageImplCopyWithImpl<_$MessageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MessageImplToJson(
      this,
    );
  }
}

abstract class _Message implements Message {
  const factory _Message(
      {final String? id,
      final String? createdAt,
      final String? body,
      final List<String>? attachments,
      final bool? isRegenerating}) = _$MessageImpl;

  factory _Message.fromJson(Map<String, dynamic> json) = _$MessageImpl.fromJson;

  @override
  String? get id;
  @override
  String? get createdAt;
  @override
  String? get body;
  @override
  List<String>? get attachments;
  @override
  bool? get isRegenerating;
  @override
  @JsonKey(ignore: true)
  _$$MessageImplCopyWith<_$MessageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
