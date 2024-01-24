import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_money/config/extensions/widget_ref_extension.dart';
import 'package:go_money/features/common/presentation/widgets/wrapper.dart';
import 'package:go_money/features/dashboard/application/dashboard_controller.dart';
import 'package:go_money/features/dashboard/presentation/widgets/category_list.dart';
import 'package:go_money/features/dashboard/presentation/widgets/home_sliver_appbar.dart';

const _expandedHeight = 500.0;

class DashboardPage extends ConsumerWidget {
  ///
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final top = MediaQuery.of(context).padding.top;
    final minExtent = kToolbarHeight + top;
    ref.easyListen(
      dashboardControllerProvider,
      handleLoading: true,
      handleError: true,
      whenData: (data){

      }
    );
    return Wrapper(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: HomeSliverAppbar(_expandedHeight, minExtent),
              pinned: true,
            ),
            const SliverToBoxAdapter(
              child: CategoryList(),
            ),
          ],
        ),
      ),
    );
  }
}

