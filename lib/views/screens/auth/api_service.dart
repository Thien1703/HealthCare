import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  static const String baseUrl = "http://10.0.2.2:8080/api/v1"; // Nếu chạy trên máy thật, đổi IP backend

  // Hàm đăng nhập
  static Future<String?> login(String phoneNumber, String password) async {
    final url = Uri.parse('$baseUrl/auth/login'); // Kiểm tra API login có đúng không

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"phoneNumber": phoneNumber, "password": password}),
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      String token = data['token']; // Lấy JWT Token

      // Lưu token vào bộ nhớ để sử dụng sau này
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token);

      print("Đăng nhập thành công! Token: $token");
      return null; // Trả về null nếu đăng nhập thành công
    } else {
      final errorData = jsonDecode(response.body);
      String errorMessage = errorData['message'] ?? "Sai số điện thoại hoặc mật khẩu";
      return errorMessage; // Trả về lỗi
    }
  }

  // Hàm đăng ký
  static Future<String?> register(String phoneNumber, String password) async {
    final url = Uri.parse('$baseUrl/auth/register');

    final response = await http.post(
      url,
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({"phoneNumber": phoneNumber, "password": password}),
    );

    if (response.statusCode == 201) {
      return null; // Đăng ký thành công
    } else {
      final errorData = jsonDecode(response.body);
      return errorData['message'] ?? "Lỗi đăng ký"; // Trả về lỗi nếu có
    }
  }
}
