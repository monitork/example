import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:go_money/features/auth/presentation/pages/login_page.dart';
import 'package:go_money/features/auth/presentation/pages/profile_page.dart';
import 'package:go_money/features/common/presentation/pages/error_page.dart';
import 'package:go_money/features/common/presentation/pages/splash_page.dart';
import 'package:go_money/features/common/presentation/utils/extensions/extensions.dart';
import 'package:go_money/features/dashboard/presentation/pages/dasbboard_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'router/common_router.dart';

part 'router/dashboard_router.dart';

part 'router/profile_router.dart';

part 'router/login_router.dart';

part 'app_router.g.dart';

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

class MyShellRouteScreen extends StatelessWidget {
  const MyShellRouteScreen({required this.child, super.key});

  final Widget child;

  int getCurrentIndex(BuildContext context) {
    final location = GoRouterState.of(context).uri.toString();
    if (location.startsWith('/profile')) {
      return 1;
    }
    return 0;
  }

  @override
  Widget build(BuildContext context) {
    final int selectedIndex = getCurrentIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => _onChange(context, index),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: context.tr.homePage,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.person),
            label: context.tr.authPage,
          ),
        ],
      ),
    );
  }

  void _onChange(BuildContext context, int index) {
    switch (index) {
      case 0:
        const DashboardRouter().go(context);
      case 1:
        const ProfiledRouter().go(context);
    }
  }
}
