import 'package:fpdart/fpdart.dart';
import 'package:go_money/core/domain/failures/failure.dart';

///
abstract class ThemeRepository {
  ///
  Either<Failure, bool> isDark();

  ///
  Future<Either<Failure, bool>> setTheme({bool isDark = false});
}
