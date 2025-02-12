import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';
import 'package:health_care/views/screens/examination/paid_screen.dart';
import 'package:health_care/views/screens/examination/unpaid_screen.dart';
import 'package:health_care/views/screens/examination/completed_screen.dart';
import 'package:health_care/views/screens/examination/cancel_screen.dart';

class ExaminationScreen extends StatefulWidget {
  const ExaminationScreen({super.key});

  @override
  State<ExaminationScreen> createState() => _ExaminationScreenState();
}

class _ExaminationScreenState extends State<ExaminationScreen> {
  final List<String> _statuses = [
    'Đã thanh toán',
    'Chưa thanh toán',
    'Đã khám',
    'Đã hủy'
  ];
  String _selectedStatus = 'Đã thanh toán';

  Widget _getScreen(String status) {
    switch (status) {
      case 'Đã thanh toán':
        return PaidScreen();
      case 'Chưa thanh toán':
        return UnPaidScreen();
      case 'Đã khám':
        return CompletedScreen();
      case 'Đã hủy':
        return CancelScreen();
      default:
        return PaidScreen();
    }
  }

  @override
  Widget build(BuildContext context) {
    return WidgetHeaderBody(
      title: 'Thông tin phiếu khám',
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
            child: Container(
              color: AppColors.grey,
              width: double.infinity,
              child: ListView(
                // padding: EdgeInsets.zero,
                children: [_getScreen(_selectedStatus)],
              ),
            ),
          ),
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
