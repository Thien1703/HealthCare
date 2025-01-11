import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/common/app_icons.dart';
import 'package:health_care/views/widgets/widget_customBorder.dart';
import 'package:health_care/views/widgets/widget_customeSelect.dart';
import 'package:health_care/views/widgets/widget_customButton.dart';

class SelectInfoScreen extends StatefulWidget {
  const SelectInfoScreen({super.key});
  @override
  State<SelectInfoScreen> createState() {
    return _SelectInfoScreen();
  }
}

class _SelectInfoScreen extends State<SelectInfoScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
              child: ListView(
            children: [
              SizedBox(height: 40),
              WidgetCustomborder(
                nameHospital: 'Bệnh viện Nhân Dân Gia Định',
                addressHospital:
                    'Số 1 Nơ Trang Long, phường 7, Quận Bình Thạnh, TP.HCM',
              ),
              customeTitle(title: 'Chuyên khoa'),
              WidgetCustomeselect(
                image: AppIcons.specialty,
                text: 'Chọn chuyên khoa',
              ),
              customeTitle(title: 'Dịch vụ'),
              WidgetCustomeselect(
                image: AppIcons.service2,
                text: 'Chọn dịch vụ',
              ),
              customeTitle(title: 'Ngày khám'),
              WidgetCustomeselect(
                image: AppIcons.calendar,
                text: 'Chọn ngày khám',
              ),
              customeTitle(title: 'Giờ khám'),
              WidgetCustomeselect(
                image: AppIcons.clock,
                text: 'Chọn giờ khám',
              ),
            ],
          )),
          WidgetCustombutton(onTap: () {}, text: 'Tiếp tục')
        ],
      ),
    );
  }
}

Widget customeTitle({required String title}) {
  return Padding(
    padding: EdgeInsets.only(top: 10),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.bold,
        color: AppColors.neutralDarkGreen1,
      ),
    ),
  );
}
