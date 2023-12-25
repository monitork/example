import 'package:core/core.dart';
import 'package:go_money/config/app_provider.dart';
import 'package:go_money/features/store/domain/repositories/store_reposiory.dart';
import 'package:go_money/features/store/infrastructure/repositories/store_repository_imp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

@riverpod
StoreRepository storeRepository(Ref ref) {
  return StoreRepositoryImp(ref.read(platziApiProvider));
}
