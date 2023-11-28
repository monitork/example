import 'package:fpdart/fpdart.dart';
import 'package:go_money/features/common/domain/failures/failure.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
class LocalizationDatasource {
  ///
  LocalizationDatasource(SharedPreferences prefs) : _prefs = prefs;

  final SharedPreferences _prefs;

  static const _key = 'user_localization';

  /// get the localization from the device storage
  Either<Failure, String> get() {
    final v = _prefs.getString(_key);
    if (v == null) {
      return left(const Failure.empty());
    }

    return right(v);
  }

  /// Store current localization in device storage
  Future<bool> store(String token) async {
    return _prefs.setString(
      _key,
      token,
    );
  }
}
