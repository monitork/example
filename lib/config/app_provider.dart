import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'app_provider.g.dart';

///
/// Infrastructure dependencies
///

/// Exposes [SharedPreferences] instance
@riverpod
FutureOr<SharedPreferences> sharedPreferences(SharedPreferencesRef ref) {
  return SharedPreferences.getInstance();
}

///
/// Application dependencies
///

///
/// Presentation dependencies
///

/// Triggered from bootstrap() to complete futures
Future<void> intGlobalProvider(ProviderContainer container) async {
  await container.read(sharedPreferencesProvider.future);
}
