import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_money/app.dart';
import 'package:go_money/bootstrap.dart';
import 'package:go_money/config/app_provider.dart';

/// [UncontrolledProviderScope] this class handle some provider call without widgetRef
/// Example in here we call bootstrap function to init intGlobalProvider without widgetRef
Future<void> main() async {
  runApp(
    UncontrolledProviderScope(
      container: await bootstrap(AppEnv.development),
      child: const MoneyApp(),
    ),
  );
}
