import 'package:flutter/material.dart';
import 'package:health_care/common/app_icons.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/screens/booking/steps/choose_confirm_screen.dart';
import 'package:health_care/views/screens/booking/steps/choose_exam_info_screen.dart';
import 'package:health_care/views/screens/booking/steps/choose_payment_screen.dart';
import 'package:health_care/views/screens/booking/steps/choose_user_profile_screen.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';

class BookingexamScreen extends StatefulWidget {
  const BookingexamScreen({super.key});
  @override
  State<BookingexamScreen> createState() => _BookingexamScreen();
}

class _BookingexamScreen extends State<BookingexamScreen> {
  int _currentIndex = 0;
  String _showTitleScreen = 'Chọn thông tin khám';
  late final List<Widget> _screens;
  late List<bool> _isSelected;

  @override
  void initState() {
    super.initState();
    _isSelected = [true, false, false, false];
    _screens = [
      ChooseExamInfoScreen(onNavigateToScreen: navigateToScreen),
      ChooseUserProfileScreen(onNavigateToScreen: navigateToScreen),
      ChooseConfirmScreen(onNavigateToScreen: navigateToScreen),
      ChoosePaymentScreen(),
    ];
  }

  void navigateToScreen(int index, String title) {
    setState(() {
      _currentIndex = index;
      _showTitleScreen = title;

      for (int i = 0; i < _isSelected.length; i++) {
        _isSelected[i] = i == index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetHeaderBody(
      title: _showTitleScreen,
      body: Column(
        children: [
          Container(
            color: AppColors.accent,
            padding: EdgeInsets.only(bottom: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () => navigateToScreen(0, 'Chọn thông tin khám'),
                  child: Image.asset(
                    AppIcons.specialty,
                    color: _isSelected[0] ? AppColors.primary : null,
                  ),
                ),
                InkWell(
                  onTap: _currentIndex == 0
                      ? null
                      : () => navigateToScreen(1, 'Chọn hồ sơ'),
                  child: Image.asset(
                    AppIcons.user1,
                    color: _isSelected[1] ? AppColors.primary : null,
                  ),
                ),
                InkWell(
                  onTap: _currentIndex <= 1
                      ? null
                      : () => navigateToScreen(2, 'Xác nhận thông tin'),
                  child: Image.asset(
                    AppIcons.checkmark,
                    color: _isSelected[2] ? AppColors.primary : null,
                  ),
                ),
                InkWell(
                  onTap: _currentIndex <= 2
                      ? null
                      : () => navigateToScreen(3, 'Thông tin thanh toán'),
                  child: Image.asset(
                    AppIcons.payment,
                    color: _isSelected[3] ? AppColors.primary : null,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              color: AppColors.neutralGrey,
              child: _screens[_currentIndex],
            ),
          ),
        ],
      ),
    );
  }
}
