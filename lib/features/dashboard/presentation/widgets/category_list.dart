import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:go_money/features/store/application/category_list_controller.dart';

class CategoryList extends ConsumerWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categories = ref.watch(categoryListControllerProvider);
    return SizedBox(
      height: 120,
      child: categories.when(
        data: (data) {
          return ListView.builder(
            itemBuilder: (_, index) {
              return Card(
                margin: const EdgeInsets.all(15),
                child: Container(
                  color: Colors.orange[100 * (index % 12 + 1)],
                  alignment: Alignment.center,
                  child: Text(
                    data[index].name,
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
              );
            },
            itemCount: data.length,
            scrollDirection: Axis.horizontal,
          );
        },
        error: (e, s) => Center(
          child: Text('Err $e'),
        ),
        loading: () {
          /// Loading with Shimmer
          return const Center(
            child: Text('Loading'),
          );
        },
      ),
    );
  }
}
