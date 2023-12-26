import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_money/config/app_router.dart';
import 'package:go_money/features/common/presentation/utils/extensions/extensions.dart';

class ProfilePage extends ConsumerWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.tr.authPage),
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
