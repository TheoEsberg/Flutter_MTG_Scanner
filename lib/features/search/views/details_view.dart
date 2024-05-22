import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/data/mtg_service.dart';
import 'package:flutter_mtg_scanner/features/search/widgets/details_sliver_app_bar.dart';
import 'package:flutter_mtg_scanner/features/search/widgets/mtg_card_info_widget.dart';
import 'package:flutter_mtg_scanner/features/search/widgets/mtg_legalites_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart';

class DetailsView extends ConsumerWidget {
  const DetailsView(this.id, {super.key});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<MtgCard> response = ref.watch(searchByIdProvider(id));

    return response.when(
      error: (err, stack) => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (card) {
        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              DetailsSliverAppBar(card),
              SliverList(
                delegate: SliverChildListDelegate([
                  MtgCardInfoWidget(card),
                  MtgLegalitesWidget(card),
                ]),
              ),
            ],
          ),
        );
      },
    );
  }
}
