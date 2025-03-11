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
  State<ProfileBooking> createState() => _ProfileBooking();
}

class _ProfileBooking extends State<ProfileBooking> {
  void _handleProfileTap(int customerId) {
    print("ID khách hàng: $customerId");
    widget.onNavigateToScreen(2, 'Xác nhận thông tin'); // Chuyển trang
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: ListView(
        children: [
          WidgetUserprofileCard(onTap: _handleProfileTap), // Truyền callback
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
