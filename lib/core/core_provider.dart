import 'package:go_money/config/app_provider.dart';
import 'package:go_money/core/domain/repositories/localization_repository.dart';
import 'package:go_money/core/domain/repositories/theme_repository.dart';
import 'package:go_money/core/domain/repositories/token_repository.dart';
import 'package:go_money/core/infrastructure/datasources/local/localization_datasource.dart';
import 'package:go_money/core/infrastructure/datasources/local/theme_datasource.dart';
import 'package:go_money/core/infrastructure/datasources/local/token_datasource.dart';
import 'package:go_money/core/infrastructure/repositories/localization_repository_imp.dart';
import 'package:go_money/core/infrastructure/repositories/theme_repository_imp.dart';
import 'package:go_money/core/infrastructure/repositories/token_repository_imp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'core_provider.g.dart';

///
@riverpod
LocalizationRepository localizationRepository(LocalizationRepositoryRef ref) {
  return LocalizationRepositoryImp(datasource: LocalizationDatasource(ref.read(sharedPreferencesProvider)));
}

///
@riverpod
ThemeRepository themeRepository(ThemeRepositoryRef ref) {
  return ThemeRepositoryImp(datasource: ThemeDatasource(ref.read(sharedPreferencesProvider)));
}

///
@riverpod
TokenRepository tokenRepository(TokenRepositoryRef ref) {
  return TokenRepositoryImp(datasource: TokenDatasource(ref.read(sharedPreferencesProvider)));
}
