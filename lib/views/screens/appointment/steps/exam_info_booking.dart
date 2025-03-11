import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/common/app_icons.dart';
import 'package:health_care/viewmodels/api/api_service.dart';
import 'package:health_care/views/widgets/appointment/widget_hospital_info_card.dart';
import 'package:health_care/views/widgets/widget_select_item.dart';
import 'package:health_care/views/widgets/appointment/widget_customButton.dart';
import 'package:health_care/views/widgets/bottomSheet/select_day_widget.dart';
import 'package:health_care/views/widgets/bottomSheet/select_time_widget.dart';
import 'package:health_care/models/clinic.dart';
import 'package:health_care/views/screens/cartService/serviceCart_screen.dart';
import 'package:health_care/models/service.dart';
import 'package:intl/intl.dart';

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
  Clinic? clinices;
  @override
  void initState() {
    super.initState();
    fetchClinics();
  }

  void fetchClinics() async {
    Clinic? data = await ApiService.getClinicById(widget.clinicId);
    if (data != null) {
      setState(() {
        clinices = data;
      });
    }
  }

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
                    nameHospital: clinices?.name ?? 'Đang tải',
                    addressHospital: clinices?.address ?? "Đang tải"),
                // SectionTitle(title: 'Chuyên khoa'),
                // SpecialtySelector(),
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

class ServiceSelector extends StatefulWidget {
  const ServiceSelector({super.key});

  @override
  State<ServiceSelector> createState() => _ServiceSelectorState();
}

class _ServiceSelectorState extends State<ServiceSelector> {
  List<Service> selectedServices = []; // Lưu danh sách dịch vụ đã chọn

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SelectItemWidget(
          image: AppIcons.service2,
          text: selectedServices.isEmpty
              ? 'Chọn dịch vụ'
              : 'Đã chọn ${selectedServices.length} dịch vụ',
          onTap: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ServicecartScreen()),
            );

            if (result != null && result is List<Service>) {
              setState(() {
                selectedServices = result; // Cập nhật danh sách dịch vụ đã chọn
              });
            }
          },
        ),

        // Hiển thị danh sách dịch vụ đã chọn
        if (selectedServices.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...selectedServices.map((service) => Text(
                      "- ${service.name}",
                      style: TextStyle(fontSize: 14, color: Colors.black),
                    )),
              ],
            ),
          ),
      ],
    );
  }
}

class DateSelector extends StatefulWidget {
  const DateSelector({super.key});

  @override
  State<DateSelector> createState() => _DateSelectorState();
}

class _DateSelectorState extends State<DateSelector> {
  DateTime? _selectedDate; // Lưu ngày đã chọn

  // Hàm hiển thị bottom sheet chọn ngày
  void _showDatePicker(BuildContext context) async {
    final DateTime? pickedDate = await showModalBottomSheet<DateTime>(
      context: context,
      builder: (context) => SelectDayWidget(),
    );

    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SelectItemWidget(
      image: AppIcons.calendar,
      text: _selectedDate != null
          ? DateFormat('dd/MM/yyyy')
              .format(_selectedDate!) // Hiển thị ngày đã chọn
          : 'Chọn ngày khám', // Mặc định
      onTap: () => _showDatePicker(context),
    );
  }
}

class TimeSelector extends StatefulWidget {
  const TimeSelector({super.key});

  @override
  State<TimeSelector> createState() => _TimeSelectorState();
}

class _TimeSelectorState extends State<TimeSelector> {
  String selectedTime = 'Chọn giờ khám';

  void updateSelectedTime(String time) {
    setState(() {
      selectedTime = time;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: SelectItemWidget(
        image: AppIcons.clock,
        text: selectedTime,
        bottomSheet: SelectTimeWidget(onTimeSelected: updateSelectedTime),
      ),
    );
  }
}
