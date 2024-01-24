import 'package:core/core.dart';
import 'package:fake_api/fake_api.dart';
import 'package:go_money/features/auth/domain/entities/user_entity.dart';
import 'package:go_money/features/auth/domain/repositores/auth_repository.dart';
import 'package:go_money/features/common/domain/repositories/token_repository.dart';

class AuthRepositoryImp extends AuthRepository {
  AuthRepositoryImp({required PlatziApi api, required TokenRepository tokenR})
      : _api = api,
        _tokenR = tokenR;

  final PlatziApi _api;
  final TokenRepository _tokenR;

  @override
  FutureEither<UserEntity?> isLoggedIn() async {
    try {
      final res = _tokenR.token();
      final token = res.fold((l) => '', (r) => r);
      if (token.isNotEmpty) {
        return doProfile();
      } else {
        return left(const Failure.empty());
      }
    } catch (e) {
      return left(const Failure.empty());
    }
  }

  @override
  FutureEither<bool> doLogin() async {
    try {
      final res = await _api.apiV1AuthLoginPost(
        body: const LoginDto(
          email: 'john@mail.com',
          password: 'changeme',
        ),
      );
      final data = (res.body) as Map;
      final token = data['access_token'];
      final reFreshToken = data['refresh_token'];
      await _tokenR.setToken(token.toString());
      await _tokenR.setTokenRefresh(reFreshToken.toString());
      final profile = await doProfile();
      final user = profile.getOrElse((l) => null);
      if (user != null) {
        return const Right(true);
      } else {
        return left(const Failure.empty());
      }
    } catch (e) {
      return left(const Failure.empty());
    }
  }

  @override
  Future<void> doLogout() async {
    // Call api logout if need
    await _tokenR.setToken('');
    await _tokenR.setTokenRefresh('');
  }

  FutureEither<UserEntity?> doProfile() async {
    try {
      final res = await _api.apiV1AuthProfileGet();
      final user = UserEntity.fromJson(res.body as Map<String, dynamic>);
      return right(user);
    } catch (e) {
      return left(const Failure.empty());
    }
  }
}
