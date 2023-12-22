import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_money/config/app_constants.dart';
import 'package:go_money/config/app_router.dart';
import 'package:go_money/features/common/application/localization_controller.dart';
import 'package:go_money/features/common/application/theme_controller.dart';
import 'package:go_money/features/common/presentation/utils/extensions/extensions.dart';
import 'package:resource/resource.dart';

///
class MoneyApp extends HookConsumerWidget {
  ///
  const MoneyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// Keep router when hot reload
    final router = useMemoized(() => ref.read(goRouterProvider));
    useEffect(() => router.dispose, [router]);

    return MaterialApp.router(
      restorationScopeId: AppConstants.restorationScopeId,
      onGenerateTitle: (context) => context.tr.appName,
      themeMode: ref.watch(currentAppThemeModeProvider),
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: ref.watch(localizationControllerProvider),
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
      builder: (_, child) => _Unfocus(child: child),
    );
  }
}

/// A widget that unfocus everything when tapped.
///
/// This implements the "Unfocus when tapping in empty space" behavior for the
/// entire application.
class _Unfocus extends StatelessWidget {
  ///
  const _Unfocus({
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: NavigationService.removeFocus,
      child: child,
    );
  }
}
