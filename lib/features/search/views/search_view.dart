import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/providers/all_sets_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchView extends ConsumerWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final setsProvider = ref.watch(allCardSetsControllerProvider.notifier);

    return Center(
      child: FilledButton(
          onPressed: () {
            final sets = setsProvider.getAllSets();
            print(sets);
          },
          child: const Text('Get All Setes')),
    );
  }
}
