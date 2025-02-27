import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class LocalStorageService {
  static const _storage = FlutterSecureStorage();
  static const _keyToken = 'auth_token';
  static const _keyUserId = 'user_id';
  // Lưu token
  static Future<void> saveToken(String token) async {
    await _storage.write(key: _keyToken, value: token);
  }

  // Lấy token
  static Future<String?> getToken() async {
    return await _storage.read(key: _keyToken);
  }

  // Kiểm tra trạng thái đăng nhập
  static Future<bool> isLoggedIn() async {
    final token = await getToken();
    return token != null;
  }

  // Xóa token khi đăng xuất
  static Future<void> deleteToken() async {
    await _storage.delete(key: _keyToken);
  }

// 🔹 Lưu userId (dùng FlutterSecureStorage thay vì SharedPreferences)
  static Future<void> saveUserId(int userId) async {
    await _storage.write(key: _keyUserId, value: userId.toString());
  }

  // 🔹 Lấy userId
  static Future<int?> getUserId() async {
    String? userIdStr = await _storage.read(key: _keyUserId);
    return userIdStr != null ? int.tryParse(userIdStr) : null;
  }
}
