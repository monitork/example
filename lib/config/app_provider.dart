import 'package:flutter/foundation.dart';
import 'package:go_money/l10n/app_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_provider.g.dart';

///
/// Infrastructure dependencies
///

/// Exposes [SharedPreferences] instance
@riverpod
SharedPreferences sharedPreferences(SharedPreferencesRef ref) {
  return throw UnimplementedError();
}

///
/// Application dependencies
///

///
/// Presentation dependencies
///

/// Triggered from bootstrap() to complete futures
Future<void> intGlobalProvider(ProviderContainer container) async {
  //Core
  container.read(localeProvider);
  if (kDebugMode) {
    print('[SHIN] ....');
  }
}
