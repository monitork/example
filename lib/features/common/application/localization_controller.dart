import 'dart:ui';

import 'package:go_money/features/common/common_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'localization_controller.g.dart';

///
@riverpod
class LocalizationController extends _$LocalizationController {
  @override
  Locale build() {
    final repository = ref.read(localizationRepositoryProvider);
    final res = repository.currentLocalization();
    return res.fold((l) => const Locale('en'), (r) => r);
  }

  /// Change Locale
  void change(Locale locale) {
    if (locale.countryCode != state.languageCode) {
      state = locale;
      ref.read(localizationRepositoryProvider).setLocalization(locale);
    }
  }
}
