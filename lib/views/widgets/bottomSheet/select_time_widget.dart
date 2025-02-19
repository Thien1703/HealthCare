import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/widgets/bottomSheet/header_bottomSheet.dart';

class SelectTimeWidget extends StatefulWidget {
  const SelectTimeWidget({super.key});
  @override
  State<SelectTimeWidget> createState() => _SelectTimeWidget();
}

class _SelectTimeWidget extends State<SelectTimeWidget> {
  @override
  Widget build(BuildContext context) {
    bool _ischecked = false;
    return HeaderBottomSheet(
      title: 'Chọn giờ khám',
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _customelable(lable: 'Buổi sáng', value: _ischecked),
              Wrap(
                spacing: 2.0,
                runSpacing: 4.0,
                children: [
                  _customeVlueTime(valueTime: '06:00 - 07:00'),
                  _customeVlueTime(valueTime: '07:00 - 08:00'),
                  _customeVlueTime(valueTime: '08:00 - 09:00'),
                  _customeVlueTime(valueTime: '10:00 - 11:00'),
                  _customeVlueTime(valueTime: '11:00 - 12:00'),
                ],
              ),
              _customelable(lable: 'Buổi chiều', value: _ischecked),
              Wrap(
                spacing: 2.0,
                runSpacing: 4.0,
                children: [
                  _customeVlueTime(valueTime: '13:30 - 14:00'),
                  _customeVlueTime(valueTime: '14:00 - 14:30'),
                  _customeVlueTime(valueTime: '14:30 - 15:00'),
                  _customeVlueTime(valueTime: '15:00 - 15:30'),
                  _customeVlueTime(valueTime: '15:30 - 16:00'),
                  _customeVlueTime(valueTime: '16:00 - 16:30'),
                ],
              ),
              SizedBox(height: 15),
              Text(
                'Tất cả thời gian theo múi giờ Việt Nam GMT + 7',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFFFEAD6D)),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _customelable({required String lable, required bool value}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        lable,
        style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: AppColors.neutralBlack),
      ),
      Checkbox(value: value, onChanged: (bool? newValue) {})
    ],
  );
}

Widget _customeVlueTime({required String valueTime}) {
  return Card(
    elevation: 5,
    color: AppColors.primary,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 13, vertical: 10),
      child: Text(
        valueTime,
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.neutralDarkGreen2),
      ),
    ),
  );
}
