import 'package:freezed_annotation/freezed_annotation.dart';

part 'card_collection_model.g.dart';
part 'card_collection_model.freezed.dart';

@freezed
class CardCollectionModel with _$CardCollectionModel {
  factory CardCollectionModel({
    required String id,
    required String name,
    String? typeLine,
    Uri? image,
  }) = _CardCollectionModel;

  factory CardCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$CardCollectionModelFromJson(json);
}
