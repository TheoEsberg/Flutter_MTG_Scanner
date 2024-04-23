import 'package:flutter/material.dart';

class ScanResultWidget extends StatelessWidget {
  const ScanResultWidget({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Scanning OCR Result'),
        ),
        body: Container(
          padding: const EdgeInsets.all(30.0),
          child: Text(text),
        ),
      );
}
