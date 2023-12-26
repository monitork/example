import 'package:core/core.dart';
import 'package:go_money/config/app_provider.dart';
import 'package:go_money/features/store/domain/repositories/store_reposiory.dart';
import 'package:go_money/features/store/infrastructure/network/store_service.dart';
import 'package:go_money/features/store/infrastructure/repositories/store_repository_imp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'store_provider.g.dart';

@riverpod
StoreService storeService(Ref ref) {
  return StoreService(api: ref.read(platziApiProvider));
}

@riverpod
StoreRepository storeRepository(Ref ref) {
  return StoreRepositoryImp(ref.read(storeServiceProvider));
}
