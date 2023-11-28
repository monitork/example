part of '../app_router.dart';

/// [DashboardRouter] config SplashPage router
@TypedGoRoute<DashboardRouter>(path: DashboardRouter.path)
class DashboardRouter extends GoRouteData {
  ///[DashboardRouter] contructor
  const DashboardRouter();

  ///[path] DashboardPage path
  static const String path = '/home';

  @override
  Widget build(BuildContext context, GoRouterState state) => const DashboardPage();
}
