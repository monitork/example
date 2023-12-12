part of '../app_router.dart';

@TypedGoRoute<LoginRouter>(path: LoginRouter.path)
class LoginRouter extends GoRouteData {
  const LoginRouter();

  static const String path = '/login';

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}
