import 'package:fake_api/datasources/swagger_generated_code/platzi_api.swagger.dart';
import 'package:go_money/features/store/infrastructure/dto/category_dto.dart';

final class StoreService {
  StoreService({required PlatziApi api}) : _api = api;

  final PlatziApi _api;

  Future<List<CategoryDto>> getAllCategories() async {
    final res = await _api.apiV1CategoriesGet(limit: 10);
    if (res.body is List) {
      final body = res.body as List;
      final items = body.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>)).toList();
      return items;
    }
    return [];
  }
}
