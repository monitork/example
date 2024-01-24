import 'package:flutter/material.dart';
import 'package:go_money/features/dashboard/presentation/widgets/out_new_products.dart';

class HomeSliverAppbar extends SliverPersistentHeaderDelegate {
  const HomeSliverAppbar(this.maxExtent, this.minExtent);

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