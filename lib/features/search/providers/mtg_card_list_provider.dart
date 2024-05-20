import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart';

class MtgCardListProvider extends StateNotifier<PaginableList<MtgCard>> {
  MtgCardListProvider(super.state);
}
