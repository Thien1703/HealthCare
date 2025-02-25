import 'package:health_care/models/clinic/clinic.dart';
import 'package:health_care/services/clinic_service.dart';
import 'package:flutter/material.dart';

class ClinicViewModel extends ChangeNotifier {
  bool isLoading = false;
  List<Clinic> clinics = [];
  String errorMessage = '';
  String searchQuery = '';
  String selectedType = 'Tất cả'; // Lọc theo loại phòng khám

  // Lấy danh sách phòng khám
  Future<void> fetchClinics() async {
    isLoading = true;
    errorMessage = '';
    notifyListeners();  // Cập nhật trạng thái

    try {
      clinics = await ClinicService().getClinics(); // Lấy dữ liệu từ API
    } catch (e) {
      errorMessage = 'Không thể tải phòng khám. Vui lòng thử lại sau.';
      print("Error: $e");
    } finally {
      isLoading = false;
      notifyListeners();  // Cập nhật lại UI khi dữ liệu đã hoàn tất
    }
  }

  // Lọc danh sách phòng khám theo từ khóa tìm kiếm 
  List<Clinic> get filteredClinics {
    return clinics.where((clinic) {
   
      final matchesSearch = clinic.name.toLowerCase().contains(searchQuery.toLowerCase());
      return  matchesSearch;
    }).toList();
  }

  // Cập nhật từ khóa tìm kiếm
  void updateSearchQuery(String query) {
    searchQuery = query;
    notifyListeners();
  }

  
  void updateSelectedType(String type) {
    selectedType = type;
    notifyListeners();
  }
}
