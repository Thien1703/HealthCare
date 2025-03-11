import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:health_care/viewmodels/api/api_service.dart';
import 'package:health_care/models/appointment/appointment.dart';
import 'package:health_care/services/local_storage_service.dart';
import 'package:health_care/models/appointment/appointment_service.dart';

class AppointmentApi {
  static Future<List<Appointment>?> getAllAppointment() async {
    final url = Uri.parse('${ApiService.baseUrl}/appointment/get-all');
    String? token = await LocalStorageService.getToken();
    if (token == null) {
      return null;
    }
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    print('Giá trị status apptoinment: ${response.statusCode}');
    print('Giá trị api apptoinment: ${response.body}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['data'] is List) {
        List<Appointment> apptoinments = (data['data'] as List)
            .map((item) => Appointment.fromJson(item))
            .toList();
        return apptoinments;
      } else {
        print('Lỗi Api:${data['message']}');
      }
    } else {
      print('Api Lỗi: ${response.statusCode}');
    }
    return null;
  }

  static Future<Appointment?> getAppointmentById(int appointmentId) async {
    final url = Uri.parse('${ApiService.baseUrl}/appointment/get-by-id');
    String? token = await LocalStorageService.getToken();
    if (token == null) {
      return null;
    }
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
      body: jsonEncode({
        'id': appointmentId,
      }),
    );
    print('Giá trị status apptoinment: ${response.statusCode}');
    print('Giá trị api apptoinment: ${response.body}');
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      if (data['data'] != null && data['data'] is Map) {
        return Appointment.fromJson(data['data']);
      } else {
        print('Lỗi Api:${data['message']}');
      }
    } else {
      print('Api Lỗi: ${response.statusCode}');
    }
    return null;
  }
}
