import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/data/mtg_service.dart';
import 'package:flutter_mtg_scanner/features/search/utils/mtg_details_utils.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart';

class MtgCardFullView extends ConsumerWidget {
  const MtgCardFullView(this.id, {super.key});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<MtgCard> response = ref.watch(searchByIdProvider(id));
    final bool isFlipped = ref.read(cardIsFlippedStateProvider);

    return response.when(
      error: (err, stack) => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (card) {
        return Scaffold(
          appBar: AppBar(),
          body: PageView(
            children: getImage(card, isFlipped),
          ),
        );
      },
    );
  }
}
