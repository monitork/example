import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_money/config/app_router.dart';
import 'package:go_money/config/theme.dart';
import 'package:go_money/features/common/application/localization_controller.dart';
import 'package:go_money/features/common/application/theme_controller.dart';
import 'package:go_money/features/common/presentation/utils/extensions/ui_extension.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      onGenerateTitle: (context) => context.tr.appName,
      themeMode: ref.watch(themeControllerProvider) ? ThemeMode.dark : ThemeMode.light,
      theme: AppTheme(Brightness.light).themeData,
      darkTheme: AppTheme(Brightness.dark).themeData,
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
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: child,
    );
  }
}
