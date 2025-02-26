// import 'package:flutter/material.dart';
// import 'package:health_care/common/app_colors.dart';
// import 'package:intl_phone_field/intl_phone_field.dart';
// import 'package:health_care/views/screens/auth/auth_service.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   final TextEditingController phoneController = TextEditingController();
//   String fullPhoneNumber = ''; // Số điện thoại hoàn chỉnh
//   bool isPhoneValid = false;

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       resizeToAvoidBottomInset: true,
//       body: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             child: Container(
//               height: screenHeight,
//               width: screenWidth,
//               padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 children: [
//                   SizedBox(height: screenHeight * 0.1),

//                   // Logo
//                   Image.asset(
//                     'assets/images/healthcaregreen.png',
//                     height: screenHeight * 0.12,
//                   ),
//                   SizedBox(height: screenHeight * 0.05),

//                   // Tiêu đề và mô tả
//                   Text(
//                     'Vui lòng nhập số điện thoại',
//                     style: TextStyle(
//                       color: AppColors.neutralDarkGreen1,
//                       fontSize: screenWidth * 0.05,
//                       fontWeight: FontWeight.w700,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                   SizedBox(height: screenHeight * 0.02),
//                   Text(
//                     'Sử dụng số điện thoại để tạo tài khoản hoặc đăng nhập vào HEALTH CARE',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       color: AppColors.neutralGreen4,
//                       fontSize: screenWidth * 0.04,
//                     ),
//                   ),
//                   SizedBox(height: screenHeight * 0.05),

//                   // Input số điện thoại (IntlPhoneField)
//                   IntlPhoneField(
//                     controller: phoneController,
//                     initialCountryCode: 'VN',
//                     decoration: InputDecoration(
//                       labelText: 'Số điện thoại',
//                       border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                       labelStyle: TextStyle(
//                         color: AppColors.neutralGreen4,
//                         fontSize: screenWidth * 0.04,
//                       ),
//                       enabledBorder: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         borderSide: BorderSide(color: AppColors.accent),
//                       ),
//                       // focusedBorder: OutlineInputBorder(
//                       //   borderSide: BorderSide(color: AppColors.accent),
//                       // ),
//                     ),
//                     onChanged: (phone) {
//                       setState(() {
//                         fullPhoneNumber = phone.completeNumber; // Lấy số đầy đủ
//                         isPhoneValid = phone.number.length >= 9 &&
//                             phone.countryCode == '+84';
//                       });
//                     },
//                     onCountryChanged: (country) {
//                       // Đảm bảo nút cập nhật trạng thái khi thay đổi mã vùng
//                       setState(() {
//                         isPhoneValid = false;
//                       });
//                     },
//                   ),
//                   SizedBox(height: screenHeight * 0.1),

//                   // Nút tiếp tục
//                   ElevatedButton(
//                     onPressed: isPhoneValid
//                         ? () {
//                             phoneNumberVerification(
//                               phoneNumber: fullPhoneNumber,
//                               context: context,
//                             );
//                           }
//                         : null,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor:
//                           isPhoneValid ? AppColors.accent : AppColors.grey4,
//                       padding: EdgeInsets.symmetric(
//                         vertical: screenHeight * 0.02,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       minimumSize: Size(
//                         screenWidth * 0.7,
//                         screenHeight * 0.07,
//                       ),
//                     ),
//                     child: Text(
//                       'TIẾP TỤC',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: screenWidth * 0.045,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:health_care/viewmodels/auth_viewmodel.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColors.primary,
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: screenHeight,
              width: screenWidth,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: screenHeight * 0.08),

                    // Logo
                    Image.asset(
                      'assets/images/healthcaregreen.png',
                      height: screenHeight * 0.12,
                    ),
                    SizedBox(height: screenHeight * 0.04),

                    // Tiêu đề
                    Text(
                      'Đăng ký tài khoản',
                      style: TextStyle(
                        color: AppColors.neutralDarkGreen1,
                        fontSize: screenWidth * 0.06,
                        fontWeight: FontWeight.w700,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Full Name
                    TextFormField(
                      controller: fullNameController,
                      decoration: InputDecoration(
                        labelText: 'Họ và Tên',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập họ và tên';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Phone Number
                    TextFormField(
                      controller: phoneController,
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        labelText: 'Số điện thoại',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Vui lòng nhập số điện thoại';
                        }
                        if (!RegExp(r'^\d{9,11}$').hasMatch(value)) {
                          return 'Số điện thoại không hợp lệ';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.02),

                    // Password
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Mật khẩu',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.length < 6) {
                          return 'Mật khẩu phải có ít nhất 6 ký tự';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: screenHeight * 0.05),

                    // Nút Đăng ký
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          final authViewModel = Provider.of<AuthViewModel>(context, listen: false);
                          authViewModel.register(
                            context,
                            fullNameController.text.trim(),
                            phoneController.text.trim(),
                            passwordController.text.trim(),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.accent,
                        padding: EdgeInsets.symmetric(
                          vertical: screenHeight * 0.02,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        minimumSize: Size(
                          screenWidth * 0.7,
                          screenHeight * 0.07,
                        ),
                      ),
                      child: Text(
                        'ĐĂNG KÝ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: screenWidth * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}


