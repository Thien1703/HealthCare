import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/screens/welcome/start_screen.dart';

class PasswordScreen extends StatefulWidget {
  const PasswordScreen({super.key});

  @override
  State<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends State<PasswordScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isButtonEnabled = false;

  void checkPassword() {
    setState(() {
      isButtonEnabled = passwordController.text.length >= 6 &&
          confirmPasswordController.text == passwordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Stack(
          children: [
            // Logo ở trên cùng
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

            // Nội dung chính
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.person,
                        size: 50,
                        color: AppColors.neutralDarkGreen1,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'HỮU THIỆN',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.neutralDarkGreen1,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      '+84901492845',
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.secondary1,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Mật khẩu
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Mật khẩu',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.neutralDarkGreen1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      onChanged: (_) => checkPassword(),
                      decoration: InputDecoration(
                        hintText: 'Nhập mật khẩu tối thiểu 6 kí tự',
                        hintStyle: const TextStyle(
                          color: AppColors.neutralGreen4,
                          fontSize: 14,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                        border: const UnderlineInputBorder(),
                      ),
                      // textAlign: TextAlign.center, // Để hintText nằm giữa
                    ),
                    const SizedBox(height: 20),

                    // Nhập lại mật khẩu
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Nhập lại mật khẩu',
                        style: TextStyle(
                          fontSize: 16,
                          color: AppColors.neutralDarkGreen1,
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      controller: confirmPasswordController,
                      obscureText: !isConfirmPasswordVisible,
                      onChanged: (_) => checkPassword(),
                      decoration: InputDecoration(
                        hintText: 'Nhập mật khẩu tối thiểu 6 kí tự',
                        hintStyle: const TextStyle(
                          color: AppColors.neutralGreen4,
                          fontSize: 14,
                        ),
                        contentPadding:
                            const EdgeInsets.symmetric(vertical: 15),
                        suffixIcon: IconButton(
                          icon: Icon(
                            isConfirmPasswordVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordVisible =
                                  !isConfirmPasswordVisible;
                            });
                          },
                        ),
                        border: const UnderlineInputBorder(),
                      ),
                      // textAlign: TextAlign.center, // Để hintText nằm giữa
                    ),
                  ],
                ),
              ),
            ),

            // Nút "TIẾP TỤC" ở cuối
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: isButtonEnabled
                      ? () {
                          // Logic xử lý khi nhấn "TIẾP TỤC"
                          print("Mật khẩu hợp lệ");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => StartScreen(),
                            ),
                          );
                        }
                      : null, // Vô hiệu hóa nút nếu không hợp lệ
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isButtonEnabled
                        ? AppColors.accent // Màu xanh nếu hợp lệ
                        : AppColors.grey4, // Màu xám nếu không hợp lệ
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: const Size(238, 51), // Kích thước nút
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
