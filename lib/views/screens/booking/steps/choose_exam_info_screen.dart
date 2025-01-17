import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/common/app_icons.dart';
import 'package:health_care/views/widgets/widget_hospital_info_card.dart';
import 'package:health_care/views/widgets/widget_select_item.dart';
import 'package:health_care/views/widgets/widget_customButton.dart';
import 'package:health_care/views/widgets/bottomSheet/select_specialty_widget.dart';
import 'package:health_care/views/widgets/bottomSheet/select_service_widget.dart';

class ChooseExamInfoScreen extends StatefulWidget {
  const ChooseExamInfoScreen({
    super.key,
    required this.onNavigateToScreen,
  });
  final Function(int, String) onNavigateToScreen;
  @override
  State<ChooseExamInfoScreen> createState() {
    return _ChooseExamInfoScreen();
  }
}

class _ChooseExamInfoScreen extends State<ChooseExamInfoScreen> {
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
                HospitalInfoWidget(
                  nameHospital: 'Bệnh viện Nhân Dân Gia Định',
                  addressHospital:
                      'Số 1 Nơ Trang Long, phường 7, Quận Bình Thạnh, TP.HCM',
                ),
                _customeTitle(title: 'Chuyên khoa'),
                SelectItemWidget(
                  image: AppIcons.specialty,
                  text: 'Chọn chuyên khoa',
                  bottomSheet: SpecialtySelection(),
                ),
                _customeTitle(title: 'Dịch vụ'),
                SelectItemWidget(
                  image: AppIcons.service2,
                  text: 'Chọn dịch vụ',
                  bottomSheet: ServiceSelection(),
                ),
                _customeTitle(title: 'Ngày khám'),
                SelectItemWidget(
                  image: AppIcons.calendar,
                  text: 'Chọn ngày khám',
                ),
                _customeTitle(title: 'Giờ khám'),
                SelectItemWidget(
                  image: AppIcons.clock,
                  text: 'Chọn giờ khám',
                ),
              ],
            ),
          ),
          WidgetCustombutton(
              onTap: () {
                widget.onNavigateToScreen(1, 'Chọn hồ sơ');
              },
              text: 'Tiếp tục')
        ],
      ),
    );
  }
}

Widget _customeTitle({required String title}) {
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
