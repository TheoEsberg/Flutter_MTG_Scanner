import 'package:flutter/material.dart';
import 'package:scryfall_api/scryfall_api.dart';

class MtgCardListTile extends StatelessWidget {
  const MtgCardListTile({super.key, required this.card});
  final MtgCard card;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(card.name),
      subtitle: Text(card.typeLine),
      leading: getCardImage() ?? const SizedBox.shrink(),
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
