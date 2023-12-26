import 'package:core/core.dart';
import 'package:go_money/features/common/domain/repositories/token_repository.dart';
import 'package:go_money/features/common/infrastructure/datasources/local/token_datasource.dart';

///
class TokenRepositoryImp extends TokenRepository {
  ///
  TokenRepositoryImp({required TokenDatasource datasource}) : _datasource = datasource;
  final TokenDatasource _datasource;

  @override
  FutureEither<bool> setToken(String token) async {
    try {
      final res = await _datasource.store(token);
      return right(res);
    } catch (e) {
      return left(const Failure.empty());
    }
  }

  @override
  EitherFailure<String> token() => _datasource.get();

  @override
  FutureEither<bool> setTokenRefresh(String token) async {
    try {
      final res = await _datasource.storeRefresh(token);
      return right(res);
    } catch (e) {
      return left(const Failure.empty());
    }
  }

  @override
  EitherFailure<String> tokenRefresh() => _datasource.getRefresh();
}
