import 'package:fake_api/datasources/swagger_generated_code/platzi_api.swagger.dart';
import 'package:go_money/features/store/domain/repositories/store_reposiory.dart';

class StoreRepositoryImp implements StoreRepository {
  StoreRepositoryImp(PlatziApi api) : _api = api;

  final PlatziApi _api;

  Future<Fal> allCates() {}
}
