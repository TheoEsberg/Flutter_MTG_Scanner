// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_api_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SetApiModel _$SetApiModelFromJson(Map<String, dynamic> json) {
  return _SetApiModel.fromJson(json);
}

/// @nodoc
mixin _$SetApiModel {
  String get object => throw _privateConstructorUsedError;
  bool? get hasMore => throw _privateConstructorUsedError;
  List<SetModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetApiModelCopyWith<SetApiModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetApiModelCopyWith<$Res> {
  factory $SetApiModelCopyWith(
          SetApiModel value, $Res Function(SetApiModel) then) =
      _$SetApiModelCopyWithImpl<$Res, SetApiModel>;
  @useResult
  $Res call({String object, bool? hasMore, List<SetModel> data});
}

/// @nodoc
class _$SetApiModelCopyWithImpl<$Res, $Val extends SetApiModel>
    implements $SetApiModelCopyWith<$Res> {
  _$SetApiModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
    Object? hasMore = freezed,
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      hasMore: freezed == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SetModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetApiModelImplCopyWith<$Res>
    implements $SetApiModelCopyWith<$Res> {
  factory _$$SetApiModelImplCopyWith(
          _$SetApiModelImpl value, $Res Function(_$SetApiModelImpl) then) =
      __$$SetApiModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String object, bool? hasMore, List<SetModel> data});
}

/// @nodoc
class __$$SetApiModelImplCopyWithImpl<$Res>
    extends _$SetApiModelCopyWithImpl<$Res, _$SetApiModelImpl>
    implements _$$SetApiModelImplCopyWith<$Res> {
  __$$SetApiModelImplCopyWithImpl(
      _$SetApiModelImpl _value, $Res Function(_$SetApiModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? object = null,
    Object? hasMore = freezed,
    Object? data = null,
  }) {
    return _then(_$SetApiModelImpl(
      object: null == object
          ? _value.object
          : object // ignore: cast_nullable_to_non_nullable
              as String,
      hasMore: freezed == hasMore
          ? _value.hasMore
          : hasMore // ignore: cast_nullable_to_non_nullable
              as bool?,
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<SetModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetApiModelImpl implements _SetApiModel {
  const _$SetApiModelImpl(
      {required this.object, this.hasMore, required final List<SetModel> data})
      : _data = data;

  factory _$SetApiModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetApiModelImplFromJson(json);

  @override
  final String object;
  @override
  final bool? hasMore;
  final List<SetModel> _data;
  @override
  List<SetModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'SetApiModel(object: $object, hasMore: $hasMore, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetApiModelImpl &&
            (identical(other.object, object) || other.object == object) &&
            (identical(other.hasMore, hasMore) || other.hasMore == hasMore) &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, object, hasMore, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetApiModelImplCopyWith<_$SetApiModelImpl> get copyWith =>
      __$$SetApiModelImplCopyWithImpl<_$SetApiModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetApiModelImplToJson(
      this,
    );
  }
}

abstract class _SetApiModel implements SetApiModel {
  const factory _SetApiModel(
      {required final String object,
      final bool? hasMore,
      required final List<SetModel> data}) = _$SetApiModelImpl;

  factory _SetApiModel.fromJson(Map<String, dynamic> json) =
      _$SetApiModelImpl.fromJson;

  @override
  String get object;
  @override
  bool? get hasMore;
  @override
  List<SetModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$SetApiModelImplCopyWith<_$SetApiModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
