import 'package:flutter/material.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';

class Service extends StatelessWidget {
  const Service({super.key});
  @override
  Widget build(BuildContext context) {
    return WidgetHeaderBody(
      iconBack: true,
      title: 'Chọn dịch vụ',
      body: Text('Đây là màn dịch vụ của chuyển khoa'),
    );
  }
}
