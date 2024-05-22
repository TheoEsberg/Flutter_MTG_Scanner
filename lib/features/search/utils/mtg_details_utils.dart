import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:scryfall_api/scryfall_api.dart';

Row? getManaCostIcons(MtgCard card, bool isFlipped) {
  if (card.manaCost == '') {
    return null;
  }

  RegExp regExp = RegExp(r'{(\d*\/?[\w\/]*)}');
  final String manaCost;
  if (card.cardFaces != null) {
    if (isFlipped && card.cardFaces!.elementAt(1).manaCost == '') {
      return null;
    }

    (isFlipped)
        ? manaCost = card.cardFaces!.elementAt(1).manaCost
        : manaCost = card.cardFaces!.elementAt(0).manaCost;
  } else {
    manaCost = card.manaCost!;
  }
  Iterable<RegExpMatch> matches = regExp.allMatches(manaCost);

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

Image getArtCrop(MtgCard card, bool isFlipped) {
  String imageUrl =
      'https://upload.wikimedia.org/wikipedia/en/thumb/a/aa/Magic_the_gathering-card_back.jpg/220px-Magic_the_gathering-card_back.jpg';

  if (card.imageUris != null && card.imageUris?.artCrop != null) {
    return Image.network(
      card.imageUris!.artCrop.toString(),
      fit: BoxFit.cover,
    );
  } else if (card.cardFaces != null &&
      card.cardFaces?.first.imageUris?.artCrop != null) {
    return (isFlipped)
        ? Image.network(
            card.cardFaces!.elementAt(1).imageUris!.artCrop.toString(),
            fit: BoxFit.cover,
          )
        : Image.network(
            card.cardFaces!.elementAt(0).imageUris!.artCrop.toString(),
            fit: BoxFit.cover,
          );
  }

  return Image.network(
    imageUrl,
    fit: BoxFit.cover,
  );
}

List<InteractiveViewer> getImage(MtgCard card, bool isFlipped) {
  String imageUrl =
      'https://upload.wikimedia.org/wikipedia/en/thumb/a/aa/Magic_the_gathering-card_back.jpg/220px-Magic_the_gathering-card_back.jpg';
  List<InteractiveViewer> imgList = [];

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

    imgList.add(InteractiveViewer(
        panEnabled: true, maxScale: 4, child: Image.network(imageUrl)));
  } else if (card.cardFaces != null) {
    for (var i = 0; i < 2; i++) {
      if (card.cardFaces!.elementAt(i).imageUris?.png != null) {
        imageUrl = card.cardFaces!.elementAt(i).imageUris!.png.toString();
      } else if (card.cardFaces!.elementAt(i).imageUris?.large != null) {
        imageUrl = card.cardFaces!.elementAt(i).imageUris!.large.toString();
      } else if (card.cardFaces!.elementAt(i).imageUris?.normal != null) {
        imageUrl = card.cardFaces!.elementAt(i).imageUris!.normal.toString();
      } else if (card.cardFaces!.elementAt(i).imageUris?.small != null) {
        imageUrl = card.cardFaces!.elementAt(i).imageUris!.small.toString();
      }
      imgList.add(InteractiveViewer(
          panEnabled: true, maxScale: 4, child: Image.network(imageUrl)));
    }
  }

  if (isFlipped) {
    return imgList.reversed.toList();
  }
  return imgList;
}
