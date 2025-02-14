import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/screens/profile/editProfile_screen.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';

class InforProfileScreen extends StatelessWidget {
  const InforProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetHeaderBody(
      iconBack: true,
      title: 'Xác nhận thông tin',
      onBackPressed: () => Navigator.of(context).pop(),
      selectedIcon: IconButton(
        icon: const Icon(Icons.delete, color: Colors.white),
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Thông tin tài khoản',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            _buildInfoRow('Họ và tên', 'NGUYỄN HỮU THIỆN'),
            _buildInfoRow('Số điện thoại', '0901492845'),
            _buildInfoRow('Mật khẩu', '**********'),
            _buildInfoRow('Email', 'Chưa cập nhật'),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Bản đồ'),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditProfileScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Chỉnh sửa'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(color: AppColors.neutralDarkGreen2),
          ),
          Text(
            value,
            style: TextStyle(
                color: AppColors.neutralDarkGreen2,
                fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
