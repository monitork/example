import 'package:flutter/material.dart';
import 'package:go_money/features/auth/application/login_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed: () {
            ref.read(loginControllerProvider.notifier).onLogin();
          },
          child: const Text('Login'),
        ),
      ),
    );
  }
}
