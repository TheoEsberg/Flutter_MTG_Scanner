import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class MtgCardListTileShimmer extends StatelessWidget {
  const MtgCardListTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Theme.of(context).colorScheme.primary,
      highlightColor: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              color: Theme.of(context).colorScheme.background,
            ),
            const SizedBox(
              width: 8.0,
            ),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 20.0,
                    color: Theme.of(context).colorScheme.secondary,
                    margin: const EdgeInsets.only(bottom: 8.0),
                  ),
                  Container(
                      width: 100,
                      height: 15,
                      color: Theme.of(context).colorScheme.secondary)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
