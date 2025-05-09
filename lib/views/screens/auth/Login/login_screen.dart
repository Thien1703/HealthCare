// import 'package:flutter/material.dart';
// import 'package:health_care/common/app_colors.dart';
// import 'package:provider/provider.dart';

// import '../../../../viewmodels/auth_viewmodel.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final TextEditingController phoneController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   bool _isPasswordVisible = false;
//   String? _errorMessage;
//   bool _isLoading = false;

//   void handleLogin() async {
//     if (!mounted) return; // Kiểm tra nếu Widget đã bị unmount

//     setState(() {
//       _isLoading = true;
//     });

//     await Provider.of<AuthViewModel>(context, listen: false).login(
//         context, phoneController.text.trim(), passwordController.text.trim());

//     if (!mounted) return; // Kiểm tra lại trước khi cập nhật UI

//     setState(() {
//       _isLoading = false;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: AppColors.primary,
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: Stack(
//           children: [
//             Positioned(
//               top: screenHeight * 0.1,
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: Image.asset(
//                   'assets/images/healthcaregreen.png',
//                   height: screenHeight * 0.12,
//                 ),
//               ),
//             ),
//             Positioned.fill(
//               top: screenHeight * 0.3,
//               child: Column(
//                 children: [
//                   Padding(
//                     padding:
//                         EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
//                     child: Column(
//                       children: [
//                         Text(
//                           'Vui lòng nhập số điện thoại',
//                           style: TextStyle(
//                             color: AppColors.neutralDarkGreen1,
//                             fontSize: screenWidth * 0.045,
//                             fontWeight: FontWeight.w700,
//                           ),
//                           textAlign: TextAlign.center,
//                         ),
//                         SizedBox(height: screenHeight * 0.01),
//                         Text(
//                           'Sử dụng số điện thoại để tạo tài khoản hoặc đăng nhập vào HEALTH CARE',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             color: AppColors.neutralGreen4,
//                             fontSize: screenWidth * 0.04,
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.04),
//                         // Nhập số điện thoại
//                         TextField(
//                           controller: phoneController,
//                           keyboardType: TextInputType.phone,
//                           decoration: InputDecoration(
//                             labelText: 'Nhập số điện thoại',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: screenHeight * 0.02),
//                         // Nhập mật khẩu
//                         TextField(
//                           controller: passwordController,
//                           obscureText: !_isPasswordVisible,
//                           decoration: InputDecoration(
//                             labelText: 'Mật khẩu',
//                             border: OutlineInputBorder(
//                               borderRadius: BorderRadius.circular(8.0),
//                             ),
//                             suffixIcon: IconButton(
//                               icon: Icon(
//                                 _isPasswordVisible
//                                     ? Icons.visibility
//                                     : Icons.visibility_off,
//                               ),
//                               onPressed: () {
//                                 setState(() {
//                                   _isPasswordVisible = !_isPasswordVisible;
//                                 });
//                               },
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             // Nút đăng nhập
//             Positioned(
//               bottom: screenHeight * 0.05,
//               left: 0,
//               right: 0,
//               child: Center(
//                 child: ElevatedButton(
//                   onPressed: _isLoading ? null : handleLogin,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.accent,
//                     padding: EdgeInsets.symmetric(
//                       vertical: screenHeight * 0.02,
//                     ),
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     minimumSize: Size(
//                       screenWidth * 0.6,
//                       screenHeight * 0.07,
//                     ),
//                   ),
//                   child: _isLoading
//                       ? CircularProgressIndicator(color: Colors.green)
//                       : Text(
//                           'TIẾP TỤC',
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: screenWidth * 0.045,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                 ),
//               ),
//             ),
//             // Hiển thị lỗi nếu có
//             if (_errorMessage != null)
//               Positioned(
//                 bottom: screenHeight * 0.1,
//                 left: 0,
//                 right: 0,
//                 child: Center(
//                   child: Text(
//                     _errorMessage!,
//                     style: TextStyle(
//                         color: Colors.red, fontSize: screenWidth * 0.04),
//                   ),
//                 ),
//               ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/screens/auth/register/register_screen.dart';
import 'package:provider/provider.dart';

import '../../../../viewmodels/auth_viewmodel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  String? _errorMessage;

  void handleLogin() async {
    if (!mounted) return; // Kiểm tra nếu Widget đã bị unmount

    await Provider.of<AuthViewModel>(context, listen: false).login(
        context, phoneController.text.trim(), passwordController.text.trim());
  }

  @override
  void initState() {
    super.initState();
    phoneController.addListener(_updateButtonState);
    passwordController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {});
  }

  bool get _isFormFilled =>
      phoneController.text.isNotEmpty && passwordController.text.isNotEmpty;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      

      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            height: screenHeight,
            width: screenWidth,
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color.fromARGB(255, 37, 135, 162),
                  Colors.white,
                  const Color.fromARGB(255, 37, 135, 162),
                  Colors.white,
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.1),
                  CircleAvatar(
                    radius: 75,
                    child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                        Colors.blue,
                        BlendMode.srcATop,
                      ),
                      child: Image.asset(
                        'assets/images/healthcaregreen.png',
                        width: screenWidth * 2,
                        height: screenHeight * 2,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  
                  // Text(
                  //   'Vui lòng nhập số điện thoại',
                  //   style: TextStyle(
                  //     color: AppColors.neutralDarkGreen1,
                  //     fontSize: screenWidth * 0.045,
                  //     fontWeight: FontWeight.w700,
                  //   ),
                  //   textAlign: TextAlign.center,
                  // ),
                  SizedBox(height: screenHeight * 0.01),
                  Text(
                    'Chào mừng bạn đến với HEALTH CARE',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: AppColors.neutralGreen4,
                      fontSize: screenWidth * 0.07,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.04),
                  // Nhập số điện thoại
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: InputDecoration(
                      labelText: 'Nhập số điện thoại',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Nhập mật khẩu
                  TextField(
                    controller: passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      labelText: 'Mật khẩu',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.02),
                  // Hiển thị lỗi nếu có
                  if (_errorMessage != null)
                    Padding(
                      padding: EdgeInsets.only(top: screenHeight * 0.02),
                      child: Text(
                        _errorMessage!,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: screenWidth * 0.04,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  SizedBox(height: screenHeight * 0.05),
                  // Nút đăng nhập
                  ElevatedButton(
                    onPressed: !_isFormFilled ? null : handleLogin,
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _isFormFilled ? AppColors.accent : AppColors.grey4,
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
                      'ĐĂNG NHẬP',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: screenWidth * 0.045,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.1),
                  // Đăng ký tài khoản
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Bạn chưa có tài khoản?',
                        style: TextStyle(
                          color: AppColors.neutralDarkGreen1,
                          fontSize: screenWidth * 0.04,
                        ),
                      ),
                      SizedBox(width: 5),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
                        child: Text(
                          'Đăng ký',
                          style: TextStyle(
                            color: AppColors.accent,
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
