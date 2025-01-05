import 'package:flutter/material.dart';
import 'package:health_care/models/clinic/clinic.dart';
import 'package:health_care/views/screens/clinic/clinic_card.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';

class ClinicScreen extends StatelessWidget {
  const ClinicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetHeaderBody(
      title: "Chọn cơ sở y tế",
      body: const BodyClinic(),
    );
  }
}

class BodyClinic extends StatelessWidget {
  const BodyClinic({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      itemCount: clinics.length,
      itemBuilder: (context, index) {
        final clinic = clinics[index];
        return ClinicCard(clinic: clinic);
      },
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
    description: "Phòng khám chuyên cung cấp dịch vụ y tế đa khoa với đội ngũ bác sĩ giàu kinh nghiệm.",
    specialties: ["Nội tổng quát", "Nhi khoa", "Phụ sản"],
    notableDoctors: ["BS. Nguyễn Văn A", "BS. Trần Thị B"],
    facilities: "Phòng chờ tiện nghi, thiết bị hiện đại, phòng xét nghiệm đạt chuẩn.",
  ),
  Clinic(
    id: 2,
    name: "Phòng Khám Sức Khỏe Gia Đình",
    address: "456 Đường Nguyễn Trãi, Quận 5, TP.HCM",
    rating: 4.8,
    reviewCount: 200,
    image: "assets/images/benhvien.jpg",
    type: "Phòng khám chuyên khoa",
    description: "Phòng khám cung cấp dịch vụ tư vấn sức khỏe cho cả gia đình với sự tận tâm.",
    specialties: ["Nhi khoa", "Lão khoa", "Sức khỏe gia đình"],
    notableDoctors: ["BS. Lê Thị C", "BS. Phạm Văn D"],
    facilities: "Hệ thống quản lý hồ sơ sức khỏe điện tử, khu vực đón tiếp thân thiện.",
  ),
  Clinic(
    id: 3,
    name: "Phòng Khám Nhi Đồng Việt",
    address: "789 Đường Trần Hưng Đạo, Quận 1, TP.HCM",
    rating: 4.2,
    reviewCount: 80,
    image: "assets/images/benhvien.jpg",
    type: "Phòng khám nhi",
    description: "Nơi chăm sóc sức khỏe tốt nhất cho trẻ nhỏ với các bác sĩ chuyên khoa nhi hàng đầu.",
    specialties: ["Nhi khoa", "Dinh dưỡng", "Hô hấp"],
    notableDoctors: ["BS. Nguyễn Văn E", "BS. Trần Thị F"],
    facilities: "Khu vực chơi dành cho trẻ em, máy móc y tế hiện đại phù hợp trẻ nhỏ.",
  ),
];
