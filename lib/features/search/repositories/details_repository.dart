import 'package:dio/dio.dart';
import 'package:flutter_mtg_scanner/core/utils/dio_provider.dart';
import 'package:flutter_mtg_scanner/features/search/models/card_collection_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'details_repository.g.dart';

class DetailsRepository {
  const DetailsRepository({required this.client});
  final Dio client;

  Future<CardCollectionModel?> addCardToCollection(
      {required CardCollectionModel cardModel, required String userId}) async {
    final uri = Uri.parse('http://192.168.0.52:5000/api/Card?userId=$userId');

    try {
      final response = await client.postUri(
        uri,
        data: cardModel,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        return CardCollectionModel.fromJson(response.data);
      } else {
        return null;
      }
    } catch (e) {
      print('Error: $e');
    }
    return null;
  }
}

@riverpod
DetailsRepository detailsRepository(DetailsRepositoryRef ref) =>
    DetailsRepository(
      client: ref.watch(dioProvider),
    );
