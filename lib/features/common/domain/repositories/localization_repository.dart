import 'dart:ui';

import 'package:core/core.dart';

///
abstract class LocalizationRepository {
  ///
  EitherFailure<Locale> currentLocalization();

  ///
  FutureEither<bool> setLocalization(Locale locale);
}
