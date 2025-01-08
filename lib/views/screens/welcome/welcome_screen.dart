import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

// Chuyển màn hình 3 giây
class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => FirstPage()),
      );
    });

    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Image.asset('assets/images/Frame.png'),
      ),
    );
  }
}

final List<Map<String, String>> items = [
  {
    "image": "assets/images/Picture1.png",
    "text1": "Tiện Ích",
    "text2": "Tối ưu hóa trải nghiệm người dùng với các công cụ hiện đại",
  },
  {
    "image": "assets/images/Picture2.png",
    "text1": "Thuận Lợi",
    "text2": "Dễ dàng tiếp cận và sử dụng mọi lúc, mọi nơi ",
  },
  {
    "image": "assets/images/Picture3.png",
    "text1": "Chủ Động",
    "text2": "Kiểm soát thời gian và lịch trình của bạn hiệu quả hơn",
  },
];

class FirstPage extends StatefulWidget {
  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  bool isLastSlide = false; // Trạng thái xác định là slide cuối cùng
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 243, 213),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CarouselSlider(
              options: CarouselOptions(
                height: 400.0,

                autoPlay: true, // Tắt autoPlay
                enlargeCenterPage: true,
                viewportFraction: 1.0,
                enableInfiniteScroll: false, // Không cho phép cuộn vô hạn
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                    isLastSlide =
                        (index == items.length - 1); // Kiểm tra slide cuối cùng
                  });
                },
              ),
              items: items.map((item) {
                return Builder(
                  builder: (BuildContext context) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10.0),
                          child: Image.asset(
                            item["image"]!,
                            fit: BoxFit.cover,
                            width: MediaQuery.of(context).size.width,
                            height: 250,
                          ),
                        ),
                        const SizedBox(height: 15),
                        Text(
                          item["text1"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          item["text2"]!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18.0,color: Color.fromARGB(255, 96, 190, 99)
                          ),
                        ),
                      ],
                    );
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(
                    horizontal: 32.0, vertical: 16.0),
              ),
              onPressed: () {
                if (isLastSlide) {
                  
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationPage()),
                  );
                } else {
                  // Nếu không phải slide cuối, di chuyển sang slide tiếp theo
                  setState(() {
                    currentIndex++;
                  });
                }
              },
              child: isLastSlide
                  ? const Text(
                      "ĐĂNG KÝ",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    )
                  : Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text(
                          "TIẾP",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Image.asset(
                          'assets/images/Vector.png',
                          width:
                              20, // Điều chỉnh kích thước ảnh để vừa giao diện
                          height: 20,
                        ),
                      ],
                    ),
            ),
            const SizedBox(height: 20),
            // Hiển thị dòng văn bản "Bạn đã có tài khoản?" và "Đăng nhập" dưới nút
            if (isLastSlide)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Bạn đã có tài khoản?'),
                  const SizedBox(width: 5),
                  TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginPage()),
                      );
                    },
                    child: const Text(
                      "Đăng nhập",
                      style: TextStyle(
                        color: Colors.green,
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class RegistrationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Registration Page")),
      body: const Center(child: Text("Welcome to Registration Page")),
    );
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: const Center(child: Text("Welcome to Login Page")),
    );
  }
}
