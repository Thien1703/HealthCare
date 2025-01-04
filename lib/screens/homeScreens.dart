import 'package:flutter/material.dart';

class HomeScreens extends StatefulWidget {
  const HomeScreens({super.key});

  @override
  _HomeScreensState createState() => _HomeScreensState();
}

class _HomeScreensState extends State<HomeScreens> {
  int _selectedIndex = 0;

  // Chuyển đổi màn hình dựa trên chỉ mục đã chọn
  Widget _getBody() {
    switch (_selectedIndex) {
      case 0:
        return Center(child: Text('Tính năng đang được phát triển'));
      case 1:
        return Center(child: Text('Tính năng đang được phát triển'));
      case 2:
        return Center(child: Text('Tính năng đang được phát triển'));
      case 3:
        return Center(child: Text('Tính năng đang được phát triển'));
      default:
        return Center(child: Text('Tính năng đang được phát triển'));
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: _getBody(), // Chuyển đổi thân màn hình
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(40.0),
          topRight: Radius.circular(40.0),
        ),
        child: BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            const BottomNavigationBarItem(
              icon: Icon(Icons.account_circle),
              label: 'Bản đồ',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Đặt khám',
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.medical_services),
              label: 'Phiếu khám',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/chatbot.png'),
              label: 'ChatBot',
            ),
            BottomNavigationBarItem(
              icon: Image.asset('assets/images/map.png'),
              label: 'Tài khoản',
            ),
          ],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          selectedItemColor: const Color.fromARGB(255, 22, 211, 31),
          selectedIconTheme: const IconThemeData(
            color: Colors.green, // Màu sắc của biểu tượng khi được chọn
            size: 40,
          ),
          backgroundColor: Colors.green,
          unselectedItemColor: const Color.fromARGB(255, 70, 66, 66),
          showUnselectedLabels: true,
        ),
      ),
    );
  }
}
