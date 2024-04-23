import 'package:flutter_mtg_scanner/core/models/set_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_api_model.freezed.dart';
part 'set_api_model.g.dart';

@freezed
class SetApiModel with _$SetApiModel {
  const factory SetApiModel({
    required String object,
    bool? hasMore,
    required List<SetModel> data,
  }) = _SetApiModel;

  factory SetApiModel.fromJson(Map<String, dynamic> json) =>
      _$SetApiModelFromJson(json);
}
