import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class UserSecureStorage {
  static const _usrStorage = FlutterSecureStorage();

  static const _keyToken = 'token';
  static const _keyUserId = 'userId';
  static const _keyGroupId = 'groupId';

  static Future setToken(String token) async =>
      await _usrStorage.write(key: _keyToken, value: token);

  static Future<String?> getToken() async {
    return await _usrStorage.read(key: _keyToken);
  }

  static Future setUserId(int id) async =>
      await _usrStorage.write(key: _keyUserId, value: id.toString());

  static Future<int?> getUserId() async {
    final id = await _usrStorage.read(key: _keyUserId);
    return int.parse(id!);
  }

  static Future setGroupId(int id) async =>
      await _usrStorage.write(key: _keyGroupId, value: id.toString());

  static Future<int?> getGroupId() async {
    final id = await _usrStorage.read(key: _keyGroupId);
    return int.parse(id!);
  }
}
