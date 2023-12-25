part of '../app_router.dart';

const _activeIconColor = Colors.red;

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

  Widget buildHomeIcon({bool isSelected = false}) {
    return AppAssets.svg.homeSvgrepoCom.svg(
      package: Resource.resourceWithSplash,
      color: isSelected ? Colors.red : Colors.green,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedIndex = getCurrentIndex(context);

    return Scaffold(
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) => _onChange(context, index),
        showUnselectedLabels: true,
        showSelectedLabels: true,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: AppAssets.svg.homeSvgrepoCom.svg(
              package: Resource.resourceWithSplash,
              color: _activeIconColor,
              width: IconSizes.md,
              height: IconSizes.md,
            ),
            icon: AppAssets.svg.homeSvgrepoCom.svg(
              package: Resource.resourceWithSplash,
              width: IconSizes.md,
              height: IconSizes.md,
            ),
            label: context.tr.homePage,
          ),
          BottomNavigationBarItem(
            activeIcon: AppAssets.svg.profileSvgrepoCom.svg(
              package: Resource.resourceWithSplash,
              color: _activeIconColor,
              width: IconSizes.md,
              height: IconSizes.md,
            ),
            icon: AppAssets.svg.profileSvgrepoCom.svg(
              package: Resource.resourceWithSplash,
              width: IconSizes.md,
              height: IconSizes.md,
            ),
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
