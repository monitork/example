import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_money/features/common/application/localization_controller.dart';
import 'package:go_money/features/common/application/theme_controller.dart';
import 'package:go_money/features/common/presentation/utils/extensions/extensions.dart';
import 'package:go_money/features/dashboard/application/counter_controller.dart';

class CounterWidget extends ConsumerWidget {
  const CounterWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(counterControllerProvider.notifier);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(context.tr.counterText(ref.watch(counterControllerProvider))),
          TextButton(
            onPressed: controller.increment,
            child: Text(context.tr.btnIncreasement),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  ref.read(localizationControllerProvider.notifier).change(const Locale('en'));
                },
                child: Text('${context.tr.btnChangeLanguage} En'),
              ),
              TextButton(
                onPressed: () {
                  ref.read(localizationControllerProvider.notifier).change(const Locale('vi'));
                },
                child: Text('${context.tr.btnChangeLanguage} Vi'),
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              ref.read(themeControllerProvider.notifier).change();
            },
            child: Text(context.tr.btnChangeTheme),
          ),
        ],
      ),
    );
  }
}
