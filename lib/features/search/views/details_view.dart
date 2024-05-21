import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/data/mtg_service.dart';
import 'package:flutter_mtg_scanner/features/search/widgets/mtg_card_info_widget.dart';
import 'package:flutter_mtg_scanner/features/search/widgets/mtg_legalites_widget.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                expandedHeight: 240.0,
                flexibleSpace: FlexibleSpaceBar(
                  title: Text(
                    card.name,
                    style: const TextStyle(fontSize: 16.0),
                  ),
                  // TODO: Make it so that the background can show the first face of a two faced card
                  background: getArtCrop(card),
                ),
              ),
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

  Image getArtCrop(MtgCard card) {
    String imageUrl =
        'https://upload.wikimedia.org/wikipedia/en/thumb/a/aa/Magic_the_gathering-card_back.jpg/220px-Magic_the_gathering-card_back.jpg';

    if (card.imageUris != null && card.imageUris?.artCrop != null) {
      return Image.network(
        card.imageUris!.artCrop.toString(),
        fit: BoxFit.cover,
      );
    } else if (card.cardFaces != null &&
        card.cardFaces?.first.imageUris?.artCrop != null) {
      return Image.network(
        card.cardFaces!.first.imageUris!.artCrop.toString(),
        fit: BoxFit.cover,
      );
    }

    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
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
