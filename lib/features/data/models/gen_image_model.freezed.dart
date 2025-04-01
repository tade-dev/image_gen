// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gen_image_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GenImageModel _$GenImageModelFromJson(Map<String, dynamic> json) {
  return _GenImageModel.fromJson(json);
}

/// @nodoc
mixin _$GenImageModel {
  int? get created => throw _privateConstructorUsedError;
  List<ImageDatum>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GenImageModelCopyWith<GenImageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GenImageModelCopyWith<$Res> {
  factory $GenImageModelCopyWith(
          GenImageModel value, $Res Function(GenImageModel) then) =
      _$GenImageModelCopyWithImpl<$Res, GenImageModel>;
  @useResult
  $Res call({int? created, List<ImageDatum>? data});
}

/// @nodoc
class _$GenImageModelCopyWithImpl<$Res, $Val extends GenImageModel>
    implements $GenImageModelCopyWith<$Res> {
  _$GenImageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = freezed,
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ImageDatum>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GenImageModelImplCopyWith<$Res>
    implements $GenImageModelCopyWith<$Res> {
  factory _$$GenImageModelImplCopyWith(
          _$GenImageModelImpl value, $Res Function(_$GenImageModelImpl) then) =
      __$$GenImageModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int? created, List<ImageDatum>? data});
}

/// @nodoc
class __$$GenImageModelImplCopyWithImpl<$Res>
    extends _$GenImageModelCopyWithImpl<$Res, _$GenImageModelImpl>
    implements _$$GenImageModelImplCopyWith<$Res> {
  __$$GenImageModelImplCopyWithImpl(
      _$GenImageModelImpl _value, $Res Function(_$GenImageModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? created = freezed,
    Object? data = freezed,
  }) {
    return _then(_$GenImageModelImpl(
      created: freezed == created
          ? _value.created
          : created // ignore: cast_nullable_to_non_nullable
              as int?,
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ImageDatum>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GenImageModelImpl implements _GenImageModel {
  const _$GenImageModelImpl({this.created, final List<ImageDatum>? data})
      : _data = data;

  factory _$GenImageModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GenImageModelImplFromJson(json);

  @override
  final int? created;
  final List<ImageDatum>? _data;
  @override
  List<ImageDatum>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'GenImageModel(created: $created, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GenImageModelImpl &&
            (identical(other.created, created) || other.created == created) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, created, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GenImageModelImplCopyWith<_$GenImageModelImpl> get copyWith =>
      __$$GenImageModelImplCopyWithImpl<_$GenImageModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GenImageModelImplToJson(
      this,
    );
  }
}

abstract class _GenImageModel implements GenImageModel {
  const factory _GenImageModel(
      {final int? created, final List<ImageDatum>? data}) = _$GenImageModelImpl;

  factory _GenImageModel.fromJson(Map<String, dynamic> json) =
      _$GenImageModelImpl.fromJson;

  @override
  int? get created;
  @override
  List<ImageDatum>? get data;
  @override
  @JsonKey(ignore: true)
  _$$GenImageModelImplCopyWith<_$GenImageModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageDatum _$ImageDatumFromJson(Map<String, dynamic> json) {
  return _ImageDatum.fromJson(json);
}

/// @nodoc
mixin _$ImageDatum {
  String? get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageDatumCopyWith<ImageDatum> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageDatumCopyWith<$Res> {
  factory $ImageDatumCopyWith(
          ImageDatum value, $Res Function(ImageDatum) then) =
      _$ImageDatumCopyWithImpl<$Res, ImageDatum>;
  @useResult
  $Res call({String? url});
}

/// @nodoc
class _$ImageDatumCopyWithImpl<$Res, $Val extends ImageDatum>
    implements $ImageDatumCopyWith<$Res> {
  _$ImageDatumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageDatumImplCopyWith<$Res>
    implements $ImageDatumCopyWith<$Res> {
  factory _$$ImageDatumImplCopyWith(
          _$ImageDatumImpl value, $Res Function(_$ImageDatumImpl) then) =
      __$$ImageDatumImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? url});
}

/// @nodoc
class __$$ImageDatumImplCopyWithImpl<$Res>
    extends _$ImageDatumCopyWithImpl<$Res, _$ImageDatumImpl>
    implements _$$ImageDatumImplCopyWith<$Res> {
  __$$ImageDatumImplCopyWithImpl(
      _$ImageDatumImpl _value, $Res Function(_$ImageDatumImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? url = freezed,
  }) {
    return _then(_$ImageDatumImpl(
      url: freezed == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageDatumImpl implements _ImageDatum {
  const _$ImageDatumImpl({this.url});

  factory _$ImageDatumImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageDatumImplFromJson(json);

  @override
  final String? url;

  @override
  String toString() {
    return 'ImageDatum(url: $url)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageDatumImpl &&
            (identical(other.url, url) || other.url == url));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, url);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageDatumImplCopyWith<_$ImageDatumImpl> get copyWith =>
      __$$ImageDatumImplCopyWithImpl<_$ImageDatumImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageDatumImplToJson(
      this,
    );
  }
}

abstract class _ImageDatum implements ImageDatum {
  const factory _ImageDatum({final String? url}) = _$ImageDatumImpl;

  factory _ImageDatum.fromJson(Map<String, dynamic> json) =
      _$ImageDatumImpl.fromJson;

  @override
  String? get url;
  @override
  @JsonKey(ignore: true)
  _$$ImageDatumImplCopyWith<_$ImageDatumImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
