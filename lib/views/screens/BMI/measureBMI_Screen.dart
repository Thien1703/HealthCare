import 'package:flutter/material.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';

class MeasurebmiScreen extends StatelessWidget {
  const MeasurebmiScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return WidgetHeaderBody(
        iconBack: true, title: 'Đo BMI', body: Text('Đo BMI'));
  }
}
