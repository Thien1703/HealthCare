import 'package:flutter/material.dart';

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
        Text('Đã thanh toán'),
      ],
    );
  }
}
