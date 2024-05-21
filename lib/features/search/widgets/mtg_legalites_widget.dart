import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart';

class MtgLegalitesWidget extends ConsumerWidget {
  const MtgLegalitesWidget(this.card, {super.key});
  final MtgCard card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10.0),
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  'Legalities',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              getLegalities(card),
            ],
          )),
    );
  }

  Row getLegalities(MtgCard card) {
    final legalityMap = {
      "Standard": card.legalities.standard,
      "Future": card.legalities.future,
      "Historic": card.legalities.historic,
      "Timeless": card.legalities.timeless,
      "Gladiator": card.legalities.gladiator,
      "Pioneer": card.legalities.pioneer,
      "Explorer": card.legalities.explorer,
      "Modern": card.legalities.modern,
      "Legacy": card.legalities.legacy,
      "Pauper": card.legalities.pauper,
      "Vintage": card.legalities.vintage,
      "Penny": card.legalities.penny,
      "Commander": card.legalities.commander,
      "Oathbreaker": card.legalities.oathbreaker,
      "Brawl": card.legalities.brawl,
      "Standard Brawl": card.legalities.standardbrawl,
      "Alchemy": card.legalities.alchemy,
      "Pauper Commander": card.legalities.paupercommander,
      "Duel": card.legalities.duel,
      "Old School": card.legalities.oldschool,
      "Premodern": card.legalities.premodern,
      "PreDH": card.legalities.predh,
    };

    List<Widget> col1 = [];
    List<Widget> col2 = [];
    int i = 0;

    legalityMap.forEach((format, status) {
      final legalityWidget = Container(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        width: 128,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child:
                  Text((format != 'Pauper Commander') ? format : 'Pauper Cmdr'),
            ),
            Container(
              color: getStatusColor(status.name),
              child: Center(
                child: Text(
                  getFormattedStatus(status.name),
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      );

      if (i % 2 == 0) {
        col1.add(legalityWidget);
      } else {
        col2.add(legalityWidget);
      }
      i++;
    });

    col1.add(const SizedBox(
      height: 8.0,
    ));

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Column(
          children: col1,
        )),
        Expanded(
            child: Column(
          children: col2,
        )),
      ],
    );
  }

  MaterialColor getStatusColor(String status) {
    if (status == 'legal') {
      return Colors.green;
    } else if (status == 'notLegal') {
      return Colors.orange;
    } else if (status == 'banned') {
      return Colors.red;
    } else if (status == 'restricted') {
      return Colors.blue;
    }

    return Colors.grey;
  }

  String getFormattedStatus(String statusName) {
    String lowerCaseStatusName = statusName.toLowerCase();
    if (lowerCaseStatusName == 'notlegal') {
      return 'Not Legal';
    }

    String capitalizedStatusName =
        lowerCaseStatusName.substring(0, 1).toUpperCase() +
            lowerCaseStatusName.substring(1);

    return capitalizedStatusName;
  }
}
