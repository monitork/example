part of '../app_router.dart';

class ProfiledRouter extends GoRouteData {
  const ProfiledRouter();

  static const String path = '/profile';

  // @override
  // Widget build(BuildContext context, GoRouterState state) => const ProfilePage();

  @override
  Page<void> buildPage(BuildContext context, GoRouterState state) {
    return const NoTransitionPage(child: ProfilePage());
  }
}
