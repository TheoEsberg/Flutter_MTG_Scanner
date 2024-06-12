import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_mtg_scanner/core/constants/app_routes.dart';
import 'package:flutter_mtg_scanner/features/login/models/login_model.dart';
import 'package:flutter_mtg_scanner/features/login/repositories/login_repository.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginRepo = ref.watch(loginRepositoryProvider);
    final emailController = useTextEditingController();
    final passwordController = useTextEditingController();

    emailController.text = 'test@test.com';
    passwordController.text = 'test123';

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'MTG Tavern',
                style: TextStyle(fontSize: 24.0),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: const OutlineInputBorder(),
                    labelText: 'E-Mail',
                    labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary)),
              ),
              const SizedBox(
                height: 24.0,
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                    focusColor: Colors.white,
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    border: const OutlineInputBorder(),
                    labelText: 'Password',
                    labelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary)),
              ),
              const SizedBox(
                height: 12.0,
              ),
              OutlinedButton(
                  onPressed: () async {
                    final user = await loginRepo.loginUser(
                        loginModel: LoginModel(
                            email: emailController.text,
                            password: passwordController.text));
                    if (user != null && context.mounted) {
                      ref.read(userProvider.notifier).state = user;
                      context.goNamed(AppRoutes.Search);
                    } else if (context.mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('E-Mail or Password is incorrect')));
                    }
                  },
                  child: Text(
                    'Login',
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.onPrimary),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
