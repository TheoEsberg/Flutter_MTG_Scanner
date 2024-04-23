import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/features/scan/widgets/camera_scanner_widget.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ScanView extends ConsumerWidget {
  const ScanView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text('MTG Scanner'),
        ),
      ),
      body: const CameraScannerWidget(),
      // FutureBuilder<CameraDescription>(
      //   future: getCamera(),
      //   builder: (context, snapshot) {
      //     if (snapshot.connectionState == ConnectionState.done) {
      //       if (snapshot.hasData) {
      //         return CameraWidget(camera: snapshot.data!);
      //       } else if (snapshot.hasError) {
      //         return Text('Error: ${snapshot.error}');
      //       } else {
      //         return const Text('Waiting for camera...');
      //       }
      //     } else {
      //       return const CircularProgressIndicator();
      //     }
      //   },
      // ),
    );
  }
}

Future<CameraDescription> getCamera() async {
  final cameras = await availableCameras();
  final firstCamera = cameras.first;
  return firstCamera;
}

class DisplayPictureScreen extends StatelessWidget {
  final String imagePath;

  const DisplayPictureScreen({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Display the Picture')),
      // The image is stored as a file on the device. Use the `Image.file`
      // constructor with the given path to display the image.
      body: Center(
        child: Image.file(
          File(imagePath),
        ),
      ),
    );
  }
}
