import 'package:core/core.dart';
import 'package:go_money/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  FutureEither<UserEntity?> isLoggedIn();
  FutureEither<bool> doLogin();
  Future<void> doLogout();
}
