part of '../app_router.dart';

abstract class NavigationService {
  NavigationService._();
  static final _context = _rootNavigatorKey.currentContext;

  static void removeFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static void _closeOverlays() {
    FToast().removeQueuedCustomToasts();
  }

  static Future<void> pop<T>(
    BuildContext context, {
    T? result,
    bool closeOverlays = false,
  }) async {
    if (closeOverlays) {
      _closeOverlays();
    }
    if (context.canPop()) {
      // Note: GoRouter logging will wrongly log that it's popping current route
      // when popping a dialog: https://github.com/flutter/flutter/issues/119237
      return context.pop(result);
    }
  }

  static Future<void> popDialog<T extends Object?>(
    BuildContext context, {
    T? result,
  }) async {
    final navigator = Navigator.of(context, rootNavigator: true);
    if (navigator.canPop()) {
      return navigator.pop(result);
    }
  }

  /// ==============> Start
  /// Make go router run without context

  static void go(String location) => _context?.go(location);

  static Future<T?>? push<T>(String location) => _context?.push<T>(location);

  static void pushReplacement(String location) => _context?.pushReplacement(location);

  static void replace(String location) => _context?.replace(location);

  /// ==============> End
}
