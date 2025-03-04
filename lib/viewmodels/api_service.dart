import 'dart:convert';
import 'package:health_care/services/local_storage_service.dart';
import 'package:health_care/models/specialty.dart';
import 'package:health_care/models/clinic.dart';
import 'package:health_care/models/service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.1.12:8080';

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

  static Future<List<Specialty>?> getAllSpecialty() async {
    final url = Uri.parse('$baseUrl/specialty/get-all');

    // Lấy và kiểm tra token
    String? token = await LocalStorageService.getToken();
    if (token == null) {
      return null;
    }
    // Gửi giá trị token lên server đợi phản hồi
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );

    print('Giá trị status của API: ${response.statusCode}');
    print('Giá trị API trả về body: ${response.body}');

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0) {
        List<Specialty> specialties = (data['data'] as List)
            .map((item) => Specialty.fromJson(item))
            .toList();
        return specialties;
      } else {
        print(' Lỗi từ API: ${data['message']}');
      }
    } else {
      print(' API lỗi: ${response.statusCode}');
    }

    return null;
  }

  static Future<List<Clinic>> getAllClinic() async {
    final url = Uri.parse('${baseUrl}/clinic/get-all');
    String? token = await LocalStorageService.getToken();
    if (token == null) {
      return [];
    }
    final response = await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    print('Giá trị status của API: ${response.statusCode}');
    print('Giá trị API trả về body: ${response.body}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0) {
        List<Clinic> clinices = (data['data'] as List)
            .map((item) => Clinic.fromJson(item))
            .toList();
        return clinices;
      } else {
        print(' Lỗi từ API: ${data['message']}');
      }
    } else {
      print(' API lỗi: ${response.statusCode}');
    }
    return [];
  }

  static Future<List<Service>> getAllServeById(int specialtyId) async {
    final url = Uri.parse('$baseUrl/service/get-by-specialty');
    String? token = await LocalStorageService.getToken();
    if (token == null) {
      return [];
    }
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        "specialtyId": specialtyId,
      }),
    );
    print('Giá trị status của API: ${response.statusCode}');
    print('Giá trị API trả về body: ${response.body}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0) {
        List<Service> services = (data['data'] as List)
            .map((item) => Service.fromJson(item))
            .toList();
        return services;
      } else {
        print(' Lỗi từ API: ${data['message']}');
      }
    } else {
      print(' API lỗi: ${response.statusCode}');
    }
    return [];
  }
}
