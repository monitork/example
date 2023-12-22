import 'package:core/core.dart';
import 'package:flutter/material.dart';

import 'package:go_money/config/app_router.dart';
import 'package:go_money/core/presentation/widgets/wrapper.dart';
import 'package:go_money/features/auth/application/auth_controller.dart';

/// Default app splash screen
class SplashPage extends HookConsumerWidget {
  /// Default constructor for [SplashPage]
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(authControllerProvider, (previous, next) {
      if (next != null) {
        const DashboardRouter().go(context);
      } else {
        const LoginRouter().go(context);
      }
    });
    useEffect(
      () {
        ref.read(authControllerProvider.notifier).onCheck();
        return null;
      },
      [],
    );
    return const Wrapper(
      child: Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
