import 'dart:convert';
import 'package:health_care/services/local_storage_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.1.9:8080/api/v1';

  // Đăng nhập
  static Future<String?> login(String phoneNumber, String password) async {
    final url = Uri.parse('$baseUrl/auth/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'phoneNumber': phoneNumber, 'password': password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0 && data['data']['authenticated'] == true) {
        String token = data['data']['token'];
        await LocalStorageService.saveToken(token); // Lưu token
        return null; // Đăng nhập thành công
      } else {
        return data['message']; // Trả về lỗi từ server
      }
    } else {
      return "Lỗi máy chủ, vui lòng thử lại!";
    }
  }

  // Đăng ký tài khoản mới
  static Future<String?> register(
      String fullName, String phoneNumber, String password) async {
    final url = Uri.parse('$baseUrl/auth/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'password': password,
      }),
    );

    final data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      if (data['status'] == 0 && data['data']['authenticated'] == true) {
        String token = data['data']['token'];
        await LocalStorageService.saveToken(token); // Lưu token
        return null; // Đăng ký thành công
      } else {
        return data['message']; // Lỗi từ server
      }
    } else if (response.statusCode == 400) {
      return data['message'] ?? "Tài khoản đã tồn tại, vui lòng đăng nhập.";
    } else {
      return "Lỗi máy chủ, vui lòng thử lại!";
    }
  }

  // Đăng xuất
  static Future<String?> logout() async {
    final url = Uri.parse('$baseUrl/auth/logout');

    // Lấy token từ local storage
    String? token = await LocalStorageService.getToken();
    if (token == null) {
      return "Không tìm thấy token, vui lòng đăng nhập lại!";
    }

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'token': token}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0) {
        await LocalStorageService
            .deleteToken(); // Xóa token sau khi logout thành công
        return null; // Logout thành công
      } else {
        return data['message'];
      }
    } else {
      return "Lỗi máy chủ, vui lòng thử lại!";
    }
  }
  static Future<String?>getAllSpecialty() async{
    final url=Uri.parse('$baseUrl/specialty/get-all'); 
  }
}
