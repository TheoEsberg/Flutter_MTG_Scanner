import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/constants/app_routes.dart';
import 'package:flutter_mtg_scanner/core/data/mtg_service.dart';
import 'package:flutter_mtg_scanner/features/search/utils/mtg_details_utils.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:share_plus/share_plus.dart';

class DetailsSliverAppBar extends ConsumerWidget {
  const DetailsSliverAppBar(this.card, {super.key});
  final MtgCard card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isFlipped = ref.watch(cardIsFlippedStateProvider);

    return SliverAppBar(
      pinned: true,
      expandedHeight: 240.0,
      flexibleSpace: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          // Calculate the height of the app bar
          final appBarHeight = constraints.biggest.height;
          final isAppBarExpanded = appBarHeight > 90.0;

          return Stack(
            fit: StackFit.expand,
            children: [
              FlexibleSpaceBar(
                title: AnimatedOpacity(
                  duration: const Duration(milliseconds: 150),
                  opacity: !isAppBarExpanded ? 1.0 : 0.0,
                  child: Text(
                    (card.cardFaces != null)
                        ? (isFlipped)
                            ? card.cardFaces!.elementAt(1).name
                            : card.cardFaces!.elementAt(0).name
                        : card.name,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                ),
                background: GestureDetector(
                  onTap: () {
                    context.pushNamed(AppRoutes.CardFullView, pathParameters: {
                      'id': card.id,
                    });
                  },
                  child: getArtCrop(card, isFlipped),
                ),
              ),
              (card.cardFaces?.length != null)
                  ? Positioned(
                      top: 32,
                      right: 48,
                      child: IconButton(
                        icon: const Icon(Icons.flip_camera_android_rounded),
                        onPressed: () {
                          ref.read(cardIsFlippedStateProvider.notifier).state =
                              !isFlipped;
                        },
                      ),
                    )
                  : const SizedBox.shrink(),
              Positioned(
                top: 32,
                right: 8,
                child: PopupMenuButton(
                  position: PopupMenuPosition.under,
                  icon: const Icon(Icons.more_vert),
                  itemBuilder: (_) => <PopupMenuItem<String>>[
                    const PopupMenuItem<String>(
                      value: 'collection',
                      child: Row(
                        children: [
                          Icon(Icons.add),
                          SizedBox(width: 2),
                          Text('Add to collection'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'deck',
                      child: Row(
                        children: [
                          Icon(Icons.add_photo_alternate_outlined),
                          SizedBox(width: 2),
                          Text('Add to deck'),
                        ],
                      ),
                    ),
                    const PopupMenuItem<String>(
                      value: 'share',
                      child: Row(
                        children: [
                          Icon(Icons.share),
                          SizedBox(width: 2),
                          Text('Share card')
                        ],
                      ),
                    )
                  ],
                  onSelected: (index) async {
                    switch (index) {
                      case 'collection':
                        print('Add to collection');
                        break;
                      case 'deck':
                        print('Add to deck...');
                        break;
                      case 'share':
                        await Share.shareUri(card.scryfallUri);
                        break;
                    }
                  },
                ),
              ),
              Positioned(
                left: 16.0,
                bottom: 16.0,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 150),
                  opacity: isAppBarExpanded ? 1.0 : 0.0,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      getManaCostIcons(card, isFlipped) ??
                          const SizedBox.shrink(),
                      Text(
                          (isFlipped && card.cardFaces != null)
                              ? card.cardFaces!.elementAt(1).name
                              : (card.cardFaces != null)
                                  ? card.cardFaces!.elementAt(0).name
                                  : card.name,
                          style: const TextStyle(
                              fontSize: 20.0, fontWeight: FontWeight.bold)),
                      Text(
                        (isFlipped && card.cardFaces != null)
                            ? card.cardFaces!.elementAt(1).typeLine ?? ''
                            : (card.cardFaces != null)
                                ? card.cardFaces!.elementAt(0).typeLine ?? ''
                                : card.typeLine,
                      ),
                      getPowerToughness(card, isFlipped)
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget getPowerToughness(MtgCard card, bool isFlipped) {
    if (card.cardFaces == null) {
      if (card.power != null || card.toughness != null) {
        return Text('${card.power ?? 0}/${card.toughness ?? 0}');
      }
      return const SizedBox.shrink();
    }

    if (isFlipped) {
      if (card.cardFaces!.elementAt(1).power != null ||
          card.cardFaces!.elementAt(1).toughness != null) {
        return Text(
            '${card.cardFaces!.elementAt(1).power ?? 0}/${card.cardFaces!.elementAt(1).toughness ?? 0}');
      }
      return const SizedBox.shrink();
    } else {
      if (card.cardFaces!.elementAt(0).power != null ||
          card.cardFaces!.elementAt(0).toughness != null) {
        return Text(
            '${card.cardFaces!.elementAt(0).power ?? 0}/${card.cardFaces!.elementAt(0).toughness ?? 0}');
      }
      return const SizedBox.shrink();
    }
  }
}
