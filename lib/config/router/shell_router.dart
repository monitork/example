part of '../app_router.dart';

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
    final selectedIndex = getCurrentIndex(context);

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
        NavigationService.go(DashboardRouter.path);
      case 1:
        NavigationService.go(ProfiledRouter.path);
    }
  }
}

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
