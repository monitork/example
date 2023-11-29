import 'package:go_money/features/common/common_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'theme_controller.g.dart';

///
@riverpod
class ThemeController extends _$ThemeController {
  @override
  bool build() {
    final repository = ref.read(themeRepositoryProvider);
    final res = repository.isDark();
    return res.fold((l) => false, (r) => r);
  }

  ///
  void change() {
    state = !state;
    ref.read(themeRepositoryProvider).setTheme(isDark: state);
  }
}
