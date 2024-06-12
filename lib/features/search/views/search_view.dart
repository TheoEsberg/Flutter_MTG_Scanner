import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mtg_scanner/core/data/mtg_service.dart';
import 'package:flutter_mtg_scanner/features/search/widgets/filter_widget.dart';
import 'package:flutter_mtg_scanner/features/search/widgets/mtg_card_list_tile.dart';
import 'package:flutter_mtg_scanner/features/search/widgets/mtg_card_list_tile_shimmer.dart';
import 'package:flutter_mtg_scanner/features/search/widgets/mtg_search_bar.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:url_launcher/url_launcher_string.dart';

class SearchView extends HookConsumerWidget {
  const SearchView({super.key});

  static const pageSize = 175;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final responseAsync = ref.watch(searchProvider(0));
    final totalCards = responseAsync.valueOrNull?.totalCards ?? 0;
    final error = responseAsync.hasError;
    final tabController = useTabController(initialLength: 2);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Search View'),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          labelColor: Colors.purpleAccent,
          tabs: const [
            Tab(
              text: 'Search',
              icon: Icon(Icons.search),
            ),
            Tab(
              text: 'Filter',
              icon: Icon(Icons.filter_list),
            )
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const MtgSearchBar(),
              Expanded(
                child: (error)
                    ? Center(
                        child: Column(
                          children: [
                            const Text(
                              "Your query didn't match any cards in our library.\nWe use Scryfall's fulltext search system.\n\nTo learn more about Scryfall's syntax go here:",
                              textAlign: TextAlign.center,
                            ),
                            InkWell(
                              onTap: () async {
                                const url = 'https://scryfall.com/docs/syntax';
                                launchUrlString(url);
                              },
                              child: const Text(
                                "https://scryfall.com/docs/syntax",
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.blue),
                              ),
                            )
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: totalCards,
                        itemBuilder: (context, index) {
                          final page = index ~/ pageSize + 1;
                          final indexInPage = index % pageSize;
                          final AsyncValue<PaginableList<MtgCard>>
                              responseAsync = ref.watch(searchProvider(page));
                          return responseAsync.when(
                            error: (err, stack) => const SizedBox.shrink(),
                            loading: () => const MtgCardListTileShimmer(),
                            data: (response) {
                              if (indexInPage >= response.data.length) {
                                return null;
                              }
                              final card = response.data[indexInPage];
                              return MtgCardListTile(
                                card: card,
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
          const FilterWidget(),
        ],
      ),
    );
  }
}
