import 'package:go_money/config/app_provider.dart';
import 'package:go_money/features/common/domain/repositories/localization_repository.dart';
import 'package:go_money/features/common/infrastructure/datasources/local/localization_datasource.dart';
import 'package:go_money/features/common/infrastructure/repositories/localization_repository_imp.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'common_provider.g.dart';

///
@riverpod
LocalizationRepository localizationRepository(LocalizationRepositoryRef ref) {
  final prefs = ref.read(sharedPreferencesProvider).asData!.value;
  return LocalizationRepositoryImp(datasource: LocalizationDatasource(prefs));
}
