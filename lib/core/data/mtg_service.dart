import 'dart:convert';

import 'package:flutter_mtg_scanner/core/utils/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:scryfall_api/scryfall_api.dart';

part 'mtg_service.g.dart';

final searchQueryStateProvider = StateProvider<String>((ref) => 'a');

@riverpod
Future<PaginableList<MtgCard>> search(SearchRef ref, int currentPage) async {
  final searchQuery = ref.read(searchQueryStateProvider);
  final client = ScryfallApiClient();
  final response = await client.searchCards(searchQuery, page: currentPage);
  return response;
}

@riverpod
Future<MtgCard> searchById(SearchByIdRef ref, String id) async {
  final client = ScryfallApiClient();
  final response = await client.getCardById(id);
  return response;
}
