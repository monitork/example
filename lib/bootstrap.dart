import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_money/config/app_provider.dart' as app_provider;
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Initializes services and controllers before the start of the application
Future<ProviderContainer> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  final container = ProviderContainer(
    overrides: [], //supabaseProvider.overrideWithValue(Supabase.instance)
    observers: [if (kDebugMode) _Logger()],
  );
  await app_provider.intGlobalProvider(container);
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
