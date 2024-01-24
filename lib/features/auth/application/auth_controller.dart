import 'package:go_money/features/auth/auth_provider.dart';
import 'package:go_money/features/auth/domain/entities/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  // isLogin
  @override
  FutureOr<UserEntity?> build() async {
    final auth = ref.read(authRepositoryProvider);
    final res = await auth.isLoggedIn();
    final user = res.getOrElse((l) => null);
    authStateListenable.value = user != null;
    return user;
  }

  Future<void> doLogout() async {
    authStateListenable.value = false;
    final auth = ref.read(authRepositoryProvider);
    await auth.doLogout();
  }
}
