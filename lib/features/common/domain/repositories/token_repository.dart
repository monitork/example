import 'package:fpdart/fpdart.dart';
import 'package:go_money/features/common/domain/failures/failure.dart';

///
abstract class TokenRepository {
  ///
  Either<Failure, String> token();
  Either<Failure, String> tokenRefresh();

  ///
  Future<Either<Failure, bool>> setToken(String token);
  Future<Either<Failure, bool>> setTokenRefresh(String token);
}
