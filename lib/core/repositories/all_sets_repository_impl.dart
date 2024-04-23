import 'package:flutter_mtg_scanner/core/apis/all_sets_api.dart';
import 'package:flutter_mtg_scanner/core/models/set_api_model.dart';
import 'package:flutter_mtg_scanner/core/providers/dio_provider.dart';
import 'package:flutter_mtg_scanner/core/repositories/all_sets_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_sets_repository_impl.g.dart';

class AllSetsRepositoryImpl extends AllSetsRepository {
  AllSetsRepositoryImpl({required this.apiClient});

  AllSetsApi apiClient;

  @override
  Future<SetApiModel> getAllSets() async => apiClient.getAllSets();
}

@riverpod
AllSetsRepository allSetsRepository(AllSetsRepositoryRef ref) =>
    AllSetsRepositoryImpl(apiClient: AllSetsApi(ref.watch(dioProvider)));
