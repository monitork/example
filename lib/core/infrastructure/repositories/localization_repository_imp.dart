import 'dart:ui';

import 'package:fpdart/fpdart.dart';
import 'package:go_money/core/domain/failures/failure.dart';
import 'package:go_money/core/domain/repositories/localization_repository.dart';
import 'package:go_money/core/infrastructure/datasources/local/localization_datasource.dart';

///
class LocalizationRepositoryImp extends LocalizationRepository {
  ///
  LocalizationRepositoryImp({
    required LocalizationDatasource datasource,
  }) : _datasource = datasource;

  final LocalizationDatasource _datasource;

  @override
  Either<Failure, Locale> currentLocalization() {
    try {
      final res = _datasource.get();
      if (res.isLeft()) {
        return left(const Failure.empty());
      }
      return right(Locale(res.getOrElse((_) => 'en')));
    } catch (_) {
      return left(const Failure.empty());
    }
  }

  @override
  Future<Either<Failure, bool>> setLocalization(Locale locale) async {
    try {
      final res = await _datasource.store(locale.languageCode);
      return right(res);
    } catch (_) {
      return left(const Failure.empty());
    }
  }
}
