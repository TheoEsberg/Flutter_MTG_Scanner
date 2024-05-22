import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class FilterWidget extends ConsumerWidget {
  const FilterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      children: [
        Center(child: colors()),
      ],
    );
  }

  Widget colors() {
    List<SvgPicture> colorIcons = [];
    double IconSize = 32.0;

    colorIcons.add(
      SvgPicture.asset(
        'assets/icons/{W}.svg',
        height: 32.0,
        width: 32.0,
        fit: BoxFit.scaleDown,
      ),
    );
    colorIcons.add(
      SvgPicture.asset(
        'assets/icons/{U}.svg',
        height: 32.0,
        width: 32.0,
        fit: BoxFit.scaleDown,
      ),
    );
    colorIcons.add(
      SvgPicture.asset(
        'assets/icons/{B}.svg',
        height: 32.0,
        width: 32.0,
        fit: BoxFit.scaleDown,
      ),
    );
    colorIcons.add(
      SvgPicture.asset(
        'assets/icons/{R}.svg',
        height: 32.0,
        width: 32.0,
        fit: BoxFit.scaleDown,
      ),
    );
    colorIcons.add(
      SvgPicture.asset(
        'assets/icons/{G}.svg',
        height: 32.0,
        width: 32.0,
        fit: BoxFit.scaleDown,
      ),
    );
    colorIcons.add(
      SvgPicture.asset(
        'assets/icons/{C}.svg',
        height: 32.0,
        width: 32.0,
        fit: BoxFit.scaleDown,
      ),
    );

    return SizedBox(
        width: 220,
        child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: colorIcons));
  }
}
