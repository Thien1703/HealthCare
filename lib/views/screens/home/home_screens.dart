import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/common/app_icons.dart';
import 'package:health_care/views/screens/clinic/clinic_screen.dart';
import 'package:health_care/views/screens/profile/profile_screen.dart';
import 'package:health_care/views/screens/examination/examination_screen.dart';
import 'package:health_care/views/screens/home/screens/homePage.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  State<HomeScreens> createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int _selectedIndex = 0;

  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return HomePage();
      case 1:
        return ClinicScreen();
      case 2:
        return Center(child: Text('Bản đồ đang được phát triển'));
      case 3:
        return ExaminationScreen();
      case 4:
        return ProfileScreen();
      default:
        return Center(child: Text('Tính năng đang được phát triển'));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _getBody(),
        bottomNavigationBar: ConvexAppBar(
          items: [
            TabItem(
              icon: ImageIcon(
                AssetImage(AppIcons.homeIcon),
                color: _selectedIndex == 0
                    ? AppColors.accent
                    : AppColors.neutralDarkGreen2,
              ),
              title: 'Trang chủ',
            ),
            TabItem(
              icon: ImageIcon(
                AssetImage(AppIcons.healthBook),
                color: _selectedIndex == 1
                    ? AppColors.accent
                    : AppColors.neutralDarkGreen2,
              ),
              title: 'Đặt khám',
            ),
            TabItem(
              icon: ImageIcon(
                AssetImage(AppIcons.map),
                color: _selectedIndex == 2
                    ? AppColors.accent
                    : AppColors.neutralDarkGreen2,
              ),
              title: 'Bản đồ',
            ),
            TabItem(
              icon: ImageIcon(
                AssetImage(AppIcons.phieuKham),
                color: _selectedIndex == 3
                    ? AppColors.accent
                    : AppColors.neutralDarkGreen2,
              ),
              title: 'Khám',
            ),
            TabItem(
              icon: ImageIcon(
                AssetImage(AppIcons.person),
                color: _selectedIndex == 4
                    ? AppColors.accent
                    : AppColors.neutralDarkGreen2,
              ),
              title: 'Tài khoản',
            ),
          ],
          style: TabStyle.react,
          backgroundColor: AppColors.primary,
          activeColor: AppColors.accent,
          color: AppColors.neutralDarkGreen2,
          initialActiveIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ));
  }
}
