import 'package:flutter/material.dart';
import 'package:health_care/views/screens/home/home_screens.dart';

final List<Map<String, String>> items = [
  {
    "image": "assets/images/Picture1.png",
    "text1": "Tiện Ích",
    "text2": "Tối ưu hóa trải nghiệm người dùng với các công cụ hiện đại",
  },
  {
    "image": "assets/images/Picture2.png",
    "text1": "Thuận Lợi",
    "text2": "Dễ dàng tiếp cận và sử dụng mọi lúc, mọi nơi",
  },
  {
    "image": "assets/images/Picture3.png",
    "text1": "Chủ Động",
    "text2": "Kiểm soát thời gian và lịch trình của bạn hiệu quả hơn",
  },
];

class WelcomeScreen extends StatefulWidget {
  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final PageController _pageController = PageController();
  bool isLastSlide = false;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();

    // Tự động chuyển slide
    Future.delayed(const Duration(seconds: 3), _autoPlaySlides);
  }

  void _autoPlaySlides() {
    if (!isLastSlide) {
      _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
      Future.delayed(const Duration(seconds: 3), _autoPlaySlides);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 216, 243, 213),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 400,
              child: PageView.builder(
                controller: _pageController,
                itemCount: items.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                    isLastSlide = (index == items.length - 1);
                  });
                },
                itemBuilder: (context, index) {
                  final item = items[index];
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
                          fontSize: 18.0,
                          color: Color.fromARGB(255, 96, 190, 99),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
              ),
              onPressed: () {
                if (isLastSlide) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreens()),
                  );
                } else {
                  _pageController.nextPage(duration: const Duration(milliseconds: 300), curve: Curves.easeInOut);
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
                  : const Text(
                      "TIẾP",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
