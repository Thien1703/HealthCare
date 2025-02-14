import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/screens/examination/paidDetail_screen.dart';

class WidgetCardItem extends StatelessWidget {
  final int states;

  const WidgetCardItem({super.key, required this.states});

  String _getStatusText(int states) {
    switch (states) {
      case 1:
        return 'Đã thanh toán';
      case 2:
        return 'Chưa thanh toán';
      case 3:
        return 'Đã khám';
      case 4:
        return 'Đã hủy';
      default:
        return 'Không xác định';
    }
  }

  Color _getStatusColor(int states) {
    switch (states) {
      case 1:
        return AppColors.accent;
      case 2:
        return Colors.red;
      case 3:
        return Colors.blue;
      case 4:
        return Colors.red;
      default:
        return AppColors.accent;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.grey4, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Mã đặt lịch:',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.neutralGrey3)),
                      SizedBox(width: 20),
                      Text('4F450TY',
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.neutralDarkGreen1,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Text('NGUYỄN HỮU THIỆN',
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.neutralDarkGreen1,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              InkWell(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PaidDetailScreen())),
                child: Row(
                  children: [
                    Text('Xem chi tiết',
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.accent)),
                    Icon(
                      Icons.keyboard_arrow_right_outlined,
                      color: AppColors.accent,
                    )
                  ],
                ),
              )
            ],
          ),
          _customDashedLine(),
          Text('BỆNH VIỆN NHÂN DÂN GIA ĐỊNH',
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.accent)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textLabel(label: 'Dịch vụ'),
              SizedBox(width: 50),
              Expanded(
                child: Text('Khám Dịch Vụ Khu Vip(Tầng 2 - Phòng 201)',
                    textAlign: TextAlign.right,
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.neutralDarkGreen2)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Chuyên khoa:',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutralGrey2)),
              Text('Đông Y)',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutralDarkGreen2)),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Trạng thái:',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutralGrey2)),
              Text(_getStatusText(states),
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: _getStatusColor(states)))
            ],
          ),
        ],
      ),
    );
  }
}

Widget _customDashedLine() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: List.generate(23, (index) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        width: 7,
        height: 1.5,
        color: AppColors.grey4,
      );
    }),
  );
}

Widget _textLabel({required String label}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Text(label,
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.neutralGrey2)),
  );
}
