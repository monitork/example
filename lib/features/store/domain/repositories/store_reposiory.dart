import 'package:core/defines/_defines.dart';
import 'package:go_money/features/store/domain/entities/category_entity.dart';

abstract class StoreRepository {
  FutureEither<List<CategoryEntity>> getAllCates();
}
