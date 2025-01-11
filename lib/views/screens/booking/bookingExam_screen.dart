import 'package:flutter/material.dart';
import 'package:health_care/common/app_icons.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/screens/booking/select_confirm_screen.dart';
import 'package:health_care/views/screens/booking/select_info_screen.dart';
import 'package:health_care/views/screens/booking/select_payment_screen.dart';
import 'package:health_care/views/screens/booking/select_user_screen.dart';

class BookingexamScreen extends StatefulWidget {
  const BookingexamScreen({super.key});
  @override
  State<BookingexamScreen> createState() {
    return _BookingexamScreen();
  }
}

class _BookingexamScreen extends State<BookingexamScreen> {
  Widget _selectedScreen = SelectInfoScreen();
  String _showTitleScreen = 'Chọn thông tin khám';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.accent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
          color: AppColors.neutralWhite,
          iconSize: 25,
        ),
        centerTitle: true,
        title: Column(
          children: [
            Text(
              _showTitleScreen,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Container(
            color: AppColors.accent,
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedScreen = SelectInfoScreen();
                      _showTitleScreen = 'Chọn thông tin khám';
                    });
                  },
                  child: Image.asset(AppIcons.specialty),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedScreen = SelectUserScreen();
                      _showTitleScreen = 'Chọn hồ sơ';
                    });
                  },
                  child: Image.asset(AppIcons.user1),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedScreen = SelectConfirmScreen();
                      _showTitleScreen = 'Xác nhận thông tin';
                    });
                  },
                  child: Image.asset(AppIcons.checkmark),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      _selectedScreen = SelectPaymentScreen();
                      _showTitleScreen = 'Thông tin thanh toán';
                    });
                  },
                  child: Image.asset(AppIcons.payment),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppColors.neutralGrey,
              child: _selectedScreen,
            ),
          ),
        ],
      ),
    );
  }
}
