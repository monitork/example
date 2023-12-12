import 'package:flutter/foundation.dart';
import 'package:go_money/config/auth/auth_interceptor.dart';
import 'package:go_money/features/common/common_provider.dart';
import 'package:go_money/features/common/infrastructure/datasources/swagger_generated_code/client_index.dart';
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

@riverpod
PlatziApi platziApi(PlatziApiRef ref) {
  return PlatziApi.create(
    // authenticator
    interceptors: [
      AuthInterceptor(ref.read(tokenRepositoryProvider)),
    ],
    baseUrl: Uri.tryParse('https://api.escuelajs.co'),
  );
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
  container..read(localeProvider)
  ..read(tokenRepositoryProvider);
  if (kDebugMode) {
    print('[SHIN] ....');
  }
}
