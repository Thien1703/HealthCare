import 'package:flutter/material.dart';

class SelectPaymentScreen extends StatefulWidget {
  const SelectPaymentScreen({super.key});
  @override
  State<SelectPaymentScreen> createState() {
    return _SelectPaymentScreen();
  }
}

class _SelectPaymentScreen extends State<SelectPaymentScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 50),
      child: Column(
        children: [
          Text('Đây là màn payment '),
          Text('data'),
        ],
      ),
    );
  }
}
