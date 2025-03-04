import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/common/app_icons.dart';
import 'package:health_care/views/widgets/appointment/widget_hospital_info_card.dart';
import 'package:health_care/views/widgets/widget_select_item.dart';
import 'package:health_care/views/widgets/appointment/widget_customButton.dart';
import 'package:health_care/views/widgets/bottomSheet/select_day_widget.dart';
import 'package:health_care/views/widgets/bottomSheet/select_time_widget.dart';
import 'package:health_care/views/screens/appointment/detail/service_screen.dart';

class ExamInfoBooking extends StatefulWidget {
  const ExamInfoBooking({
    super.key,
    required this.onNavigateToScreen,
    required this.clinicId,
  });
  final Function(int, String) onNavigateToScreen;
  final int clinicId;

  @override
  State<ExamInfoBooking> createState() => _ExamInfoBooking();
}

class _ExamInfoBooking extends State<ExamInfoBooking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
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
                SectionTitle(title: 'Chuyên khoa'),
                SpecialtySelector(),
                SectionTitle(title: 'Dịch vụ'),
                ServiceSelector(),
                SectionTitle(title: 'Ngày khám'),
                DateSelector(),
                SectionTitle(title: 'Giờ khám'),
                TimeSelector(),
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

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
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
}

class SpecialtySelector extends StatelessWidget {
  const SpecialtySelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectItemWidget(
      image: AppIcons.specialty,
      text: 'Chọn chuyên khoa',
      // onTap: () => Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => SpecialtyScreen()),
      // ),
    );
  }
}

class ServiceSelector extends StatelessWidget {
  const ServiceSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return SelectItemWidget(
      image: AppIcons.service2,
      text: 'Chọn dịch vụ',
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Service())),
    );
  }
}

class DateSelector extends StatelessWidget {
  const DateSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectItemWidget(
      image: AppIcons.calendar,
      text: 'Chọn ngày khám',
      bottomSheet: SelectDayWidget(),
    );
  }
}

class TimeSelector extends StatelessWidget {
  const TimeSelector({super.key});

  @override
  Widget build(BuildContext context) {
    return const SelectItemWidget(
      image: AppIcons.clock,
      text: 'Chọn giờ khám',
      bottomSheet: SelectTimeWidget(),
    );
  }
}
