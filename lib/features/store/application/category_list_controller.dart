import 'package:go_money/features/store/domain/entities/category_entity.dart';
import 'package:go_money/features/store/store_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'category_list_controller.g.dart';

@riverpod
class CategoryListController extends _$CategoryListController {
  @override
  FutureOr<List<CategoryEntity>> build() async {
    final res = await ref.read(storeRepositoryProvider).getAllCates();
    return res.fold((l) => throw l, (r) => r);
  }
}
