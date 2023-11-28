import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_money/features/common/application/localization_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_localizations.g.dart';

/// provider used to access the AppLocalizations object for the current locale
@riverpod
AppLocalizations locale(LocaleRef ref) {
  // set the initial locale
  final locale = ref.read(localizationControllerProvider);
  // if don't have localizationControllerProvider
  // WidgetsBinding.instance.platformDispatcher.locale ==> This is default locale from system

  ref.state = lookupAppLocalizations(
    basicLocaleListResolution(
      [locale],
      AppLocalizations.supportedLocales,
    ),
  );
  // update afterwards
  final observer = _LocaleObserver((locales) {
    ref.state = lookupAppLocalizations(
      basicLocaleListResolution(
        [locale],
        AppLocalizations.supportedLocales,
      ),
    );
  });
  final binding = WidgetsBinding.instance..addObserver(observer);
  ref.onDispose(() => binding.removeObserver(observer));
  return ref.state;
}

/// observed used to notify the caller when the locale changes
class _LocaleObserver extends WidgetsBindingObserver {
  _LocaleObserver(this._didChangeLocales);
  final void Function(List<Locale>? locales) _didChangeLocales;
  @override
  void didChangeLocales(List<Locale>? locales) {
    _didChangeLocales(locales);
  }
}
