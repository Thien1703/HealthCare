import 'package:flutter/material.dart';
import 'package:health_care/models/clinic/clinic.dart';
import 'package:health_care/views/screens/clinic/clinic_card.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';
import 'package:health_care/viewmodels/clinic_viewmodel.dart';
import 'package:provider/provider.dart';

class ClinicScreen extends StatefulWidget {
  const ClinicScreen({super.key});

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Lấy danh sách phòng khám khi màn hình được mở
    Future.delayed(Duration.zero, () {
      Provider.of<ClinicViewModel>(context, listen: false).fetchClinics();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Lấy thông tin từ ClinicViewModel
    final clinicViewModel = Provider.of<ClinicViewModel>(context);
    final clinics = clinicViewModel.clinics;
    final isLoading = clinicViewModel.isLoading;
    final errorMessage = clinicViewModel.errorMessage;

    // Lọc danh sách phòng khám dựa trên từ khóa tìm kiếm
    List<Clinic> filteredClinics = clinics.where((clinic) {
      return clinic.name.toLowerCase().contains(_searchController.text.toLowerCase());
    }).toList();

    return WidgetHeaderBody(
      iconBack: false,
      title: "Chọn cơ sở y tế",
      body: Column(
        children: [
          // Thanh tìm kiếm
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Tìm cơ sở y tế',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {}); // Cập nhật UI khi tìm kiếm thay đổi
              },
            ),
          ),
          
          // Nếu đang tải, hiển thị Loading Spinner
          if (isLoading)
            const Center(child: CircularProgressIndicator()),

          // Nếu có lỗi
          if (errorMessage.isNotEmpty)
            Center(child: Text(errorMessage)),

          // Danh sách các phòng khám
          Expanded(
            child: filteredClinics.isEmpty
                ? const Center(
                    child: Text('Không tìm thấy cơ sở y tế phù hợp.'))
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 15),
                    itemCount: filteredClinics.length,
                    itemBuilder: (context, index) {
                      final clinic = filteredClinics[index];
                      return ClinicCard(clinic: clinic);
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
