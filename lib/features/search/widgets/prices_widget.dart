import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart';
import 'package:url_launcher/url_launcher_string.dart';

class PricesWidget extends ConsumerWidget {
  const PricesWidget(this.card, {super.key});
  final MtgCard card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          getPrices(context, card),
          const SizedBox(
            height: 16.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Theme.of(context).colorScheme.primary,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              children: [
                const Text(
                  'Purchase Links',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                FilledButton(
                  onPressed: () async {
                    if (card.purchaseUris?['tcgplater'].toString() != null) {
                      launchUrlString(
                          card.purchaseUris!['tcgplayer'].toString());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text('This card is unavailable at TCG Player')));
                    }
                  },
                  style: const ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.blue),
                  ),
                  child: const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'TCG Player',
                        textAlign: TextAlign.center,
                      )),
                ),
                FilledButton(
                  onPressed: () async {
                    if (card.purchaseUris?['cardmarket'].toString() != null) {
                      launchUrlString(
                          card.purchaseUris!['cardmarket'].toString());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text('This card is unavailable at Card Market')));
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.orange)),
                  child: const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Card Market',
                        textAlign: TextAlign.center,
                      )),
                ),
                FilledButton(
                  onPressed: () async {
                    if (card.purchaseUris?['cardhoarder'].toString() != null) {
                      launchUrlString(
                          card.purchaseUris!['cardhoarder'].toString());
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text(
                              'This card is unavailable at Card Hoarder')));
                    }
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(Colors.green)),
                  child: const SizedBox(
                      width: double.infinity,
                      child: Text(
                        'Card Hoarder',
                        textAlign: TextAlign.center,
                      )),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Container getPrices(BuildContext context, MtgCard card) {
    List<Widget> cardPrices = [];
    cardPrices.add(
      const SizedBox(
        width: double.infinity,
        child: Text(
          'Prices',
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );

    if (card.prices.usd != null) {
      cardPrices.add(
        Text('USD: ${card.prices.usd!}\$'),
      );
    }

    if (card.prices.usdFoil != null) {
      cardPrices.add(
        Text('USD Foil: ${card.prices.usd!}\$'),
      );
    }

    if (card.prices.usdEtched != null) {
      cardPrices.add(
        Text('USD Etched: ${card.prices.usdEtched!}\$'),
      );
    }

    if (card.prices.eur != null) {
      cardPrices.add(
        Text('EUR: ${card.prices.eur!}€'),
      );
    }

    if (card.prices.eurFoil != null) {
      cardPrices.add(
        Text('EUR Foil: ${card.prices.eurFoil!}€'),
      );
    }

    if (card.prices.tix != null) {
      cardPrices.add(
        Text('TIX: ${card.prices.tix!}\$'),
      );
    }

    if (cardPrices.length == 1) {
      cardPrices.add(const Text(
        'Unfortunately we do not have any prices for this card in our database. We are sorry for the inconvenience.',
        textAlign: TextAlign.center,
      ));
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Theme.of(context).colorScheme.primary,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: cardPrices,
      ),
    );
  }
}
