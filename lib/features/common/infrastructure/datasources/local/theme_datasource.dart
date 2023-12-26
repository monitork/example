import 'package:core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
class ThemeDatasource {
  ///
  ThemeDatasource(SharedPreferences prefs) : _prefs = prefs;

  final SharedPreferences _prefs;

  static const _key = 'user_theme';

  /// get current theme if == true ==> isDark
  EitherFailure<bool> get() {
    final v = _prefs.getBool(_key);
    if (v == null) {
      return left(const Failure.empty());
    }

    return right(v);
  }

  /// update theme
  Future<bool> store({required bool isDark}) async {
    return _prefs.setBool(_key, isDark);
  }
}
