import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mtg_scanner/core/data/mtg_service.dart';
import 'package:flutter_mtg_scanner/features/search/widgets/details_sliver_app_bar.dart';
import 'package:flutter_mtg_scanner/features/search/widgets/mtg_card_info_widget.dart';
import 'package:flutter_mtg_scanner/features/search/widgets/mtg_legalites_widget.dart';
import 'package:flutter_mtg_scanner/features/search/widgets/prices_widget.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart';

class DetailsView extends HookConsumerWidget {
  const DetailsView(this.id, {super.key});
  final String id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<MtgCard> response = ref.watch(searchByIdProvider(id));
    final tabController = useTabController(initialLength: 2);

    return response.when(
      error: (err, stack) => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator()),
      data: (card) {
        return Scaffold(
          body: NestedScrollView(
            headerSliverBuilder: (context, value) {
              return [
                DetailsSliverAppBar(card),
                SliverToBoxAdapter(
                  child: TabBar(
                    controller: tabController,
                    labelColor: Colors.purpleAccent,
                    tabs: const [
                      Tab(text: 'Information'),
                      Tab(
                        text: 'Pricing',
                      )
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              controller: tabController,
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      MtgCardInfoWidget(card),
                      MtgLegalitesWidget(card),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      PricesWidget(card),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
