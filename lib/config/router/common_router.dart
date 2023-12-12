part of '../app_router.dart';

/// [SplashRoute] config SplashPage router
@TypedGoRoute<SplashRoute>(path: SplashRoute.path)
class SplashRoute extends GoRouteData {
  ///[SplashRoute] contructor
  const SplashRoute();

  ///[path] SplashPage path
  static const String path = '/splash';

  @override
  Widget build(BuildContext context, GoRouterState state) => const SplashPage();
}
