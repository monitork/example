import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_money/features/common/presentation/widgets/wrapper.dart';
import 'package:go_money/features/dashboard/presentation/widgets/out_new_products.dart';

const _expandedHeight = 500.0;

class DashboardPage extends ConsumerWidget {
  ///
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final top = MediaQuery.of(context).padding.top;
    final minExtent = kToolbarHeight + top;
    return Wrapper(
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliveAppbar(_expandedHeight, minExtent),
              pinned: true,
            ),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 120,
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return Card(
                      margin: const EdgeInsets.all(15),
                      child: Container(
                        color: Colors.orange[100 * (index % 12 + 1)],
                        alignment: Alignment.center,
                        child: Text(
                          'List Item $index',
                          style: const TextStyle(fontSize: 30),
                        ),
                      ),
                    );
                  },
                  itemCount: 10,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     (BuildContext context, int index) {
            //       return Card(
            //         margin: const EdgeInsets.all(15),
            //         child: Container(
            //           color: Colors.orange[100 * (index % 12 + 1)],
            //           height: 60,
            //           alignment: Alignment.center,
            //           child: Text(
            //             'List Item $index',
            //             style: const TextStyle(fontSize: 30),
            //           ),
            //         ),
            //       );
            //     },
            //     childCount: 10,

            //   ),
            // )
          ],
        ),
      ),
    );
  }
}

class MySliveAppbar extends SliverPersistentHeaderDelegate {
  const MySliveAppbar(this.maxExtent, this.minExtent);

  @override
  final double maxExtent;

  @override
  final double minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  Widget build(BuildContext context, double shrinkOffset, bool overlapsContent) {
    return OutNewProducts(
      maxExtent: maxExtent,
      minExtent: minExtent,
      shrinkOffset: shrinkOffset,
    );
  }
}
