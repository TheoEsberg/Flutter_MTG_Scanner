import 'package:flutter/material.dart';
import 'package:flutter_mtg_scanner/core/constants/app_routes.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LoginView extends ConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: OutlinedButton(
            onPressed: () => context.goNamed(AppRoutes.Scan),
            child: const Text('Login')),
      ),
    );
  }
}
