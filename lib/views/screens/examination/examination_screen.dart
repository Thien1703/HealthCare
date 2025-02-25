import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';
import 'package:health_care/models/clinic/examination.dart';
import 'package:health_care/views/widgets/widget_examination/widgetCardItem.dart';

class ExaminationScreen extends StatefulWidget {
  const ExaminationScreen({super.key});

  @override
  State<ExaminationScreen> createState() => _ExaminationScreenState();
}

class _ExaminationScreenState extends State<ExaminationScreen> {
  List<Examination> mockExaminatios = [
    Examination(
      maDatLich: '4F450TY',
      nameUser: 'Nguyễn Hữu Thiện',
      nameHospital: 'BỆNH VIỆN NHÂN DÂN GIA ĐỊNH',
      service: 'Khám Dịch Vụ Khu Vip(Tầng 2 - Phòng 201)',
      chuyenKhoa: 'Đông Y',
      time: '03/01/2025 (08:00 - 09:00)',
      address: 'Bệnh viện Nhân dân Gia Định',
      status: 1,
    ),
    Examination(
      maDatLich: '4F450TYA',
      nameUser: 'Nguyễn Hữu ThiệnA',
      nameHospital: 'BỆNH VIỆN NHÂN DÂN GIA ĐỊNHA',
      service: 'Khám Dịch Vụ Khu Vip(Tầng 2 - Phòng 201A)',
      chuyenKhoa: 'Đông YA',
      time: '03/01/2025 (08:00 - 09:00)',
      address: 'Bệnh viện Nhân dân Gia Định',
      status: 2,
    ),
    Examination(
      maDatLich: '4F450TYB',
      nameUser: 'Nguyễn Hữu ThiệnB',
      nameHospital: 'BỆNH VIỆN NHÂN DÂN GIA ĐỊNHB',
      service: 'Khám Dịch Vụ Khu Vip(Tầng 2 - Phòng 201B)',
      chuyenKhoa: 'Đông YB',
      time: '03/01/2025 (08:00 - 09:00)',
      address: 'Bệnh viện Nhân dân Gia Định',
      status: 3,
    ),
    Examination(
      maDatLich: '4F450TYC',
      nameUser: 'Nguyễn Hữu ThiệnC',
      nameHospital: 'BỆNH VIỆN NHÂN DÂN GIA ĐỊNHC',
      service: 'Khám Dịch Vụ Khu Vip(Tầng 2 - Phòng 201C)',
      chuyenKhoa: 'Đông YC',
      time: '03/01/2025 (08:00 - 09:00)',
      address: 'Bệnh viện Nhân dân Gia Định',
      status: 4,
    ),
  ];

  final List<String> _statuses = [
    'Đã thanh toán',
    'Chưa thanh toán',
    'Đã khám',
    'Đã hủy'
  ];
  String _selectedStatus = 'Đã thanh toán';

  @override
  Widget build(BuildContext context) {
    List<Examination> filterExamination = mockExaminatios.where((examination) {
      switch (_selectedStatus) {
        case 'Đã thanh toán':
          return examination.status == 1;
        case 'Chưa thanh toán':
          return examination.status == 2;
        case 'Đã khám':
          return examination.status == 3;
        case 'Đã hủy':
          return examination.status == 4;
        default:
          return false;
      }
    }).toList();
    return WidgetHeaderBody(
      iconBack: false,
      title: 'Danh sách phiếu khám',
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(vertical: 15),
            color: Colors.white,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _statuses
                    .map((status) => _customTitleThamKham(
                          title: status,
                          isSelected: _selectedStatus == status,
                          onTap: () {
                            setState(() {
                              _selectedStatus = status;
                            });
                          },
                        ))
                    .toList(),
              ),
            ),
          ),
          Expanded(
              child: filterExamination.isEmpty
                  ? Center(
                      child: Text(
                        'Không có phiếu khám nào',
                        style: TextStyle(fontSize: 16, color: AppColors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: filterExamination.length,
                      itemBuilder: (context, index) {
                        return WidgetCardItem(
                            examination: filterExamination[index]);
                      },
                    )),
        ],
      ),
    );
  }
}

Widget _customTitleThamKham({
  required String title,
  required VoidCallback onTap,
  required bool isSelected,
}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      margin: const EdgeInsets.only(left: 15, right: 5),
      padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        color: isSelected ? AppColors.accent : AppColors.grey5,
      ),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: isSelected ? Colors.white : AppColors.neutralGrey3,
        ),
        textAlign: TextAlign.center,
      ),
    ),
  );
}
