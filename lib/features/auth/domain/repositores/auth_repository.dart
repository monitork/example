import 'package:core/core.dart';
import 'package:go_money/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity?>> isLoggedIn();
  Future<Either<Failure, bool>> doLogin();
  Future<bool> doLogout();
}
