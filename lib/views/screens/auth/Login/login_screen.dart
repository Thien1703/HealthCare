import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/screens/auth/Login/password_screen.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isPhoneValid = false; // Biến kiểm tra trạng thái số điện thoại

  void updatePhoneNumber(String number, bool valid) {
    setState(() {
      isPhoneValid = valid;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primary,
      resizeToAvoidBottomInset: false, // Không thay đổi layout khi bàn phím bật
      body: SafeArea(
        child: Stack(
          children: [
            // Logo nằm trên cùng
            Positioned(
              top: screenHeight * 0.1,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/images/healthcaregreen.png',
                  height: screenHeight * 0.12, // Responsive logo
                ),
              ),
            ),

            // Nội dung chính (nhập số điện thoại)
            Positioned.fill(
              top: screenHeight * 0.3,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                    child: Column(
                      children: [
                        Text(
                          'Vui lòng nhập số điện thoại',
                          style: TextStyle(
                            color: AppColors.neutralDarkGreen1,
                            fontSize: screenWidth * 0.045,
                            fontWeight: FontWeight.w700,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(height: screenHeight * 0.01),
                        Text(
                          'Sử dụng số điện thoại để tạo tài khoản hoặc đăng nhập vào HEALTH CARE',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.neutralGreen4,
                            fontSize: screenWidth * 0.04,
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.04),
                        IntlPhoneField(
                          decoration: InputDecoration(
                            labelText: 'Nhập số điện thoại',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8.0),
                            ),
                          ),
                          initialCountryCode: 'VN',
                          onChanged: (phone) {
                            updatePhoneNumber(
                              phone.completeNumber,
                              phone.number.length >=
                                  9, // Kiểm tra độ dài số điện thoại
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Text "Hoặc đăng nhập bằng"
            Positioned(
              bottom: screenHeight * 0.2,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Hoặc đăng nhập bằng',
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    color: AppColors.neutralDarkGreen1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),

            // Icon nút mạng xã hội
            Positioned(
              bottom: screenHeight * 0.13,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/facebook.png',
                      height: screenHeight * 0.05,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/google.png',
                      height: screenHeight * 0.05,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/zalo.png',
                      height: screenHeight * 0.05,
                    ),
                  ),
                ],
              ),
            ),

            // Nút ElevatedButton nằm cuối màn hình
            Positioned(
              bottom: screenHeight * 0.05,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: isPhoneValid
                      ? () {
                          // Logic xử lý khi số điện thoại hợp lệ
                          print("Số điện thoại hợp lệ");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PasswordScreen(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPhoneValid
                        ? AppColors.accent
                        : AppColors.grey4,
                    padding: EdgeInsets.symmetric(
                      vertical: screenHeight * 0.02,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(
                      screenWidth * 0.6,
                      screenHeight * 0.07,
                    ),
                  ),
                  child: Text(
                    'TIẾP TỤC',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.045,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
