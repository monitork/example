import 'package:go_money/config/app_provider.dart';
import 'package:go_money/features/auth/domain/repositores/auth_repository.dart';
import 'package:go_money/features/auth/infrastructure/repositories/auth_repository_imp.dart';
import 'package:go_money/features/common/common_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod()
AuthRepository authRepository(AuthRepositoryRef ref) {
  return AuthRepositoryImp(
    api: ref.read(platziApiProvider),
    tokenR: ref.read(tokenRepositoryProvider),
  );
}
