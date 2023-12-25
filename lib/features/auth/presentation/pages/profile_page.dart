import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_money/config/app_router.dart';
import 'package:go_money/features/auth/application/auth_controller.dart';
import 'package:go_money/features/common/presentation/utils/extensions/extensions.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authControllerProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.tr.authPage),
          Text('${context.tr.hello} ${user?.name ?? ''}'),
          Text('${context.tr.email}: ${user?.email ?? ''}'),
          TextButton(
            onPressed: () {
              NavigationService.go('/');
            },
            child: const Text('Go Home'),
          ),
        ],
      ),
    );
  }
}
