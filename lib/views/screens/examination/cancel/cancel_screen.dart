import 'package:flutter/material.dart';
import 'package:health_care/views/widgets/widget_examination/widgetCardItem.dart';

class CancelScreen extends StatefulWidget {
  const CancelScreen({super.key});
  @override
  State<CancelScreen> createState() => _CancelScreen();
}

class _CancelScreen extends State<CancelScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetCardItem(
          states: 4,
        ),
      ],
    );
  }
}
