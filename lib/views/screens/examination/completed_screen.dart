import 'package:flutter/material.dart';

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
        Text('Đã khám'),
      ],
    );
  }
}
