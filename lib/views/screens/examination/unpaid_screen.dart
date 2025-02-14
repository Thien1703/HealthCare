import 'package:flutter/material.dart';
import 'package:health_care/views/widgets/widget_examination/widgetCardItem.dart';

class UnPaidScreen extends StatefulWidget {
  const UnPaidScreen({super.key});
  @override
  State<UnPaidScreen> createState() => _UnPaidScreen();
}

class _UnPaidScreen extends State<UnPaidScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetCardItem(
          states: 2,
        ),
      ],
    );
  }
}
