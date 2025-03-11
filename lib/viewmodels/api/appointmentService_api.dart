import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:health_care/viewmodels/api/api_service.dart';
import 'package:health_care/services/local_storage_service.dart';
import 'package:health_care/models/appointment/appointment_service.dart';

class AppointmentserviceApi {
  static Future<List<AppointmentService>?> getAllAppointmentService() async {
    final url = Uri.parse('${ApiService.baseUrl}/appointment-service/get-all');
    String? token = await LocalStorageService.getToken();

    if (token == null) {
      print("Lỗi: Không tìm thấy token!");
      return null;
    }

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      print('Status code get-all-appointment-service: ${response.statusCode}');
      print('Response get-all-appointment-service: ${response.body}');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);

        // Kiểm tra nếu 'data' tồn tại và là danh sách hợp lệ
        if (data.containsKey('data') && data['data'] != null) {
          if (data['data'] is List) {
            return (data['data'] as List)
                .map((item) => AppointmentService.fromJson(item))
                .toList();
          } else {
            print("Lỗi API: 'data' không phải là danh sách!");
          }
        } else {
          print("Lỗi API: Không có dữ liệu hợp lệ.");
        }
      } else {
        print("Lỗi API: Status ${response.statusCode}, Body: ${response.body}");
      }
    } catch (e) {
      print("Lỗi ngoại lệ khi gọi API: $e");
    }

    return [];
  }
}
