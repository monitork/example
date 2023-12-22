import 'package:core/core.dart';

///
abstract class ThemeRepository {
  ///
  Either<Failure, bool> isDark();

  ///
  Future<Either<Failure, bool>> setTheme({bool isDark = false});
}
