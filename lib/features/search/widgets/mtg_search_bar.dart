import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/data/mtg_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MtgSearchBar extends ConsumerWidget {
  const MtgSearchBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 48,
      child: Center(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16.0),
          decoration: BoxDecoration(
            color: Colors.purple.shade700,
            borderRadius: BorderRadius.circular(50.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Row(
              children: [
                const Icon(Icons.search, color: Colors.black),
                const SizedBox(width: 8.0),
                Expanded(
                  child: Center(
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.zero,
                        isDense: true,
                        hintText: 'Search cards...',
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                      onEditingComplete: () {
                        FocusManager.instance.primaryFocus?.unfocus();
                      },
                      onChanged: (value) {
                        ref.read(searchQueryStateProvider.notifier).state =
                            value;
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
    );
  }
}
