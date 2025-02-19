import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/common/app_icons.dart';
import 'package:health_care/views/widgets/bottomSheet/header_bottomSheet.dart';
import 'package:table_calendar/table_calendar.dart';

class SelectDayWidget extends StatefulWidget {
  const SelectDayWidget({super.key});
  @override
  State<SelectDayWidget> createState() => _SelectDayWidget();
}

class _SelectDayWidget extends State<SelectDayWidget> {
  late DateTime _selectedDay;
  late DateTime _focusedDay;
  @override
  void initState() {
    super.initState();
    _selectedDay = DateTime.now(); // Mặc định chọn ngày hiện tại
    _focusedDay = DateTime.now(); // Mặc định tập trung vào ngày hiện tại
  }

  @override
  Widget build(BuildContext context) {
    return HeaderBottomSheet(
      title: 'Chọn ngày khám',
      body: ListView(
           children: [
          Container(
            decoration: BoxDecoration(
                color: AppColors.blue30,
                borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Row(
              children: [
                Image.asset(
                  AppIcons.notiBlue,
                ),
                SizedBox(width: 10),
                Expanded(
                    child: Text(
                  'Bệnh viện Nhân Dân Gia Định hỗ trợ đặt lịch khám bệnh từ 1 đến 30 ngày',
                  softWrap: true,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Color(0xFF1772B2)),
                ))
              ],
            ),
          ),
          TableCalendar(
            firstDay: DateTime.utc(2020, 01, 01),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, foncuseDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = foncuseDay;
              });
            },
          ),
          Text('Selected Day:${_selectedDay.toLocal()}'),
        ],
      ),
    );
  }
}
