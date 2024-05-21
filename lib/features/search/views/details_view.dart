import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/data/mtg_service.dart';
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
      loading: () => const CircularProgressIndicator(),
      data: (card) {
        return Scaffold(
          appBar: AppBar(
            title: Text(card.name),
            centerTitle: true,
          ),
          body: ListView(children: [
            Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 16.0),
                child: getImage(card)),
          ]),
        );
      },
    );
  }

  Image getImage(MtgCard card) {
    String imageUrl =
        'https://upload.wikimedia.org/wikipedia/en/thumb/a/aa/Magic_the_gathering-card_back.jpg/220px-Magic_the_gathering-card_back.jpg';

    if (card.imageUris != null) {
      if (card.imageUris?.png != null) {
        imageUrl = card.imageUris!.png.toString();
      } else if (card.imageUris?.large != null) {
        imageUrl = card.imageUris!.large.toString();
      } else if (card.imageUris?.normal != null) {
        imageUrl = card.imageUris!.normal.toString();
      } else if (card.imageUris?.small != null) {
        imageUrl = card.imageUris!.small.toString();
      }
    } else if (card.cardFaces != null) {
      if (card.cardFaces!.first.imageUris?.png != null) {
        imageUrl = card.cardFaces!.first.imageUris!.png.toString();
      } else if (card.cardFaces!.first.imageUris?.large != null) {
        imageUrl = card.cardFaces!.first.imageUris!.large.toString();
      } else if (card.cardFaces!.first.imageUris?.normal != null) {
        imageUrl = card.cardFaces!.first.imageUris!.normal.toString();
      } else if (card.cardFaces!.first.imageUris?.small != null) {
        imageUrl = card.cardFaces!.first.imageUris!.small.toString();
      }
    }

    return Image.network(imageUrl);
  }
}
