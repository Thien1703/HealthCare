import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:health_care/views/screens/welcome/splash_screen.dart';
import '../services/local_storage_service.dart';
import '../views/screens/home/home_screens.dart';
import 'api_service.dart';

class AuthViewModel with ChangeNotifier {
  /// Đăng nhập
  Future<void> login(BuildContext context, String phone, String password) async {
    String? errorMessage = await ApiService.login(phone, password);

    if (!context.mounted) return; // 🔹 Kiểm tra State còn tồn tại không

    if (errorMessage == null) {
      // Lấy token đã lưu
      String? token = await LocalStorageService.getToken();
      print("Token đã lưu sau khi đăng nhập: $token");

      // Chuyển sang màn hình Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreens()),
      );
    } else {
      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  /// Đăng ký
  Future<void> register(BuildContext context, String fullName, String phoneNumber, String password) async {
    String? errorMessage = await ApiService.register(fullName, phoneNumber, password);

    if (!context.mounted) return; // 🔹 Kiểm tra State còn tồn tại không

    if (errorMessage == null) {
      // Lấy token đã lưu
      String? token = await LocalStorageService.getToken();
      print("Token đã lưu sau khi đăng ký: $token");

      // Chuyển sang màn hình Home
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreens()),
      );
    } else {
      Fluttertoast.showToast(
        msg: errorMessage,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }

  /// Đăng xuất
  Future<void> signOut(BuildContext context) async {
    String? errorMessage = await ApiService.logout();

    if (!context.mounted) return; // 🔹 Kiểm tra State còn tồn tại không

    if (errorMessage == null) {
      print("Token đã bị xóa thành công!");
      await LocalStorageService.deleteToken(); // Xóa token

      Fluttertoast.showToast(
        msg: "Đăng xuất thành công!",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.green,
        textColor: Colors.white,
      );

      // Chuyển về màn hình Splash
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const SplashScreen()),
        (route) => false,
      );
    } else {
      Fluttertoast.showToast(
        msg: "Lỗi khi đăng xuất: $errorMessage",
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
      );
    }
  }
}
