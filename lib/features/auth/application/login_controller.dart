import 'package:go_money/features/auth/auth_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'auth_controller.dart';

part 'login_controller.g.dart';

@riverpod
class LoginController extends _$LoginController {
  @override
  Future<void> build() async {}

  Future<void> onLogin() async {
    final res = await ref.read(authRepositoryProvider).doLogin();
    final isLoggedIn = res.fold((l) => false, (r) => r);
    if (isLoggedIn) {
      ref.read(authControllerProvider.notifier).build();
    }
  }
}
