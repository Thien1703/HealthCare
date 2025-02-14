import 'package:flutter/material.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';

class UnPaidDetailScreen extends StatefulWidget {
  const UnPaidDetailScreen({super.key});
  @override
  State<UnPaidDetailScreen> createState() => _UnPaidDetailScreen();
}

class _UnPaidDetailScreen extends State<UnPaidDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return WidgetHeaderBody(
        iconBack: true,
        title: 'Thông tin phiếu khám',
        body: Column(
          children: [],
        ));
  }
}
