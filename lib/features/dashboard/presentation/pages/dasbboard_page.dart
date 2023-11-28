import 'package:flutter/material.dart';
import 'package:go_money/features/common/presentation/widgets/wrapper.dart';
import 'package:go_money/features/dashboard/application/counter_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

///
class DashboardPage extends ConsumerWidget {
  ///
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(counterControllerProvider.notifier);
    return Wrapper(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Counter ${ref.watch(counterControllerProvider)}'),
              TextButton(
                onPressed: controller.increment,
                child: const Text('Incressment'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
