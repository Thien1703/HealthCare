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
  return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Stack(
          children: [
            // Logo nằm trên cùng cách lề trên 50px
            Positioned(
              top: 80,
              left: 0,
              right: 0,
              child: Center(
                child: Image.asset(
                  'assets/images/healthcaregreen.png',
                  height: 90,
                ),
              ),
            ),

            // IntlPhoneField và nội dung chính nằm giữa
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Vui lòng nhập số điện thoại',
                      style: TextStyle(
                        color: AppColors.neutralDarkGreen1,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Sử dụng số điện thoại để tạo tài khoản hoặc đăng nhập vào HEALTH CARE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.neutralGreen4,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 30),
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
            ),
            const SizedBox(height: 50),
            Positioned(
              bottom: 200,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'Hoặc đăng nhập bằng',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.neutralDarkGreen1,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Positioned(
              bottom: 140,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/facebook.png',
                      height: 36,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/google.png',
                      height: 36,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      'assets/images/zalo.png',
                      height: 36,
                    ),
                  ),
                ],
              ),
            ),

            // Nút ElevatedButton nằm cuối màn hình cách lề dưới 30px
            Positioned(
              bottom: 40,
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
                              builder: (context) =>
                                  PasswordScreen(),
                            ),
                          );
                        }
                      : null, // Vô hiệu hóa nút nếu số điện thoại không hợp lệ
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isPhoneValid
                        ? AppColors.accent // Màu xanh nếu hợp lệ
                        : AppColors.grey4, // Màu xám nếu không hợp lệ
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(238, 51), // kích thước của nút
                  ),
                  child: const Text(
                    'TIẾP TỤC',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
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