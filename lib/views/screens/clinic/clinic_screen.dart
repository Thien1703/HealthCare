import 'package:flutter/material.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';

class ClinicScreen extends StatelessWidget {
  const ClinicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetHeaderBody(title: "Chọn cơ sở y tế", body: Center(
        child: Text('Nội dung được hiển thị ở đây!'),
      ),);
  }
}
