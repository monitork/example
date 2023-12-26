import 'package:core/core.dart';

///
abstract class ThemeRepository {
  ///
  EitherFailure<bool> isDark();

  ///
  FutureEither<bool> setTheme({bool isDark = false});
}
