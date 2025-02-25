import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/screens/profile/editProfile_screen.dart';

class InforProfileScreen extends StatelessWidget {
  const InforProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Lấy chiều cao màn hình
    final screenHeight = MediaQuery.of(context).size.height;
    // Tính chiều cao header theo tỷ lệ, ví dụ 12% chiều cao màn hình
    final headerHeight = screenHeight * 0.12;

    return Scaffold(
      // SafeArea để tránh bị che khuất bởi notch/thanh trạng thái
      body: Column(
        children: [
          // Header tuỳ chỉnh, chiều cao thích nghi theo kích thước màn hình
          Container(
            width: double.infinity,
            height: headerHeight,
            color: AppColors.accent,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Nút Back (bên trái)
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.of(context).pop(),
                  ),

                  // Tiêu đề (ở giữa)
                  const Text(
                    'Xác nhận thông tin',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  // Icon delete (bên phải)
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.white),
                    onPressed: () {
                      // Xử lý khi nhấn nút xóa
                    },
                  ),
                ],
              ),
            ),
          ),

          // Nội dung bên dưới
          Expanded(
            child: SingleChildScrollView(
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
                  _buildInfoRow('Ngày sinh', '01/07/2003'),
                  _buildInfoRow('Giới tính', 'Nam'),
                  _buildInfoRow('Mã bảo hiểm y tế', 'Chưa cập nhật'),
                  _buildInfoRow('Mã định danh/CCCD', 'Chưa cập nhật'),
                  _buildInfoRow('Email', 'Chưa cập nhật'),
                  _buildInfoRow('Địa chỉ', 'Thành phố Hồ Chí Minh'),
                  const SizedBox(height: 20),
                  Row(
                    children: [
                      // Expanded(
                      //   child: ElevatedButton(
                      //     onPressed: () {
                      //       // Mở bản đồ hoặc tính năng khác
                      //     },
                      //     style: ElevatedButton.styleFrom(
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(12),
                      //       ),
                      //       backgroundColor: Colors.green,
                      //       foregroundColor: Colors.white,
                      //     ),
                      //     child: const Text('Bản đồ'),
                      //   ),
                      // ),
                      // const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const EditProfileScreen(),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
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
          ),
        ],
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
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
