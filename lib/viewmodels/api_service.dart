import 'dart:convert';
import 'package:health_care/services/local_storage_service.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = 'http://192.168.3.100:8080/api/v1/auth';
  static const String updateUrl = 'http://192.168.3.100:8080/api/v1/user';
  // Đăng nhập
  static Future<String?> login(String phoneNumber, String password) async {
    final url = Uri.parse('$baseUrl/login');
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
    final url = Uri.parse('$baseUrl/register');
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

  // Cập nhật hồ sơ
  // static Future<String?> updateProfile(Map<String, dynamic> profileData) async {
  //   final url = Uri.parse('$updateUrl/update-profile');
  //   String? token = await LocalStorageService.getToken();
  //   print("🔹 Token: $token");
  //   print("🔹 Dữ liệu gửi lên: ${jsonEncode(profileData)}");
  //   final response = await http.post(
  //     url,
  //     headers: {
  //       'Content-Type': 'application/json',
  //       'Authorization': 'Bearer $token'
  //     },
  //     body: jsonEncode(profileData),
  //   );
  //   print("🔹 Phản hồi từ server: ${response.body}");
  //   if (response.statusCode == 200) {
  //     final data = jsonDecode(response.body);
  //     if (data['status'] == 0) {
  //       return null; // Cập nhật thành công
  //     } else {
  //       return data['message']; // Trả về lỗi từ server
  //     }
  //   } else {
  //     return "Lỗi máy chủ, vui lòng thử lại!";
  //   }
  // }

  // Lấy thông tin hồ sơ người dùng
  static Future<int?> getMyUserId() async {
    final url = Uri.parse('$updateUrl/get-my-info');
    String? token = await LocalStorageService.getToken();

    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['status'] == 0) {
        int userId = data['data']['id'];
        return userId;
      } else {
        return null;
      }
    } else {
      return null;
    }
  }

  static Future<String?> updateProfile(Map<String, dynamic> profileData) async {
    final url = Uri.parse('$updateUrl/update-profile');
    String? token = await LocalStorageService.getToken();
    int? userId =
        await LocalStorageService.getUserId(); // 🔹 Lấy userId từ local storage

    // 🔹 Kiểm tra nếu chưa có userId, lấy từ API
    if (userId == null) {
      userId = await getMyUserId();
      if (userId != null) {
        await LocalStorageService.saveUserId(userId); // Lưu lại userId
      }
    }

    // 🔹 Nếu vẫn không có ID, báo lỗi
    if (userId == null) {
      return "Lỗi: Không thể xác định ID người dùng.";
    }

    // 🔹 Đảm bảo `profileData` có chứa `id`
    profileData['id'] = userId;

    print("📌 Gửi dữ liệu cập nhật: ${jsonEncode(profileData)}");

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(profileData),
      );

      print("📌 Phản hồi từ server: ${response.statusCode} - ${response.body}");

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        if (data['status'] == 0) {
          return null; // ✅ Cập nhật thành công
        } else {
          return data['message'] ?? "Lỗi không xác định từ server.";
        }
      } else {
        return "Lỗi máy chủ: ${response.body}";
      }
    } catch (e) {
      print("❌ Lỗi khi gọi API: $e");
      return "Lỗi kết nối, vui lòng thử lại!";
    }
  }

  // Đăng xuất
  static Future<String?> logout() async {
    final url = Uri.parse('$baseUrl/logout');

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
}
