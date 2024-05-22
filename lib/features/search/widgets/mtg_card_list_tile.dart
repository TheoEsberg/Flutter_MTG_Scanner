import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/constants/app_routes.dart';
import 'package:flutter_mtg_scanner/core/data/mtg_service.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart';

class MtgCardListTile extends ConsumerWidget {
  const MtgCardListTile({super.key, required this.card});
  final MtgCard card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListTile(
      title: Text(card.name),
      subtitle: Text(card.typeLine),
      leading: getCardImage() ?? const SizedBox.shrink(),
      onTap: () {
        ref.read(cardIsFlippedStateProvider.notifier).state = false;
        context.pushNamed(AppRoutes.CardDetails, pathParameters: {
          'id': card.id,
        });
      },
    );
  }

  Image? getCardImage() {
    if (card.imageUris != null && card.imageUris?.small != null) {
      return Image.network(
        card.imageUris!.small.toString(),
        width: 50.0,
        height: 50.0,
      );
    }

    if (card.cardFaces != null &&
        card.cardFaces!.first.imageUris?.small != null) {
      return Image.network(
        card.cardFaces!.first.imageUris!.small.toString(),
        width: 50.0,
        height: 50.0,
      );
    }

    return null;
  }
}
