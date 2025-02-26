import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/screens/clinic/clinic_screen.dart';
import 'package:health_care/views/screens/home/modelHome/modelHomePage.dart';
import 'package:health_care/views/screens/home/screens/service_list.dart';
import 'package:health_care/views/screens/home/widgetHomePage/CircleButton.dart';
import 'package:health_care/views/screens/home/widgetHomePage/search_textFied.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: const [
              AppBar(),
              Body(),
            ],
          ),
        ),
      ),
    );
  }
}

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10, left: 20, right: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Dịch vụ",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              // TextButton(
              //   onPressed: () {},
              //   child: Text(
              //     "See All",
              //     style: Theme.of(context)
              //         .textTheme
              //         .bodyMedium
              //         ?.copyWith(color: const Color.fromARGB(255, 49, 33, 223)),
              //   ),
              // )
            ],
          ),
        ),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 8,
          ),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Số cột trong lưới là 2
            childAspectRatio: 0.9, // Tỷ lệ chiều rộng / chiều cao của card
            crossAxisSpacing: 12, // Khoảng cách ngang giữa các card
            mainAxisSpacing: 24, // Khoảng cách dọc giữa các card
          ),
          itemBuilder: (context, index) {
            return CategoryCard(
              category: categoryList[index],
            );
          },
          itemCount: categoryList.length,
        ),
      ],
    );
  }
}

class CategoryCard extends StatelessWidget {
  final Category category;
  const CategoryCard({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // Trong file button chuyển màn hình
        GestureDetector(
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              ServiceListScreen(), // Đúng nếu không cần scroll tới category cụ thể
        ),
      ),
      child: Container(
        padding: const EdgeInsets.symmetric(
            horizontal: 8, vertical: 8), // Giảm padding
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15), // Giảm border radius
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 3.0, // Giảm blur để shadow bớt lớn
              spreadRadius: 0.2,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10), // Bo góc hình ảnh
              child: Image.asset(
                category.thumbnail,
                height: 70.0, // Giảm kích thước hình ảnh
                width: 70.0,
                fit: BoxFit.cover, // Giúp hình ảnh gọn hơn
              ),
            ),
            const SizedBox(height: 8), // Giảm khoảng cách
            Text(
              category.name,
              textAlign: TextAlign.center, // Căn giữa text
              style: const TextStyle(
                fontSize: 10, // Giảm font size
                fontWeight: FontWeight.w500,
              ),
              maxLines: 2, // Giới hạn số dòng hiển thị
              overflow: TextOverflow.ellipsis, // Nếu quá dài sẽ có dấu "..."
            ),
          ],
        ),
      ),
    );
  }
}

class AppBar extends StatelessWidget {
  const AppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: const [0.1, 0.5],
          colors: [
            AppColors.accent, // Thay thế màu đầu tiên bằng AppColor.primary
            AppColors.accent
                .withOpacity(0.8), // Giảm độ đậm nhạt cho hiệu ứng gradient
          ],
        ),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: "Chào mừng bạn đến với,\n",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.black87, // Màu chữ tối để dễ đọc
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    TextSpan(
                      text: "Phòng khám FPT",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            foreground: Paint()
                              ..shader = const LinearGradient(
                                colors: [
                                  Color(0xFF005BAC), // Xanh dương
                                  Color.fromARGB(255, 9, 107, 32), // Xanh lá
                                  Color(0xFFFFA500), // Cam
                                ],
                                stops: [0.2, 0.5, 0.8], // Điều chỉnh vị trí màu
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ).createShader(
                                const Rect.fromLTWH(0.0, 0.0, 300.0,
                                    100.0), // Tăng kích thước để gradient rõ hơn
                              ),
                          ),
                    ),
                  ],
                ),
              ),
              CircleButton(
                icon: Icons.notifications,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ClinicScreen()),
                  );
                },
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          const SearchTextField()
        ],
      ),
    );
  }
}
