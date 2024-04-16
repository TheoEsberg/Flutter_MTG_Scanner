import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/app.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  // The [WidgetsFlutterBinding] is used to ensure
  // that plugin services are correctly initialized.
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const ProviderScope(child: MyApp()));
}
