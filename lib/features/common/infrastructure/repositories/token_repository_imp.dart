import 'package:core/core.dart';
import 'package:go_money/features/common/domain/repositories/token_repository.dart';
import 'package:go_money/features/common/infrastructure/datasources/local/token_datasource.dart';

///
class TokenRepositoryImp extends TokenRepository {
  ///
  TokenRepositoryImp({required TokenDatasource datasource}) : _datasource = datasource;
  final TokenDatasource _datasource;

  @override
  Future<Either<Failure, bool>> setToken(String token) async {
    try {
      final res = await _datasource.store(token);
      return right(res);
    } catch (e) {
      return left(const Failure.empty());
    }
  }

  @override
  Either<Failure, String> token() => _datasource.get();

  @override
  Future<Either<Failure, bool>> setTokenRefresh(String token) async {
    try {
      final res = await _datasource.storeRefresh(token);
      return right(res);
    } catch (e) {
      return left(const Failure.empty());
    }
  }

  @override
  Either<Failure, String> tokenRefresh() => _datasource.getRefresh();
}
