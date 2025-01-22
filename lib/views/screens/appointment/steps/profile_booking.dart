import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/common/app_icons.dart';
import 'package:health_care/views/screens/appointment/create_profile_booking.dart';
import 'package:health_care/views/widgets/widget_userProfile_card.dart';

class ProfileBooking extends StatefulWidget {
  const ProfileBooking({
    super.key,
    required this.onNavigateToScreen,
  });
  final Function(int, String) onNavigateToScreen;

  @override
  State<ProfileBooking> createState() =>
      _ProfileBooking();
}

class _ProfileBooking extends State<ProfileBooking> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          const UserProfileHeader(),
          InkWell(
            onTap: () {
              widget.onNavigateToScreen(2, 'Xác nhận thông tin');
            },
            child: const WidgetUserprofileCard(),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class UserProfileHeader extends StatelessWidget {
  const UserProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          'Hồ sơ đặt khám',
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.neutralDarkGreen1,
          ),
        ),
        AddProfileButton(),
      ],
    );
  }
}

class AddProfileButton extends StatelessWidget {
  const AddProfileButton({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const CreateProfileBooking()),
        );
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
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
            const SizedBox(width: 5),
            const Text(
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
    );
  }
}
