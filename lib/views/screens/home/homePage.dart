import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/viewmodels/api/api_service.dart';
import 'package:health_care/models/specialty.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:health_care/views/screens/BMI/measureBMI_Screen.dart';
import 'package:health_care/views/screens/home/service_screen.dart';
import 'package:health_care/viewmodels/api/specialty_api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  List<Specialty>? specialties;

  @override
  void initState() {
    super.initState();
    fetchSpecialties();
  }

  void fetchSpecialties() async {
    List<Specialty>? data = await SpecialtyApi.getAllSpecialty();
    setState(() {
      specialties = data;
    });
  }
  List<String> imgList = [
    'assets/images/slide1.jpg',
    'assets/images/slide2.jpg',
    'assets/images/slide3.jpg',
   
  ];

  @override
  Widget build(BuildContext context) {
    // bool isWideScreen = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
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
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 35),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25,
                      child: ColorFiltered(
                        colorFilter: ColorFilter.mode(
                          Colors.blue, // Thay đổi màu thành màu xanh
                          BlendMode.srcATop, // Chọn chế độ pha trộn
                        ),
                        child: Image.asset(
                          'assets/images/healthcaregreen.png',
                          width: 70,
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Chào mừng đến với phòng khám FPT',
                        softWrap: true,
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    SizedBox(width: 70),
                  ],
                ),
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 15),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Tìm kiếm chuyên khoa/dịch vụ',
                          style: TextStyle(color: Colors.black54)),
                      Icon(Icons.search, color: Colors.blue),
                    ],
                  ),
                ),

                Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _buildFeatureButton(
                        'Xem bản đồ',
                        Icons.map,
                        () {},
                      ),
                      _buildFeatureButton('Chat AI', Icons.chat, () {}),
                      _buildFeatureButton('Đo BMI', Icons.fitness_center, () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MeasurebmiScreen()));
                      }),
                    ],
                  ),
                  
                ),
                CarouselSlider(
                  options: CarouselOptions(
                    height: 200.0,
                    autoPlay: true,
                    // enlargeCenterPage: true,
                    aspectRatio: 14 / 9,
                    viewportFraction: 1.0,
                  ),
                  items: imgList.map((item) => Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(item, fit: BoxFit.fill,), 
                    ),
                  )).toList(),
                ),
               

                
                Text(
                  'Chuyên khoa',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(255, 75, 75, 75),
                  ),
                ),

                
                specialties != null
                  ? Container(
                      height: 300, 
                      child: GridView.builder(
                        scrollDirection: Axis.horizontal, 
                        shrinkWrap: true,
                         physics: const BouncingScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2, 
                          crossAxisSpacing: 10, 
                          mainAxisSpacing: 10, 
                        ),
                        itemCount: specialties!.length,
                        itemBuilder: (context, index) {
                          final specialty = specialties![index];
                          return InkWell(
                            onTap: () {
                              print(specialty.id);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      ServiceScreen(specialtyId: specialty.id),
                                ),
                              );
                            },
                            child: Card(
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Hình vuông với nền trắng
                                  Container(
                                    width: 90, // Đặt chiều rộng cho hình vuông
                                    height: 90, // Đặt chiều cao cho hình vuông
                                    color: Colors.white, // Nền trắng
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.network(
                                        specialty.image ??
                                            'https://example.com/default-image.png',
                                        width: 70, // Chiều rộng
                                        height: 70, // Chiều cao
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 8), // Khoảng cách giữa hình ảnh và chữ
                                  // Tên chuyên khoa
                                  Text(
                                    specialty.name,
                                    style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.blue.shade800,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
              ]
            ),
          ),
        ),
      ),
    );
  }

  // Widget cho các nút chức năng chính
  Widget _buildFeatureButton(String text, IconData icon, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          CircleAvatar( 
            radius: 25,
            backgroundColor: const Color.fromARGB(255, 37, 135, 162),
            child: Icon(icon, color: const Color.fromARGB(255, 255, 255, 255)),
          ),
          const SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
                fontSize: 12, color: const Color.fromARGB(255, 27, 137, 154)),
          ),
        ],
      ),
    );
  }
}
