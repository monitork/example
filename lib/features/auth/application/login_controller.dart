import 'package:go_money/config/app_provider.dart';
import 'package:go_money/features/auth/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  // isLogin
  @override
  Future<void> build() async {
    // final repository = ref.read(tokenRepositoryProvider);
    // final res = repository.token();
    // return res.fold((l) => false, (r) => r.isNotEmpty);
  }

  Future<void> onLogin() async {
    await ref.read(authRepositoryProvider).doLogin();
  }
}
