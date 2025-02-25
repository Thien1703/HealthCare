import 'package:health_care/models/clinic/clinic.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ClinicService {
  static const String apiUrl = "http://192.168.1.5:8080/api/v1/clinic/get-all";
  static const String token = "eyJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJraGFpLmRldiIsInN1YiI6IjA4MTc0NzY3NzgiLCJleHAiOjE3NDA1MzUxOTUsImlhdCI6MTc0MDQ5OTE5NSwianRpIjoiODY4OGE4OTAtZmRkYy00ZjRkLWEyNmQtOGI2YmMzODkwZjM2Iiwic2NvcGUiOiJST0xFX1VTRVIifQ.TCFumT95GU8BlNi1SyFgRyDRJ7lnr5M5un8kNbqqRO8"; // Thay bằng token hợp lệ của bạn

  // Phương thức lấy danh sách phòng khám
  Future<List<Clinic>> getClinics() async {
    final headers = {
      'Authorization': 'Bearer $token',  // Cung cấp token Bearer trong header
    };

    try {
      final response = await http.post(Uri.parse(apiUrl), headers: headers);

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
