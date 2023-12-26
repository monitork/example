import 'package:core/core.dart';
import 'package:go_money/features/auth/auth_provider.dart';
import 'package:go_money/features/auth/domain/entities/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  // isLogin
  @override
  Future<FutureOr<UserEntity>?> build() async {
    final auth = ref.read(authRepositoryProvider);
    final res = await auth.isLoggedIn();
    final userEntity = res.getOrElse((l) => null);
    _updateAuthState(userEntity);

    return userEntity;
  }

  void _updateAuthState(UserEntity? userEntity) {
    authStateListenable.value = userEntity != null;
  }
}
