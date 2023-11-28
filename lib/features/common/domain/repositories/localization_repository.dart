import 'dart:ui';

import 'package:fpdart/fpdart.dart';
import 'package:go_money/features/common/domain/failures/failure.dart';

///
abstract class LocalizationRepository {
  ///
  Either<Failure, Locale> currentLocalization();

  ///
  Future<Either<Failure, bool>> setLocalization(Locale locale);
}
