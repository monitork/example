import 'package:flutter/widgets.dart';
import 'package:go_money/features/common/presentation/pages/error_page.dart';
import 'package:go_money/features/common/presentation/pages/splash_page.dart';
import 'package:go_money/features/dashboard/presentation/pages/dasbboard_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router/common_router.dart';
part 'router/dashboard_router.dart';
part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

/// [goRouter] this function wrapper AppRouter inside riverpod
@riverpod
GoRouter goRouter(GoRouterRef ref) {
  final router = GoRouter(
    debugLogDiagnostics: true,
    restorationScopeId: 'router',
    navigatorKey: _rootNavigatorKey,
    initialLocation: SplashRoute.path,
    routes: $appRoutes,
    errorBuilder: (_, state) => ErrorPage(message: state.error?.message ?? ''),
  );

  return router;
}
