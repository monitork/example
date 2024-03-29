part of 'extensions.dart';

/// A set of useful [BuildContext] extensions
extension BuildContextX on BuildContext {
  /// Extensions for quickly accessing generated localization getters
  AppLocalizations get tr => AppLocalizations.of(this)!;

  /// Extension for quickly accessing app [ColorScheme]
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Extension for quickly accessing app [TextTheme]
  TextTheme get textTheme => Theme.of(this).textTheme;

  /// Extension for quickly accessing app [Theme]
  ThemeData get theme => Theme.of(this);

  /// Extension for quickly accessing screen size
  Size get screenSize => MediaQuery.of(this).size;

  ///
  // Example
  // Container(
  //   child: context.responsive<Widget>(
  //     mobileWidget, // default
  //     md: tabletWidget, // medium
  //     lg: desktopWidget, // large
  //   ),
  // )
  //   GridView.count(
  //    crossAxisCount: context.responsive<int>(
  //     2, // default
  //     sm: 2, // small
  //     md: 3, // medium
  //     lg: 4, // large
  //     xl: 5, // extra large screen
  //   )
  ///

  T responsive<T>(
    T defaultVal, {
    T? sm,
    T? md,
    T? lg,
    T? xl,
  }) {
    final wd = MediaQuery.of(this).size.width;
    return wd >= 1280
        ? (xl ?? lg ?? md ?? sm ?? defaultVal)
        : wd >= 1024
            ? (lg ?? md ?? sm ?? defaultVal)
            : wd >= 768
                ? (md ?? sm ?? defaultVal)
                : wd >= 640
                    ? (sm ?? defaultVal)
                    : defaultVal;
  }

  ///
  double getHeight([double factor = 1]) {
    assert(factor != 0, 'factor must be > 0 ');
    return MediaQuery.of(this).size.height * factor;
  }

  ///
  double getWidth([double factor = 1]) {
    assert(factor != 0, 'factor must be > 0 ');
    return MediaQuery.of(this).size.width * factor;
  }

  ///
  double get height => getHeight();

  ///
  double get width => getWidth();
}
