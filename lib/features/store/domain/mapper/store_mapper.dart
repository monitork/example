import 'package:go_money/features/store/domain/entities/category_entity.dart';
import 'package:go_money/features/store/infrastructure/dto/category_dto.dart';

abstract class StoreMapper {
  StoreMapper._();
  static CategoryEntity categoryMapper(CategoryDto dto) {
    return CategoryEntity(id: dto.id, name: dto.name, image: dto.image);
  }
}
