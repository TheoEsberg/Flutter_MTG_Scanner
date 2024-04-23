import 'package:flutter_mtg_scanner/core/models/set_api_model.dart';
import 'package:flutter_mtg_scanner/core/models/set_model.dart';
import 'package:flutter_mtg_scanner/core/repositories/all_sets_repository_impl.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'all_sets_controller.g.dart';

@riverpod
class AllCardSetsController extends _$AllCardSetsController {
  @override
  FutureOr<SetApiModel> build() async =>
      await ref.read(allSetsRepositoryProvider).getAllSets();

  List<SetModel> getAllSets() {
    if (state.value != null) {
      return state.value!.data;
    }
    return [];
  }
}
