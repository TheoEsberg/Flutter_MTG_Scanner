import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_model.freezed.dart';
part 'set_model.g.dart';

@freezed
class SetModel with _$SetModel {
  const factory SetModel({
    required String object,
    required String id,
    required String code,
    String? name,
    String? uri,
    String? scryfall_uri,
    String? search_uri,
    String? released_at,
    String? set_type,
    int? card_count,
    String? parent_set_code,
    bool? digital,
    bool? nonfoil_only,
    bool? foil_only,
    String? icon_svg_uri,
  }) = _SetModel;

  factory SetModel.fromJson(Map<String, dynamic> json) =>
      _$SetModelFromJson(json);
}
