import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_money/features/auth/auth_provider.dart';
import 'package:go_money/features/auth/presentation/pages/login_page.dart';
import 'package:go_money/features/auth/presentation/pages/profile_page.dart';
import 'package:go_money/features/common/presentation/pages/error_page.dart';
import 'package:go_money/features/common/presentation/pages/splash_page.dart';
import 'package:go_money/features/common/presentation/utils/extensions/extensions.dart';
import 'package:go_money/features/dashboard/presentation/pages/dasbboard_page.dart';
import 'package:go_router/go_router.dart';
import 'package:resource/resource.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

part 'navigations/navigation_service.dart';

part 'navigations/navigation_transitions.dart';

part 'router/auth_router.dart';

part 'router/common_router.dart';

part 'router/shell_router.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _shellNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'shell');

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
    redirect: (_, state) {
      final loggedIn = authStateListenable.value;
      final goingToLogin = state.matchedLocation.contains(LoginRouter.path);
      final goingToSplash = state.matchedLocation.contains(SplashRoute.path);
      if (loggedIn == null && !goingToLogin) {
        return SplashRoute.path;
      }
      if (!(loggedIn ?? false) && !goingToLogin) {
        return LoginRouter.path;
      }
      if ((loggedIn ?? false) && goingToLogin || (loggedIn ?? false) && goingToSplash) return DashboardRouter.path;
      return null;
    },
    refreshListenable: authStateListenable,
  );

  return router;
}

@TypedShellRoute<AppShellRouteData>(
  routes: <TypedRoute<RouteData>>[
    TypedGoRoute<DashboardRouter>(path: DashboardRouter.path),
    TypedGoRoute<ProfiledRouter>(path: ProfiledRouter.path),
  ],
)
class AppShellRouteData extends ShellRouteData {
  ///
  const AppShellRouteData();

  static final GlobalKey<NavigatorState> $navigatorKey = _shellNavigatorKey;

  @override
  Widget builder(BuildContext context, GoRouterState state, Widget navigator) {
    return MyShellRouteScreen(child: navigator);
  }
}
