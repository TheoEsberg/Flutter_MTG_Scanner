// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CardCollectionModelImpl _$$CardCollectionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CardCollectionModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      typeLine: json['typeLine'] as String?,
      image: json['image'] == null ? null : Uri.parse(json['image'] as String),
    );

Map<String, dynamic> _$$CardCollectionModelImplToJson(
        _$CardCollectionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'typeLine': instance.typeLine,
      'image': instance.image?.toString(),
    };
