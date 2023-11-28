import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_money/config/app_router.dart';
import 'package:go_money/config/theme.dart';
import 'package:go_money/l10n/app_localizations.dart';
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
      title: 'EMoney',
      theme: AppTheme(Brightness.light).themeData,
      darkTheme: AppTheme(Brightness.dark).themeData,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routeInformationParser: router.routeInformationParser,
      routerDelegate: router.routerDelegate,
      routeInformationProvider: router.routeInformationProvider,
    );
  }
}
