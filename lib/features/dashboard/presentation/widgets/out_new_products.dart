import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:resource/resource.dart';

class OutNewProducts extends StatelessWidget {
  const OutNewProducts({
    required this.maxExtent,
    required this.shrinkOffset,
    required this.minExtent,
    super.key,
  });
  final double maxExtent;
  final double minExtent;
  final double shrinkOffset;

  @override
  Widget build(BuildContext context) {
    final minHeight = minExtent + 53;
    final isVisible = (maxExtent - shrinkOffset) > minHeight;

    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        Container(
          alignment: Alignment.centerLeft,
          constraints: BoxConstraints(
            minHeight: kToolbarHeight + MediaQuery.of(context).padding.top,
          ),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AppAssets.images.background.path,
                package: Resource.resource,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomRight,
              colors: [
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.2),
              ],
            ),
          ),
        ),
        Visibility(
          visible: isVisible,
          child: Opacity(
            opacity: 1 - shrinkOffset / maxExtent,
            child: const OutNewProductsText(),
          ),
        ),
        Positioned(
          left: 0,
          top: 0,
          right: 0,
          child: SafeArea(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    FadeInUp(
                      duration: const Duration(milliseconds: 1200),
                      child: IconButton(
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                    FadeInUp(
                      duration: const Duration(milliseconds: 1300),
                      child: IconButton(
                        icon: const Icon(
                          Icons.shopping_cart,
                          color: Colors.white,
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class OutNewProductsText extends StatelessWidget {
  const OutNewProductsText({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          const SizedBox.shrink(),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                FadeInUp(
                  duration: const Duration(milliseconds: 1500),
                  child: const Text(
                    'Our New Products',
                    style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                FadeInUp(
                  duration: const Duration(milliseconds: 1700),
                  child: const Row(
                    children: <Widget>[
                      Text(
                        'VIEW MORE',
                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
