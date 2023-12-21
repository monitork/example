import 'package:flutter/material.dart';
import 'package:go_money/core/core_provider.dart';
import 'package:go_money/core/presentation/providers/_provider.dart';
import 'package:go_money/core/presentation/utils/helpers/theme_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'theme_controller.g.dart';

///
@Riverpod(keepAlive: true)
class ThemeController extends _$ThemeController {
  @override
  FutureOr<ThemeMode> build() {
    return _getUserStoredTheme();
  }

  ///
  void change() {
    final mode = state.valueOrNull ?? ThemeMode.light;
    final isDark = !_isDark(mode);
    final themeMode = _getTheme(isDark);
    state = AsyncData(themeMode);
    ref.read(themeRepositoryProvider).setTheme(isDark: !isDark);
  }

  ThemeMode _getUserStoredTheme() {
    final res = ref.read(themeRepositoryProvider).isDark();
    final isDark = res.fold((l) => false, (r) => r);
    return _getTheme(isDark);
  }

  bool _isDark(ThemeMode mode) {
    return mode == ThemeMode.dark;
  }

  ThemeMode _getTheme(bool isDark) => isDark ? ThemeMode.dark : ThemeMode.light;
}

@Riverpod(keepAlive: true)
class PlatformBrightness extends _$PlatformBrightness with NotifierUpdate {
  @override
  // ignore: deprecated_member_use
  Brightness build() => WidgetsBinding.instance.window.platformBrightness;
}

@Riverpod(keepAlive: true)
ThemeMode currentAppThemeMode(CurrentAppThemeModeRef ref) {
  final theme = ref.watch(themeControllerProvider.select((data) => data.valueOrNull));

  final platformBrightness = ref.watch(platformBrightnessProvider);
  return theme ?? ThemeHelper.getSystemTheme(platformBrightness);
}
