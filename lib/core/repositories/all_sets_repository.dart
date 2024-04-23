import 'package:flutter_mtg_scanner/core/models/set_api_model.dart';

abstract class AllSetsRepository {
  Future<SetApiModel> getAllSets();
}
