import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/constants/app_routes.dart';
import 'package:flutter_mtg_scanner/core/data/mtg_service.dart';
import 'package:flutter_mtg_scanner/features/search/models/card_collection_model.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MtgFullcardGridTile extends ConsumerWidget {
  const MtgFullcardGridTile({super.key, required this.card});
  final CardCollectionModel card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridTile(
      child: GestureDetector(
        child: Image.network(card.image.toString()),
        onTap: () {
          ref.read(cardIsFlippedStateProvider.notifier).state = false;
          context.pushNamed(AppRoutes.CardDetails, pathParameters: {
            'id': card.id,
          });
        },
      ),
    );
  }
}
