import 'package:fpdart/fpdart.dart';
import 'package:go_money/features/auth/domain/entities/user_entity.dart';
import 'package:go_money/features/common/domain/failures/failure.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity?>> isLoggedIn();
  Future<Either<Failure, bool>> doLogin();
  Future<bool> doLogout();
}
