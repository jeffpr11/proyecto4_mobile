import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _usrStorage = FlutterSecureStorage();

  static const _keyToken = 'token';

  static Future setToken(String token) async =>
      await _usrStorage.write(key: _keyToken, value: token);

  static Future<String?> getToken() async {
    return await _usrStorage.read(key: _keyToken);
  }
}
