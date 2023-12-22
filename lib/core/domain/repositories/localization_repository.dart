import 'dart:ui';

import 'package:core/core.dart';

///
abstract class LocalizationRepository {
  ///
  Either<Failure, Locale> currentLocalization();

  ///
  Future<Either<Failure, bool>> setLocalization(Locale locale);
}
