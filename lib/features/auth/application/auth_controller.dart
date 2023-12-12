import 'package:go_money/features/auth/auth_provider.dart';
import 'package:go_money/features/auth/domain/entities/user_entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@Riverpod(keepAlive: true)
class AuthController extends _$AuthController {
  // isLogin
  @override
  UserEntity? build() {
    return null;
  }

  Future<void> onCheck() async {
    final auth = ref.read(authRepositoryProvider);
    final res = await auth.isLoggedIn();
    state = res.getOrElse((l) => null);
  }
}
