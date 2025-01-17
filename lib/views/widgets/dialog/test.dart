import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0; // Chỉ mục của màn hình hiện tại
  String newTitle = 'Home nè';

  // Danh sách các màn hình
  final List<Widget> _screens = [
    HomeScreen(),
    UserScreen(),
    NotiScreen(),
    ProfileScreen(),
  ];

  void navigateToScreen(int index, String title) {
    setState(() {
      _currentIndex = index;
      newTitle = title;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(newTitle),
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Hàng chứa các icon
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                icon: const Icon(Icons.home),
                color: _currentIndex == 0 ? Colors.blue : Colors.grey,
                onPressed: () => navigateToScreen(0, 'Home nè'),
              ),
              IconButton(
                icon: const Icon(Icons.person),
                color: _currentIndex == 1 ? Colors.blue : Colors.grey,
                onPressed: _currentIndex == 0
                    ? null
                    : () => navigateToScreen(1, 'User nè'),
              ),
              IconButton(
                icon: const Icon(Icons.notifications),
                color: _currentIndex == 2 ? Colors.blue : Colors.grey,
                onPressed: _currentIndex <= 1
                    ? null
                    : () => navigateToScreen(2, 'Noti nè'),
              ),
              IconButton(
                icon: const Icon(Icons.account_circle),
                color: _currentIndex == 3 ? Colors.blue : Colors.grey,
                onPressed: _currentIndex <= 2
                    ? null
                    : () => navigateToScreen(3, 'Profile nè'),
              ),
            ],
          ),
          const Divider(), // Đường phân cách
          Expanded(
            // Hiển thị màn hình tương ứng
            child: _screens[_currentIndex],
          ),
        ],
      ),
    );
  }
}

// Các màn hình riêng lẻ

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainScreenState = context.findAncestorStateOfType<_MainScreenState>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Đây là màn home',
            style: TextStyle(fontSize: 20),
          ),
          OutlinedButton(
            onPressed: () {
              mainScreenState?.navigateToScreen(1, 'User nè');
            },
            child: const Text('Qua màn user'),
          ),
        ],
      ),
    );
  }
}

class UserScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainScreenState = context.findAncestorStateOfType<_MainScreenState>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Đây là màn user',
            style: TextStyle(fontSize: 20),
          ),
          OutlinedButton(
            onPressed: () {
              mainScreenState?.navigateToScreen(2, 'Noti nè');
            },
            child: const Text('Qua màn noti'),
          ),
        ],
      ),
    );
  }
}

class NotiScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainScreenState = context.findAncestorStateOfType<_MainScreenState>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Đây là màn noti',
            style: TextStyle(fontSize: 20),
          ),
          OutlinedButton(
            onPressed: () {
              mainScreenState?.navigateToScreen(3, 'Profile nè');
            },
            child: const Text('Qua màn profile'),
          ),
        ],
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final mainScreenState = context.findAncestorStateOfType<_MainScreenState>();

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'Đây là màn profile',
            style: TextStyle(fontSize: 20),
          ),
          OutlinedButton(
            onPressed: () {
              mainScreenState?.navigateToScreen(0, 'Home nè');
            },
            child: const Text('Quay về Home'),
          ),
        ],
      ),
    );
  }
}
