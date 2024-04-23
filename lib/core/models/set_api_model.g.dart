// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SetApiModelImpl _$$SetApiModelImplFromJson(Map<String, dynamic> json) =>
    _$SetApiModelImpl(
      object: json['object'] as String,
      hasMore: json['hasMore'] as bool?,
      data: (json['data'] as List<dynamic>)
          .map((e) => SetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SetApiModelImplToJson(_$SetApiModelImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'hasMore': instance.hasMore,
      'data': instance.data,
    };
