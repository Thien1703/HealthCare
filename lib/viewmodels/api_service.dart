import 'dart:convert';
import 'package:health_care/services/local_storage_service.dart';
import 'package:http/http.dart' as http;
import 'package:health_care/models/clinic/clinic.dart';

class ApiService {
  static const String baseUrl = 'http://192.168.1.5:8080/api/v1'; // Cập nhật baseUrl cho dịch vụ phòng khám

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
  static Future<String?> register(String fullName, String phoneNumber, String password) async {
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
        await LocalStorageService.deleteToken(); // Xóa token sau khi logout thành công
        return null; // Logout thành công
      } else {
        return data['message'];
      }
    } else {
      return "Lỗi máy chủ, vui lòng thử lại!";
    }
  }

  // Phương thức lấy danh sách phòng khám
  static Future<List<Clinic>> getClinics() async {
    final url = Uri.parse('$baseUrl/clinic/get-all'); // Cập nhật lại URL cho phòng khám
    try {
      // Lấy token từ storage
      final token = await LocalStorageService.getToken();

      if (token == null) {
        throw Exception('Token không hợp lệ');
      }

      
      final headers = {
        'Authorization': 'Bearer $token',
      };

      final response = await http.post(url, headers: headers);

      if (response.statusCode == 200) {
        String decodedBody = utf8.decode(response.bodyBytes);
        final data = jsonDecode(decodedBody);

        // Chuyển đổi dữ liệu thành danh sách phòng khám
        List<Clinic> clinics = (data['data'] as List)
            .map((clinicData) => Clinic.fromJson(clinicData))
            .toList();
        return clinics;
      } else {
        throw Exception('Không thể tải phòng khám, mã lỗi: ${response.statusCode}');
      }
    } catch (e) {
      print("Lỗi khi lấy dữ liệu: $e");
      throw Exception('Lỗi khi lấy dữ liệu: $e');
    }
  }
}
