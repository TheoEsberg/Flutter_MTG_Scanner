import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart';

class MtgCardInfoWidget extends ConsumerWidget {
  const MtgCardInfoWidget(this.card, {super.key});
  final MtgCard card;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).colorScheme.primary,
        ),
        child: Column(
          children: [
            Text(
              card.name,
              style: const TextStyle(
                fontSize: 24.0,
              ),
            ),
            getManaCostIcons(card) ?? const SizedBox.shrink(),
            Text(card.typeLine),
            processTextWithIcons(card)
          ],
        ),
      ),
    );
  }

  Widget processTextWithIcons(MtgCard card) {
    // Regular expression to match {*}
    RegExp regExp = RegExp(r'{(\d*\/?[\w\/]*)}');

    // Split the text into parts based on matches
    List<String> parts = card.oracleText!.split(regExp);
    Iterable<RegExpMatch> matches = regExp.allMatches(card.oracleText!);

    // Process each part and create a list of widgets
    List<Widget> widgets = [];
    for (int i = 0; i < parts.length; i++) {
      // Text part
      widgets.add(Text(parts[i]));
      print(parts[i]);
      print(parts.length);

      // If it's an odd index, it's a match, so add the icon
      if (parts.length - 1 > i) {
        widgets.add(getManaCostIconsForText(matches.first.group(0).toString()));
      }
    }

    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text.rich(
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12),
        TextSpan(
          children: [
            TextSpan(text: parts[0]),
            WidgetSpan(
              child: SvgPicture.asset(
                'assets/icons/${matches.first.group(0).toString().replaceAll('/', '')}.svg',
                height: 16.0,
                width: 16.0,
                fit: BoxFit.scaleDown,
              ),
            ),
            TextSpan(text: parts[1]),
          ],
        ),
      ),
    );
  }

  Flexible getManaCostIconsForText(String matchText) {
    print('THIS IS THE MATCHTEXT : $matchText');
    // Here, you can reuse your existing method getManaCostIcons()
    // and return the Row of icons
    // For demonstration purpose, let's just return a placeholder Text widget
    return Flexible(
      child: SvgPicture.asset(
        'assets/icons/${matchText.replaceAll('/', '')}.svg',
        height: 16.0,
        width: 16.0,
        fit: BoxFit.scaleDown,
      ),
    );
  }

  Row? getManaCostIcons(MtgCard card) {
    if (card.manaCost == '') {
      return null;
    }

    RegExp regExp = RegExp(r'{(\d*\/?[\w\/]*)}');

    Iterable<RegExpMatch> matches = regExp.allMatches(card.manaCost!);

    if (matches.isEmpty) {
      return Row(
        children: [
          SvgPicture.asset(
            'assets/icons/${card.manaCost!.replaceAll('/', '')}.svg',
            height: 16.0,
            width: 16.0,
            fit: BoxFit.scaleDown,
          )
        ],
      );
    }

    List<SvgPicture> iconList = [];
    for (RegExpMatch match in matches) {
      String matchText = match.group(0)!;

      iconList.add(
        SvgPicture.asset(
          'assets/icons/${matchText.replaceAll('/', '')}.svg',
          height: 16.0,
          width: 16.0,
          fit: BoxFit.scaleDown,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: iconList,
    );
  }
}
