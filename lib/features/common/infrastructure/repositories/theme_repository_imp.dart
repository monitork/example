import 'package:core/core.dart';
import 'package:go_money/features/common/domain/repositories/theme_repository.dart';
import 'package:go_money/features/common/infrastructure/datasources/local/theme_datasource.dart';

///
class ThemeRepositoryImp extends ThemeRepository {
  ///
  ThemeRepositoryImp({required ThemeDatasource datasource}) : _datasource = datasource;

  final ThemeDatasource _datasource;

  @override
  Either<Failure, bool> isDark() {
    try {
      return _datasource.get();
    } catch (_) {
      return left(const Failure.empty());
    }
  }

  @override
  Future<Either<Failure, bool>> setTheme({bool isDark = false}) async {
    try {
      final res = await _datasource.store(isDark: false);
      return right(res);
    } catch (_) {
      return left(const Failure.empty());
    }
  }
}
