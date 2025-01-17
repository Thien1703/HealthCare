import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/common/app_icons.dart';
import 'package:health_care/views/screens/booking/create_project_screen.dart';
import 'package:health_care/views/widgets/widget_userProfile_card.dart';

class ChooseUserProfileScreen extends StatefulWidget {
  const ChooseUserProfileScreen({
    super.key,
    required this.onNavigateToScreen,
  });
  final Function(int, String) onNavigateToScreen;

  @override
  State<ChooseUserProfileScreen> createState() {
    return _ChooseUserProfileScreen();
  }
}

class _ChooseUserProfileScreen extends State<ChooseUserProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          // _customNotUser(context),
          _customHeader(context),
          InkWell(
            onTap: () {
              widget.onNavigateToScreen(2, 'Xác nhận thông tin');
            },
            child: WidgetUserprofileCard(),
          ),
          WidgetUserprofileCard(),
          WidgetUserprofileCard(),
          WidgetUserprofileCard(),
          SizedBox(height: 20),
        ],
      ),
    ));
  }
}

Widget _customHeader(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        'Hồ sơ đặt khám',
        style: TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: AppColors.neutralDarkGreen1,
        ),
      ),
      InkWell(
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateProject()));
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
            color: AppColors.accent,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Image.asset(
                AppIcons.addProfile,
                color: Colors.white,
                width: 15,
              ),
              SizedBox(width: 5),
              Text(
                'Thêm',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      )
    ],
  );
}
