import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';

class WidgetCarditem extends StatelessWidget {
  const WidgetCarditem({super.key});
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
                children: [
                  Row(
                    children: [
                      Text('Mã đặt lịch:',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.neutralGrey3)),
                      Text('4F450TY',
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.neutralDarkGreen1,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Text('NGUYỄN HỮU THIỆN',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.neutralDarkGreen1,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              Text('Xem chi tiết',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AppColors.accent)),
            ],
          ),
          Text('BỆNH VIỆN NHÂN DÂN GIA ĐỊNH',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: AppColors.accent)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Dịch vụ:',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutralGrey2)),
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
              Text('Đã thanh toán',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.accent)),
            ],
          ),
        ],
      ),
    );
  }
}
