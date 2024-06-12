import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/data/mtg_service.dart';
import 'package:flutter_mtg_scanner/features/scan/widgets/camera_scanner_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scryfall_api/scryfall_api.dart';

class ScanView extends ConsumerWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AsyncValue<PaginableList<MtgSet>> response =
        ref.watch(getAllSetsProvider);

    return response.when(
        error: (err, stack) => const SizedBox.shrink(),
        loading: () => const Center(child: CircularProgressIndicator()),
        data: (sets) {
          return Scaffold(
            appBar: AppBar(
              title: const Center(
                child: Text('MTG Scanner'),
              ),
            ),
            body: CameraScannerWidget(sets),
          );

          // var allSets = ref.watch(getAllSetsProvider);
          // return Scaffold(
          //   appBar: AppBar(
          //     title: const Center(
          //       child: Text('MTG Scanner'),
          //     ),
          //   ),
          //   body: const CameraScannerWidget(),
          // );
        });
  }

  // Future<CameraDescription> getCamera() async {
  //   final cameras = await availableCameras();
  //   final firstCamera = cameras.first;
  //   return firstCamera;
  // }
}
