import 'package:flutter/material.dart';
import 'package:go_money/features/auth/application/auth_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('AuthPage'),
          Text('Hello ${user?.name ?? ''}'),
          Text('Email: ${user?.email ?? ''}'),
        ],
      ),
    );
  }
}
