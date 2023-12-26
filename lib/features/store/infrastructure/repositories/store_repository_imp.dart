import 'package:core/core.dart';
import 'package:go_money/features/store/domain/entities/category_entity.dart';
import 'package:go_money/features/store/domain/mapper/store_mapper.dart';
import 'package:go_money/features/store/domain/repositories/store_reposiory.dart';
import 'package:go_money/features/store/infrastructure/network/store_service.dart';

class StoreRepositoryImp implements StoreRepository {
  StoreRepositoryImp(StoreService store) : _store = store;

  final StoreService _store;

  @override
  FutureEither<List<CategoryEntity>> getAllCates() async {
    try {
      final res = await _store.getAllCategories();
      final items = res.map(StoreMapper.categoryMapper).toList();
      return right(items);
    } catch (e) {
      return left(const Failure.empty());
    }
  }
}
