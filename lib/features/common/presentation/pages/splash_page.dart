import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_money/features/common/presentation/widgets/wrapper.dart';

class SplashPage extends ConsumerWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Wrapper(
      child: Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
