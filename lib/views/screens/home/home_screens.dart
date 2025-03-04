import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/common/app_icons.dart';
// ignore: unused_import
import 'package:health_care/views/screens/clinic/clinic_screen.dart';
import 'package:health_care/views/screens/map/searchMap.dart';
import 'package:health_care/views/screens/profile/profile_screen.dart';
import 'package:health_care/views/screens/examination/examination_screen.dart';
import 'package:health_care/views/screens/home/homePage.dart';


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
        return SearchScreen();
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
                _selectedIndex == 0
                    ? AssetImage(AppIcons.homeIcon)
                    : AssetImage(AppIcons.homeIconBlack),
                color: _selectedIndex == 0
                    ? AppColors.accent
                    : const Color.fromARGB(255, 169, 169, 169),
              ),
              title: 'Trang chủ',
            ),
            TabItem(
              icon: ImageIcon(
                _selectedIndex == 0
                    ? AssetImage(AppIcons.bookingIcon)
                    : AssetImage(AppIcons.bookingIconBlack),
                color: _selectedIndex == 0
                    ? AppColors.accent
                    : const Color.fromARGB(255, 169, 169, 169),
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
              title: 'Thông báo',
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
          backgroundColor: Colors.white,
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
