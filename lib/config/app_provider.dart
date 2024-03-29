import 'package:core/core.dart';
import 'package:fake_api/fake_api.dart';
import 'package:flutter/foundation.dart';
import 'package:go_money/config/rest_api/auth_interceptor.dart';
import 'package:go_money/features/auth/application/auth_controller.dart';
import 'package:go_money/features/common/common_provider.dart';
import 'package:resource/resource.dart';
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
    baseUrl: Uri.tryParse(Resource.env.get('BASE_URL')),
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
  await Resource.initEnv();
  container
    ..read(tokenRepositoryProvider)
    ..read(authControllerProvider);
  if (kDebugMode) {
    print('[SHIN] ....');
  }
}

enum AppEnv {
  production(name: 'production'),
  staging(name: 'staging'),
  development(name: 'development');

  const AppEnv({required this.name});

  final String name;
}
