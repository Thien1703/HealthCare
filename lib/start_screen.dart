import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/screens/Login/login_screen.dart';
import 'package:health_care/views/screens/register/register_screen.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({super.key});

  @override
  State<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  @override
  Widget build(BuildContext context) {
    // Lấy kích thước màn hình hiện tại
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColors.primary, // Màu nền từ hình
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: screenHeight * 0.14), // Khoảng cách phía trên linh hoạt
            Column(
              children: [
                Image.asset(
                  'assets/images/splash.png', // Hình ảnh chính
                  height:
                      screenHeight * 0.3, // Chiều cao hình ảnh theo màn hình
                ),
                SizedBox(
                    height: screenHeight * 0.02), // Khoảng cách dưới hình ảnh
                Text(
                  'Chủ Động',
                  style: TextStyle(
                    fontSize: screenWidth * 0.06, // Kích thước chữ linh hoạt
                    fontWeight: FontWeight.w700,
                    color: AppColors.neutralDarkGreen1, // Màu xanh đậm
                  ),
                ),
                SizedBox(
                    height: screenHeight * 0.01), // Khoảng cách dưới tiêu đề
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.1),
                  child: Text(
                    'Kiểm soát thời gian và lịch trình của bạn hiệu quả hơn',
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // Kích thước chữ mô tả
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutralDarkGreen2, // Màu xanh nhạt
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            SizedBox(
                height:
                    screenHeight * 0.05), // Khoảng cách giữa nội dung và nút
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Xử lý sự kiện khi nhấn nút "Đăng Ký"
                    Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accent, // Màu nút
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(140, 51),
                  ),
                  child: const Text(
                    'ĐĂNG KÝ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * 0.02), // Khoảng cách dưới nút
                RichText(
                  text: TextSpan(
                    text: 'Bạn đã có tài khoản? ', // Văn bản cố định
                    style: TextStyle(
                      fontSize: screenWidth * 0.04, // Kích thước chữ linh hoạt
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutralGrey3, // Màu chữ
                    ),
                    children: [
                      TextSpan(
                        text: 'Đăng nhập', // Văn bản có thể nhấn
                        style: TextStyle(
                          fontSize: screenWidth * 0.04,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF2F6D46), // Màu chữ "Đăng nhập"
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Chuyển sang màn hình đăng nhập
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                            );
                          },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: screenHeight * 0.05), // Khoảng cách phía dưới
              ],
            ),
          ],
        ),
      ),
    );
  }
}
