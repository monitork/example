part of '../app_router.dart';

class DashboardRouter extends GoRouteData {
  const DashboardRouter();

  ///[path] DashboardPage path
  static const String path = '/';

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const DashboardPage();
  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: DashboardPage());
  }
}
