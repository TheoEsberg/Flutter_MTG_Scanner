// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SetModelImpl _$$SetModelImplFromJson(Map<String, dynamic> json) =>
    _$SetModelImpl(
      object: json['object'] as String,
      id: json['id'] as String,
      code: json['code'] as String,
      name: json['name'] as String?,
      uri: json['uri'] as String?,
      scryfall_uri: json['scryfall_uri'] as String?,
      search_uri: json['search_uri'] as String?,
      released_at: json['released_at'] as String?,
      set_type: json['set_type'] as String?,
      card_count: json['card_count'] as int?,
      parent_set_code: json['parent_set_code'] as String?,
      digital: json['digital'] as bool?,
      nonfoil_only: json['nonfoil_only'] as bool?,
      foil_only: json['foil_only'] as bool?,
      icon_svg_uri: json['icon_svg_uri'] as String?,
    );

Map<String, dynamic> _$$SetModelImplToJson(_$SetModelImpl instance) =>
    <String, dynamic>{
      'object': instance.object,
      'id': instance.id,
      'code': instance.code,
      'name': instance.name,
      'uri': instance.uri,
      'scryfall_uri': instance.scryfall_uri,
      'search_uri': instance.search_uri,
      'released_at': instance.released_at,
      'set_type': instance.set_type,
      'card_count': instance.card_count,
      'parent_set_code': instance.parent_set_code,
      'digital': instance.digital,
      'nonfoil_only': instance.nonfoil_only,
      'foil_only': instance.foil_only,
      'icon_svg_uri': instance.icon_svg_uri,
    };
