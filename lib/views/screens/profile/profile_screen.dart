import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:health_care/views/screens/auth/auth_service.dart';
import 'package:health_care/views/screens/auth/login/login_screen.dart';
import 'package:health_care/views/screens/profile/inforProfile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: screenHeight / 3,
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {},
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: AssetImage(
                            'assets/images/avt.png'), // Thay ảnh đại diện
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Hữu Thiện',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 5),
                      OutlinedButton(
                        onPressed: () async {
                          // Gọi hàm signOut của AuthService
                          await AuthService().signOut();
                          // Sau khi đăng xuất thành công, chuyển hướng về LoginScreen
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute(
                                builder: (context) => const LoginScreen()),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.white,
                          side: const BorderSide(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                        child: const Text('Đăng xuất'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              children: [
                _buildMenuItem(
                  Icons.medical_services,
                  'Hồ sơ khám bệnh',
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const InforProfileScreen()),
                    );
                  },
                ),
                _buildMenuItem(
                  Icons.account_circle,
                  'Thông tin tài khoản',
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const InforProfileScreen()),
                    );
                  },
                ),
                _buildMenuItem(
                  Icons.lock,
                  'Chính sách bảo mật',
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const InforProfileScreen()),
                    );
                  },
                ),
                _buildMenuItem(
                  Icons.info,
                  'Phiên bản ứng dụng v1.2',
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const InforProfileScreen()),
                    );
                  },
                ),
                _buildMenuItem(
                  Icons.star,
                  'Đánh giá',
                  () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (context) => const InforProfileScreen()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String text, VoidCallback onTap) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ListTile(
        leading: Icon(icon, color: Colors.green),
        title: Text(text),
        onTap: onTap,
      ),
    );
  }
}
