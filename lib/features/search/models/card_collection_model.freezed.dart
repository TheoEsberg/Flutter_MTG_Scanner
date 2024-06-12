// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_collection_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CardCollectionModel _$CardCollectionModelFromJson(Map<String, dynamic> json) {
  return _CardCollectionModel.fromJson(json);
}

/// @nodoc
mixin _$CardCollectionModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String? get typeLine => throw _privateConstructorUsedError;
  Uri? get image => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CardCollectionModelCopyWith<CardCollectionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CardCollectionModelCopyWith<$Res> {
  factory $CardCollectionModelCopyWith(
          CardCollectionModel value, $Res Function(CardCollectionModel) then) =
      _$CardCollectionModelCopyWithImpl<$Res, CardCollectionModel>;
  @useResult
  $Res call({String id, String name, String? typeLine, Uri? image});
}

/// @nodoc
class _$CardCollectionModelCopyWithImpl<$Res, $Val extends CardCollectionModel>
    implements $CardCollectionModelCopyWith<$Res> {
  _$CardCollectionModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? typeLine = freezed,
    Object? image = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      typeLine: freezed == typeLine
          ? _value.typeLine
          : typeLine // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uri?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CardCollectionModelImplCopyWith<$Res>
    implements $CardCollectionModelCopyWith<$Res> {
  factory _$$CardCollectionModelImplCopyWith(_$CardCollectionModelImpl value,
          $Res Function(_$CardCollectionModelImpl) then) =
      __$$CardCollectionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String? typeLine, Uri? image});
}

/// @nodoc
class __$$CardCollectionModelImplCopyWithImpl<$Res>
    extends _$CardCollectionModelCopyWithImpl<$Res, _$CardCollectionModelImpl>
    implements _$$CardCollectionModelImplCopyWith<$Res> {
  __$$CardCollectionModelImplCopyWithImpl(_$CardCollectionModelImpl _value,
      $Res Function(_$CardCollectionModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? typeLine = freezed,
    Object? image = freezed,
  }) {
    return _then(_$CardCollectionModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      typeLine: freezed == typeLine
          ? _value.typeLine
          : typeLine // ignore: cast_nullable_to_non_nullable
              as String?,
      image: freezed == image
          ? _value.image
          : image // ignore: cast_nullable_to_non_nullable
              as Uri?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CardCollectionModelImpl implements _CardCollectionModel {
  _$CardCollectionModelImpl(
      {required this.id, required this.name, this.typeLine, this.image});

  factory _$CardCollectionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CardCollectionModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String? typeLine;
  @override
  final Uri? image;

  @override
  String toString() {
    return 'CardCollectionModel(id: $id, name: $name, typeLine: $typeLine, image: $image)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CardCollectionModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.typeLine, typeLine) ||
                other.typeLine == typeLine) &&
            (identical(other.image, image) || other.image == image));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, typeLine, image);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CardCollectionModelImplCopyWith<_$CardCollectionModelImpl> get copyWith =>
      __$$CardCollectionModelImplCopyWithImpl<_$CardCollectionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CardCollectionModelImplToJson(
      this,
    );
  }
}

abstract class _CardCollectionModel implements CardCollectionModel {
  factory _CardCollectionModel(
      {required final String id,
      required final String name,
      final String? typeLine,
      final Uri? image}) = _$CardCollectionModelImpl;

  factory _CardCollectionModel.fromJson(Map<String, dynamic> json) =
      _$CardCollectionModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String? get typeLine;
  @override
  Uri? get image;
  @override
  @JsonKey(ignore: true)
  _$$CardCollectionModelImplCopyWith<_$CardCollectionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
