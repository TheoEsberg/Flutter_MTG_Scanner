import 'package:flutter_mtg_scanner/core/models/set_api_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_mtg_scanner/core/providers/dio_provider.dart';
import 'package:retrofit/http.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_sets_api.g.dart';

@RestApi()
abstract class AllSetsApi {
  factory AllSetsApi(Dio dio, {String baseUrl}) = _AllSetsApi;

  @GET('/sets')
  Future<SetApiModel> getAllSets();
}

@riverpod
AllSetsApi allSetsApi(AllSetsApiRef ref) {
  final dio = ref.watch(dioProvider);
  return AllSetsApi(dio);
}
