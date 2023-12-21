part of '../app_router.dart';

abstract class NavigationService {
  static final context = _rootNavigatorKey.currentContext;

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

  static void go(String location) => context?.go(location);

  static Future<T?>? push<T>(String location) => context?.push<T>(location);

  static void pushReplacement(String location) => context?.pushReplacement(location);

  static void replace(String location) => context?.replace(location);

  /// ==============> End
}
