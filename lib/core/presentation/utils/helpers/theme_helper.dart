import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeHelper {
  ThemeHelper._();

  static bool isDarkMode([Brightness? platformBrightness]) {
    final brightness =
        // ignore: deprecated_member_use
        platformBrightness ?? SchedulerBinding.instance.window.platformBrightness;
    return brightness == Brightness.dark;
  }

  static ThemeMode getSystemTheme([Brightness? platformBrightness]) {
    final isDark = isDarkMode(platformBrightness);
    return isDark ? ThemeMode.dark : ThemeMode.light;
  }

  // static SystemUiOverlayStyle getFullScreenOverlayStyle(
  //   BuildContext context, {
  //   required bool darkOverlays,
  //   required bool supportsEdgeToEdge,
  // }) {
  //   final (themeMode, olderAndroidSystemNavBarColor) = darkOverlays
  //       ? (ThemeMode.light, AppColorsLight().olderAndroidSystemNavBarColor)
  //       : (ThemeMode.dark, AppColorsDark().olderAndroidSystemNavBarColor);

  //   return themeMode.overlayStyle(
  //     statusBarColor: Colors.transparent,
  //     supportsEdgeToEdge: supportsEdgeToEdge,
  //     systemNavBarColor: Colors.transparent,
  //     olderAndroidSystemNavBarColor: olderAndroidSystemNavBarColor,
  //   );
  // }
}
