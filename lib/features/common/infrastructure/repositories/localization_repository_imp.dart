import 'dart:ui';

import 'package:core/core.dart';
import 'package:go_money/features/common/domain/repositories/localization_repository.dart';
import 'package:go_money/features/common/infrastructure/datasources/local/localization_datasource.dart';

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
