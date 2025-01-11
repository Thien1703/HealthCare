import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/screens/register/password_screen.dart';

class NameScreen extends StatefulWidget {
  const NameScreen({super.key});

  @override
  State<NameScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  bool _isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _lastNameController.addListener(_updateButtonState);
    _firstNameController.addListener(_updateButtonState);
  }

  @override
  void dispose() {
    _lastNameController.dispose();
    _firstNameController.dispose();
    super.dispose();
  }

  void _updateButtonState() {
    setState(() {
      _isButtonEnabled = _lastNameController.text.isNotEmpty &&
          _firstNameController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: AppColors.primary,
      body: SafeArea(
        child: Stack(
          children: [
            // Logo
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

            // Text and TextFields
            Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'Vui lòng nhập họ và tên của bạn',
                      style: TextStyle(
                        color: AppColors.neutralDarkGreen1,
                        fontSize: 18,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Sử dụng họ và tên đầy đủ để đảm bảo thông tin chính xác',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: AppColors.neutralGreen4,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextField(
                      controller: _lastNameController,
                      decoration: InputDecoration(
                        labelText: 'Họ',
                        labelStyle: TextStyle(color: AppColors.neutralGreen4),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.neutralGreen4),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.neutralDarkGreen1),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    TextField(
                      controller: _firstNameController,
                      decoration: InputDecoration(
                        labelText: 'Tên',
                        labelStyle: TextStyle(color: AppColors.neutralGreen4),
                        enabledBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.neutralGreen4),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: AppColors.neutralDarkGreen1),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            // Button
            Positioned(
              bottom: 40,
              left: 0,
              right: 0,
              child: Center(
                child: ElevatedButton(
                  onPressed: _isButtonEnabled
                      ? () {
                          // Handle button action here
                          // print('Họ: ${_lastNameController.text}');
                          // print('Tên: ${_firstNameController.text}');
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PasswordScreen(),
                            ),
                          );
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: _isButtonEnabled
                        ? AppColors.neutralGreen4
                        : AppColors.grey4,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    minimumSize: Size(238, 51),
                  ),
                  child: const Text(
                    'TIẾP TỤC',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
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
