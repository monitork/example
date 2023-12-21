import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:go_money/config/rest_api/auth_interceptor.dart';
import 'package:go_money/core/core_provider.dart';
import 'package:go_money/core/infrastructure/datasources/swagger_generated_code/client_index.dart';
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
    baseUrl: Uri.tryParse(dotenv.get('BASE_URL')),
  );
}

///
/// Application dependencies
///

///
/// Presentation dependencies
///

/// Triggered from bootstrap() to complete futures
Future<void> intGlobalProvider(ProviderContainer container, AppEnv env) async {
  //Core
  await dotenv.load(fileName: 'assets/env/${env.name}.env');
  container
    ..read(localeProvider)
    ..read(tokenRepositoryProvider);
  if (kDebugMode) {
    print('[SHIN] ....');
  }
}

enum AppEnv {
  production(name: 'production'),
  stagging(name: 'stagging'),
  development(name: 'development');

  const AppEnv({required this.name});
  final String name;
}
