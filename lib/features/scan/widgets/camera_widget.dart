import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_mtg_scanner/features/scan/views/scan_view.dart';

class CameraWidget extends StatefulWidget {
  const CameraWidget({super.key, required this.camera});

  final CameraDescription camera;

  @override
  CameraWidgetState createState() => CameraWidgetState();
}

class CameraWidgetState extends State<CameraWidget> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    _controller = CameraController(widget.camera, ResolutionPreset.max,
        enableAudio: false);
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaSize = MediaQuery.of(context).size;
    late final scale =
        1 / (_controller.value.aspectRatio * mediaSize.aspectRatio);
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Stack(
            children: [
              ClipRect(
                  clipper: _MediaSizeClipper(mediaSize),
                  child: Transform.scale(
                      scale: scale,
                      alignment: Alignment.topCenter,
                      child: CameraPreview(_controller))),
              Positioned(
                bottom: 16,
                left: MediaQuery.of(context).size.width / 2 -
                    28.0, // Center the button horizontally
                child: FloatingActionButton(
                  onPressed: () async {
                    try {
                      await _initializeControllerFuture;
                      final image = await _controller.takePicture();

                      if (context.mounted) {
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => DisplayPictureScreen(
                              // Pass the automatically generated path to
                              // the DisplayPictureScreen widget.
                              imagePath: image.path,
                            ),
                          ),
                        );
                      }
                    } catch (e) {
                      debugPrint(e.toString());
                    }
                  },
                  child: const Icon(Icons.camera_alt_outlined),
                ),
              ),
            ],
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

class _MediaSizeClipper extends CustomClipper<Rect> {
  final Size mediaSize;
  const _MediaSizeClipper(this.mediaSize);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTWH(0, 0, mediaSize.width, mediaSize.height);
  }

  @override
  bool shouldReclip(CustomClipper<Rect> oldClipper) {
    return true;
  }
}
