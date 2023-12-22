import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_money/core/presentation/utils/extensions/extensions.dart';
import 'package:go_money/features/auth/application/auth_controller.dart';

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
        ],
      ),
    );
  }
}
