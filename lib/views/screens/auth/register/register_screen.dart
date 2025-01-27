// import 'package:flutter/material.dart';
// import 'package:health_care/common/app_colors.dart';
// import 'package:health_care/views/screens/auth/register/name_screen.dart';

// class RegisterScreen extends StatefulWidget {
//   const RegisterScreen({super.key});

//   @override
//   State<RegisterScreen> createState() => _RegisterScreenState();
// }

// class _RegisterScreenState extends State<RegisterScreen> {
//   String? email; // Biến lưu email
//   bool isEmailValid = false; // Kiểm tra email có hợp lệ hay không

//   /// Hàm kiểm tra định dạng email
//   void updateEmail(String value) {
//     setState(() {
//       email = value;
//       isEmailValid = RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(value);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             // Logo nằm trên cùng cách lề trên 50px
//             Positioned(
//               top: 80,
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: Image.asset(
//                   'assets/images/healthcaregreen.png',
//                   height: 90,
//                 ),
//               ),
//             ),

//             // TextField và nội dung chính nằm giữa
//             Center(
//               child: Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       'Vui lòng nhập email',
//                       style: TextStyle(
//                         color: AppColors.neutralDarkGreen1,
//                         fontSize: 18,
//                         fontWeight: FontWeight.w700,
//                       ),
//                       textAlign: TextAlign.center,
//                     ),
//                     const SizedBox(height: 10),
//                     const Text(
//                       'Sử dụng email để tạo tài khoản hoặc đăng nhập vào HEALTH CARE',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: AppColors.neutralGreen4,
//                         fontSize: 16,
//                       ),
//                     ),
//                     const SizedBox(height: 30),
//                     TextField(
//                       decoration: InputDecoration(
//                         labelText: 'Nhập email',
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(8.0),
//                         ),
//                         errorText: isEmailValid || email == null
//                             ? null
//                             : 'Email không hợp lệ', // Hiển thị lỗi nếu email không hợp lệ
//                       ),
//                       keyboardType: TextInputType.emailAddress,
//                       onChanged: updateEmail, // Gọi hàm kiểm tra email
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // Nút ElevatedButton nằm cuối màn hình cách lề dưới 30px
//             Positioned(
//               bottom: 40,
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: ElevatedButton(
//                   onPressed: isEmailValid
//                       ? () {
//                           // Logic xử lý khi email hợp lệ
//                           print("Email hợp lệ: $email");
//                           Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (context) => NameScreen(),
//                             ),
//                           );
//                         }
//                       : null, // Vô hiệu hóa nút nếu email không hợp lệ
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: isEmailValid
//                         ? AppColors.accent // Màu xanh nếu hợp lệ
//                         : AppColors.grey4, // Màu xám nếu không hợp lệ
//                     padding: const EdgeInsets.symmetric(vertical: 15),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     minimumSize: const Size(238, 51), // kích thước của nút
//                   ),
//                   child: const Text(
//                     'TIẾP TỤC',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:health_care/views/screens/auth/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  String fullPhoneNumber = ''; // Số điện thoại hoàn chỉnh
  bool isPhoneValid = false;

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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: screenHeight * 0.1),

                  // Logo
                  Image.asset(
                    'assets/images/healthcaregreen.png',
                    height: screenHeight * 0.12,
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  // Tiêu đề và mô tả
                  Text(
                    'Vui lòng nhập số điện thoại',
                    style: TextStyle(
                      color: AppColors.neutralDarkGreen1,
                      fontSize: screenWidth * 0.05,
                      fontWeight: FontWeight.w700,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  Text(
                    'Sử dụng số điện thoại để tạo tài khoản hoặc đăng nhập vào HEALTH CARE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.neutralGreen4,
                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.05),

                  // Input số điện thoại (IntlPhoneField)
                  IntlPhoneField(
                    controller: phoneController,
                    initialCountryCode: 'VN',
                    decoration: InputDecoration(
                      labelText: 'Số điện thoại',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      labelStyle: TextStyle(
                        color: AppColors.neutralGreen4,
                        fontSize: screenWidth * 0.04,
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        borderSide: BorderSide(color: AppColors.accent),
                      ),
                      // focusedBorder: OutlineInputBorder(
                      //   borderSide: BorderSide(color: AppColors.accent),
                      // ),
                    ),
                    onChanged: (phone) {
                      setState(() {
                        fullPhoneNumber = phone.completeNumber; // Lấy số đầy đủ
                        isPhoneValid = phone.number.length >= 9 &&
                            phone.countryCode == '+84';
                      });
                    },
                    onCountryChanged: (country) {
                      // Đảm bảo nút cập nhật trạng thái khi thay đổi mã vùng
                      setState(() {
                        isPhoneValid = false;
                      });
                    },
                  ),
                  SizedBox(height: screenHeight * 0.1),

                  // Nút tiếp tục
                  ElevatedButton(
                    onPressed: isPhoneValid
                        ? () {
                            phoneNumberVerification(
                              phoneNumber: fullPhoneNumber,
                              context: context,
                            );
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          isPhoneValid ? AppColors.accent : AppColors.grey4,
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
                      'TIẾP TỤC',
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
    );
  }
}
