import 'package:flutter/material.dart';
import 'package:health_care/models/clinic/clinic.dart';
import 'package:health_care/views/screens/clinic/clinic_card.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';

class ClinicScreen extends StatefulWidget {
  const ClinicScreen({super.key});

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedType = 'Tất cả'; // Default: Show all

  // Lọc danh sách dựa trên từ khóa tìm kiếm và loại phòng khám
  List<Clinic> get filteredClinics {
    return clinics.where((clinic) {
      final matchesType =
          _selectedType == 'Tất cả' || clinic.type == _selectedType;
      final matchesSearch =
          clinic.name.toLowerCase().contains(_searchQuery.toLowerCase());
      return matchesType && matchesSearch;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return WidgetHeaderBody(
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
                setState(() {
                  _searchQuery = value; // Cập nhật từ khóa tìm kiếm
                });
              },
            ),
          ),
          // Thanh lọc loại phòng khám
          _buildFilterRow(),
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

  // Widget tạo thanh lọc
  Widget _buildFilterRow() {
    final List<String> types = [
      'Tất cả',
      'Phòng khám đa khoa',
      'Phòng khám chuyên khoa',
      'Phòng khám nhi'
    ];
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: types.map((type) {
          final isSelected = _selectedType == type;
          return Padding(
            padding: const EdgeInsets.only(right: 10),
            child: ChoiceChip(
              label: Text(type),
              selected: isSelected,
              onSelected: (selected) {
                setState(() {
                  _selectedType = type; // Cập nhật loại phòng khám
                });
              },
              selectedColor: Colors.green,
              backgroundColor: Colors.grey.shade200,
              labelStyle: TextStyle(
                color: isSelected ? Colors.white : Colors.black,
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

final List<Clinic> clinics = [
  Clinic(
    id: 1,
    name: "Phòng Khám Đa Khoa Bình An",
    address: "123 Đường Lý Thái Tổ, Quận 10, TP.HCM",
    rating: 4.5,
    reviewCount: 120,
    image: "assets/images/benhvien.jpg",
    type: "Phòng khám đa khoa",
    description:
        "Phòng khám chuyên cung cấp dịch vụ y tế đa khoa với đội ngũ bác sĩ giàu kinh nghiệm.",
    specialties: ["Nội tổng quát", "Nhi khoa", "Phụ sản"],
    notableDoctors: ["BS. Nguyễn Văn A", "BS. Trần Thị B"],
    facilities:
        "Phòng chờ tiện nghi, thiết bị hiện đại, phòng xét nghiệm đạt chuẩn.",
  ),
  Clinic(
    id: 2,
    name: "Phòng Khám Sức Khỏe Gia Đình",
    address: "456 Đường Nguyễn Trãi, Quận 5, TP.HCM",
    rating: 4.8,
    reviewCount: 200,
    image: "assets/images/benhvien.jpg",
    type: "Phòng khám chuyên khoa",
    description:
        "Phòng khám cung cấp dịch vụ tư vấn sức khỏe cho cả gia đình với sự tận tâm.",
    specialties: ["Nhi khoa", "Lão khoa", "Sức khỏe gia đình"],
    notableDoctors: ["BS. Lê Thị C", "BS. Phạm Văn D"],
    facilities:
        "Hệ thống quản lý hồ sơ sức khỏe điện tử, khu vực đón tiếp thân thiện.",
  ),
  Clinic(
    id: 3,
    name: "Phòng Khám Nhi Đồng Việt",
    address: "789 Đường Trần Hưng Đạo, Quận 1, TP.HCM",
    rating: 4.2,
    reviewCount: 80,
    image: "assets/images/benhvien.jpg",
    type: "Phòng khám nhi",
    description:
        "Nơi chăm sóc sức khỏe tốt nhất cho trẻ nhỏ với các bác sĩ chuyên khoa nhi hàng đầu.",
    specialties: ["Nhi khoa", "Dinh dưỡng", "Hô hấp"],
    notableDoctors: ["BS. Nguyễn Văn E", "BS. Trần Thị F"],
    facilities:
        "Khu vực chơi dành cho trẻ em, máy móc y tế hiện đại phù hợp trẻ nhỏ.",
  ),
];
