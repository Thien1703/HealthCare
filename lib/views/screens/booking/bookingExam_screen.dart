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
      headerHeight: 0.2,
      selectedIcon: Container(
        color: AppColors.accent,
        padding: EdgeInsets.only(bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _cusomtItem(
              onTap: () => navigateToScreen(0, 'Chọn thông tin khám'),
              border: _isSelected[0]
                  ? Border.all(color: AppColors.primary, width: 1)
                  : null,
              background: _isSelected[0] ? Colors.white : AppColors.accent,
              image: AppIcons.specialty,
              color: _isSelected[0] ? AppColors.accent : AppColors.neutralGrey2,
            ),
            _cusomtItem(
              onTap: _currentIndex == 0
                  ? null
                  : () => navigateToScreen(1, 'Chọn hồ sơ'),
              border: _isSelected[1]
                  ? Border.all(color: AppColors.primary, width: 1)
                  : null,
              background: _isSelected[1] ? Colors.white : AppColors.accent,
              image: AppIcons.user1,
              color: _isSelected[1] ? AppColors.accent : AppColors.neutralGrey2,
            ),
            _cusomtItem(
              onTap: _currentIndex <= 1
                  ? null
                  : () => navigateToScreen(2, 'Xác nhận thông tin'),
              border: _isSelected[2]
                  ? Border.all(color: AppColors.primary, width: 1)
                  : null,
              background: _isSelected[2] ? Colors.white : AppColors.accent,
              image: AppIcons.checkmark,
              color: _isSelected[2] ? AppColors.accent : AppColors.neutralGrey2,
            ),
            _cusomtItem(
              onTap: _currentIndex < 2
                  ? null
                  : () => navigateToScreen(3, 'Thông tin thanh toán'),
              border: _isSelected[3]
                  ? Border.all(color: AppColors.primary, width: 1)
                  : null,
              background: _isSelected[3] ? Colors.white : AppColors.accent,
              image: AppIcons.payment,
              color: _isSelected[3] ? AppColors.accent : AppColors.neutralGrey2,
            ),
          ],
        ),
      ),
      body: Container(
        width: double.infinity,
        color: AppColors.neutralGrey,
        child: _screens[_currentIndex],
      ),
    );
  }
}

Widget _cusomtItem(
    {required onTap,
    required border,
    required image,
    required color,
    required background}) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: background,
          border: border,
          borderRadius: BorderRadius.circular(50)),
      child: Image.asset(
        image,
        width: 25,
        color: color,
      ),
    ),
  );
}
