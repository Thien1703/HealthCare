// import 'package:flutter/material.dart';
// import 'package:health_care/models/clinic/clinic.dart';  
// import 'package:health_care/services/clinic_service.dart';  

// class ClinicViewModel extends ChangeNotifier {
//   bool isLoading = false;
//   List<Clinic> clinics = [];
//   String errorMessage = '';
//   String searchQuery = '';

  
//   Future<void> fetchClinics() async {
//     isLoading = true;
//     errorMessage = '';
//     notifyListeners();  

//     try {
//       clinics = await ClinicService().getClinics();  
//     } catch (e) {
//       errorMessage = 'Không thể tải phòng khám. Vui lòng thử lại sau.';
//       print("Error: $e");
//     } finally {
//       isLoading = false;
//       notifyListeners();  
//     }
//   }

  
//   List<Clinic> get filteredClinics {
//     if (searchQuery.isEmpty) {
//       return clinics;  
//     }

//     return clinics.where((clinic) {
//       final query = searchQuery.toLowerCase();

     
//       final matchesName = clinic.name.toLowerCase().contains(query);
//       final matchesAddress = clinic.address.toLowerCase().contains(query);
//       final matchesDescription = clinic.description.toLowerCase().contains(query);

//       return matchesName || matchesAddress || matchesDescription;  
//     }).toList();
//   }

  
//   void updateSearchQuery(String query) {
//     searchQuery = query;
//     notifyListeners(); 
//   }
// }
