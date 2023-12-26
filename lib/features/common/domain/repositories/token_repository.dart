import 'package:core/core.dart';

///
abstract class TokenRepository {
  ///
  EitherFailure<String> token();
  EitherFailure<String> tokenRefresh();

  ///
  FutureEither<bool> setToken(String token);
  FutureEither<bool> setTokenRefresh(String token);
}
