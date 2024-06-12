import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/data/mtg_service.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart';

class MtgCardInfoWidget extends ConsumerWidget {
  const MtgCardInfoWidget(this.card, {super.key});
  final MtgCard card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isFlipped = ref.watch(cardIsFlippedStateProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          children: [
            (card.oracleText != '')
                ? processTextWithIcons(card, isFlipped)
                : const SizedBox.shrink(),
            getFlavorText(card, isFlipped),
          ],
        ),
      ),
    );
  }

  Padding processTextWithIcons(MtgCard card, bool isFlipped) {
    String cardText;
    if (card.cardFaces != null) {
      if (isFlipped) {
        cardText = card.cardFaces?.elementAt(1).oracleText ?? '';
      } else {
        cardText = card.cardFaces?.elementAt(0).oracleText ?? '';
      }
    } else {
      cardText = card.oracleText ?? '';
    }

    RegExp regExp = RegExp(r'{(\d*\/?[\w\/]*)}');

    log(cardText);
    cardText = cardText.replaceAll('\n', '\n\n');
    List<String> parts = cardText.split(regExp);
    Iterable<RegExpMatch> matches = regExp.allMatches(cardText);

    List<InlineSpan> widgets = [];
    for (int i = 0; i < parts.length; i++) {
      widgets.add(TextSpan(text: parts[i]));

      if (i < matches.length) {
        RegExpMatch match = matches.elementAt(i);
        String matchText = match.group(0)!;

        widgets.add(
          WidgetSpan(
            child: SvgPicture.asset(
              'assets/icons/${matchText.replaceAll('/', '')}.svg',
              height: 16.0,
              width: 16.0,
              fit: BoxFit.scaleDown,
            ),
          ),
        );
      }
    }

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Text.rich(
        TextSpan(children: widgets),
      ),
    );
  }

  Padding getFlavorText(MtgCard card, bool isFlipped) {
    if (card.flavorText != null) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Text(
          card.flavorText!,
          style: const TextStyle(fontSize: 12.0),
          textAlign: TextAlign.center,
        ),
      );
    }

    if (card.cardFaces != null) {
      if (isFlipped) {
        if (card.cardFaces!.elementAt(1).flavorText != null) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              card.cardFaces!.elementAt(1).flavorText ?? '',
              style: const TextStyle(fontSize: 12.0),
              textAlign: TextAlign.center,
            ),
          );
        } else {
          return const Padding(
            padding: EdgeInsets.zero,
            child: SizedBox.shrink(),
          );
        }
      }
      if (card.cardFaces!.elementAt(0).flavorText != null) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            card.cardFaces!.elementAt(0).flavorText ?? '',
            style: const TextStyle(fontSize: 12.0),
            textAlign: TextAlign.center,
          ),
        );
      }
    }
    return const Padding(
      padding: EdgeInsets.zero,
      child: SizedBox.shrink(),
    );
  }
}
