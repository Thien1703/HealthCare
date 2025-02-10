import 'package:flutter/material.dart';

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
        Text('Chưa thanh toán'),
      ],
    );
  }
}
