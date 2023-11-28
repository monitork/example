import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_money/config/app_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Default app splash screen
class SplashPage extends HookConsumerWidget {
  /// Default constructor for [SplashPage]
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    useEffect(
      () {
        Future<void>.delayed(const Duration(seconds: 1)).then((_) => const DashboardRouter().go(context));
        return null;
      },
      [],
    );
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
