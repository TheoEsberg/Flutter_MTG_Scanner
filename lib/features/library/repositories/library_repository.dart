import 'package:dio/dio.dart';
import 'package:flutter_mtg_scanner/core/utils/dio_provider.dart';
import 'package:flutter_mtg_scanner/features/login/repositories/login_repository.dart';
import 'package:flutter_mtg_scanner/features/search/models/card_collection_model.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'library_repository.g.dart';

class LibraryRepository {
  const LibraryRepository({required this.client});
  final Dio client;

  Future<List<CardCollectionModel>> getAllCardsInCollection(
      {required String userId}) async {
    final uri = Uri.parse('http://192.168.0.52:5000/api/Card?userId=$userId');

    try {
      final response = await client.getUri(uri);

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data;
        return data.map((json) => CardCollectionModel.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      print('Error: $e');
    }
    return [];
  }
}

@riverpod
LibraryRepository libraryRepository(LibraryRepositoryRef ref) =>
    LibraryRepository(client: ref.watch(dioProvider));

@riverpod
Future<List<CardCollectionModel>> getAllCards(GetAllCardsRef ref) async {
  final libraryRepo = ref.watch(libraryRepositoryProvider);
  final userId = ref.watch(userProvider)!.id;

  final cards = await libraryRepo.getAllCardsInCollection(userId: userId);
  return cards;
}
