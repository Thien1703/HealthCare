import 'package:flutter/material.dart';
import 'package:health_care/views/widgets/widget_examination/WidgetCardItem.dart';

class PaidScreen extends StatefulWidget {
  const PaidScreen({super.key});
  @override
  State<PaidScreen> createState() => _PaidScreen();
}

class _PaidScreen extends State<PaidScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetCardItem(),
        WidgetCardItem(),
        WidgetCardItem(),
        WidgetCardItem(),
        WidgetCardItem(),
        WidgetCardItem(),
        WidgetCardItem(),
        WidgetCardItem(),
      ],
    );
  }
}
