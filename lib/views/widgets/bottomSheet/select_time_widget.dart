import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/widgets/bottomSheet/header_bottomSheet.dart';

class SelectTimeWidget extends StatefulWidget {
  final Function(String) onTimeSelected;

  const SelectTimeWidget({super.key, required this.onTimeSelected});

  @override
  State<SelectTimeWidget> createState() => _SelectTimeWidgetState();
}

class _SelectTimeWidgetState extends State<SelectTimeWidget> {
  String? selectedTime;

  @override
  Widget build(BuildContext context) {
    return HeaderBottomSheet(
      title: 'Chọn giờ khám',
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _customLabel(label: 'Buổi sáng'),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _customValueTime('07:00:00'),
                _customValueTime('08:00:00'),
                _customValueTime('09:00:00'),
                _customValueTime('10:00:00'),
                _customValueTime('11:00:00'),
              ],
            ),
            _customLabel(label: 'Buổi chiều'),
            Wrap(
              spacing: 8.0,
              runSpacing: 8.0,
              children: [
                _customValueTime('13:00:00'),
                _customValueTime('14:00:00'),
                _customValueTime('15:00:00'),
                _customValueTime('16:00:00'),
                _customValueTime('17:00:00'),
              ],
            ),
            SizedBox(height: 15),
            Text(
              'Tất cả thời gian theo múi giờ Việt Nam GMT + 7',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color(0xFFFEAD6D),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _customLabel({required String label}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 19,
          fontWeight: FontWeight.w700,
          color: AppColors.neutralBlack,
        ),
      ),
    );
  }

  Widget _customValueTime(String valueTime) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTime = valueTime;
          print(valueTime);
        });
        widget.onTimeSelected(valueTime);
        Navigator.pop(context);
      },
      child: Card(
  elevation: 5,
  color: selectedTime == valueTime
      ? Colors.blue // Nền xanh khi chọn thời gian
      : const Color.fromARGB(255, 151, 190, 223), // Màu nền mặc định
  child: Padding(
    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    child: Text(
      valueTime,
      style: TextStyle(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: selectedTime == valueTime
            ? const Color.fromARGB(255, 38, 63, 173) // Chữ trắng khi chọn thời gian
            : Colors.white // Chữ màu khác khi không chọn
      ),
    ),
  ),
)
    );
  }
}
