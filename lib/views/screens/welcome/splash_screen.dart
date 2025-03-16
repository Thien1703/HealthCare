//Test
import 'package:flutter/material.dart';
import 'package:health_care/views/screens/welcome/welcome_screen.dart';
import '../../../services/local_storage_service.dart';
import '../auth/login/login_screen.dart';
import '../home/home_screens.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkFirstTime();
    _checkLoginStatus();
  }

  Future<void> _checkFirstTime() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!mounted) return; // Kiểm tra nếu widget đã bị hủy
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => WelcomeScreen()),
    );
  }

  // Kiểm tra trạng thái đăng nhập
  Future<void> _checkLoginStatus() async {
    bool isLoggedIn = await LocalStorageService.isLoggedIn();

    // Nếu đã đăng nhập → chuyển sang Home, nếu chưa → về Login
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) =>
                isLoggedIn ? const HomeScreens() : const LoginScreen()),
      );
    });
  }

@override
  Widget build(BuildContext context) {
    // Get the screen width and height using MediaQuery
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Container(
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
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
              const SizedBox(height: 20.0),
              const Text(
                'HEALTH CARE',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}