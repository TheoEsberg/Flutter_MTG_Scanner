import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mtg_scanner/features/library/repositories/library_repository.dart';
import 'package:flutter_mtg_scanner/features/search/models/card_collection_model.dart';
import 'package:flutter_mtg_scanner/features/search/widgets/mtg_fullcard_list_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LibraryView extends HookConsumerWidget {
  const LibraryView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tabController = useTabController(initialLength: 2);
    final responseAsync = ref.watch(getAllCardsProvider);
    final List<CardCollectionModel>? cards = responseAsync.asData?.value;
    // final totalCards = responseAsync.valueOrNull?.length ?? 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Library View'),
        centerTitle: true,
        bottom: TabBar(
          controller: tabController,
          labelColor: Theme.of(context).colorScheme.tertiary,
          tabs: const [
            Tab(
              text: 'Collection',
              icon: Icon(Icons.collections),
            ),
            Tab(
              text: 'Decks',
              icon: Icon(Icons.deck),
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
              const SizedBox(height: 8.0),
              Expanded(
                child: GridView.builder(
                    itemCount: cards?.length ?? 0,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 4.0,
                      mainAxisSpacing: 4.0,
                      childAspectRatio: 3 / 4,
                    ),
                    itemBuilder: (context, index) {
                      final card = cards![index];
                      return MtgFullcardGridTile(card: card);
                    }),
              )
            ],
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text('Decks'),
              )
            ],
          )
        ],
      ),
    );
  }
}
