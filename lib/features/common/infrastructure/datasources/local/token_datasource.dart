import 'package:core/core.dart';
import 'package:shared_preferences/shared_preferences.dart';

///
class TokenDatasource {
  ///
  TokenDatasource(SharedPreferences prefs) : _prefs = prefs;

  final SharedPreferences _prefs;

  static const _key = 'access_token';
  static const _keyRefresh = 'refresh_token';

  Either<Failure, String> get() {
    final v = _prefs.getString(_key);
    if (v == null) {
      return left(const Failure.empty());
    }

    return right(v);
  }

  Either<Failure, String> getRefresh() {
    final v = _prefs.getString(_keyRefresh);
    if (v == null) {
      return left(const Failure.empty());
    }

    return right(v);
  }

  Future<bool> store(String token) async {
    return _prefs.setString(_key, token);
  }

  Future<bool> storeRefresh(String refreshToken) async {
    return _prefs.setString(_keyRefresh, refreshToken);
  }
}
