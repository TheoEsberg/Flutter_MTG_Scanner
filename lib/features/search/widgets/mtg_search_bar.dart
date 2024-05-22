import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/data/mtg_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MtgSearchBar extends ConsumerWidget {
  const MtgSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: SizedBox(
        height: 48,
        child: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16.0),
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: BorderRadius.circular(50.0),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Row(
                children: [
                  Icon(Icons.search,
                      color: Theme.of(context).colorScheme.onPrimary),
                  const SizedBox(width: 8.0),
                  Expanded(
                    child: Center(
                      child: TextField(
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.onPrimary),
                        cursorColor: Theme.of(context).colorScheme.onPrimary,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.zero,
                          isDense: true,
                          hintText: 'Search cards...',
                          hintStyle: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary),
                        ),
                        onEditingComplete: () {
                          FocusManager.instance.primaryFocus?.unfocus();
                        },
                        onChanged: (value) {
                          if (value != '') {
                            ref.read(searchQueryStateProvider.notifier).state =
                                value;
                          } else {
                            ref.read(searchQueryStateProvider.notifier).state =
                                'a';
                          }
                        },
                        onSubmitted: (value) {
                          ref.invalidate(searchProvider);
                          ref.read(searchProvider(0));
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
