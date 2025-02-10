import 'package:flutter/material.dart';

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
        Text('Đã hủy'),
      ],
    );
  }
}
