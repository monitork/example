import 'package:core/core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_money/config/app_provider.dart' as app_provider;
import 'package:go_money/config/app_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Initializes services and controllers before the start of the application
Future<ProviderContainer> bootstrap(AppEnv env) async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final container = ProviderContainer(
    overrides: [
      sharedPreferencesProvider.overrideWith((ref) => prefs),
    ],
    observers: [if (kDebugMode) _Logger()],
  );
  await app_provider.intGlobalProvider(container, env);
  return container;
}

class _Logger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<dynamic> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    debugPrint(
      '''
      {
      "provider": "${provider.name ?? provider.runtimeType}",
      "newValue": "$newValue"
      }''',
    );
  }
}
