import 'package:flutter/material.dart';
import 'package:health_care/views/widgets/widget_examination/widgetCardItem.dart';

class CompletedScreen extends StatefulWidget {
  const CompletedScreen({super.key});
  @override
  State<CompletedScreen> createState() => _CompletedScreen();
}

class _CompletedScreen extends State<CompletedScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        WidgetCardItem(
          states: 3,
        ),
        WidgetCardItem(
          states: 3,
        ),
        WidgetCardItem(
          states: 3,
        ),
      ],
    );
  }
}
