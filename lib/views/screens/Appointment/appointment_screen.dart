import 'package:flutter/material.dart';
import 'package:health_care/main.dart';
import 'package:health_care/views/widgets/widget_steps_status.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: AppointmentScreen(),
    );
  }
}

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return WidgetStepsStatus(
      title: 'Chọn thông tin khám',
      body: const AppointmentBody(),
      currentStep: 1,
      totalSteps: 4,
      onBackPressed: () {
        print("Back button pressed");
      },
    );
  }
}

class AppointmentBody extends StatefulWidget {
  const AppointmentBody({super.key});

  @override
  _AppointmentBodyState createState() => _AppointmentBodyState();
}

class _AppointmentBodyState extends State<AppointmentBody> {
  // Tạo TextEditingController để quản lý nội dung TextField
  TextEditingController _specialityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thông tin bệnh viện
          Container(
            width: double.infinity,
            margin: const EdgeInsets.only(bottom: 12.0),
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
            decoration: BoxDecoration(
              border: Border.all(
                  color: const Color.fromARGB(255, 69, 184, 31), width: 1.7),
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Bệnh viện Nhân Dân Gia Định',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Số 1 Nơ Trang Long, Phường 7, Quận Bình Thạnh, TP.HCM',
                  style: TextStyle(
                    fontSize: 14,
                    color: Color.fromARGB(255, 200, 195, 195),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          Text(
            'Chuyên khoa',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),

          // Chuyên khoa
          _buildListItem(
            context,
            title: 'Chọn chuyên khoa',
            value: _specialityController.text, // Lấy giá trị đã chọn
            icon: Icons.local_hospital,
            onTap: () {
              _showDetailsBottomSheet(context); // Mở bottom sheet
            },
          ),

          Text(
            'Dịch vụ',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),

          // Dịch vụ
          _buildListItem(
            context,
            title: 'Chọn dịch vụ',
            value: '',
            icon: Icons.medical_services,
            onTap: () {
              print('Chọn dịch vụ');
            },
          ),
          Text(
            'Ngày khám',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),

          // Ngày khám
          _buildListItem(
            context,
            title: 'Chọn ngày khám',
            value: '',
            icon: Icons.calendar_today,
            onTap: () {
              print('Chọn ngày khám');
            },
          ),

          Text(
            'Giờ khám',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
          ),

          // Giờ khám
          _buildListItem(
            context,
            title: 'Chọn giờ khám',
            value: '',
            icon: Icons.access_time,
            onTap: () {
              _showDetailBottomSheetHours(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(
    BuildContext context, {
    required String title,
    required String value,
    required IconData icon,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 12.0),
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
        decoration: BoxDecoration(
          border: Border.all(
              color: const Color.fromARGB(255, 69, 184, 31), width: 1.7),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.grey.shade400, size: 28),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Color.fromARGB(255, 200, 195, 195),
                ),
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Color.fromARGB(255, 200, 195, 195),
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  //CHỌN CHUYÊN KHOA

  void _showDetailsBottomSheet(BuildContext context) {
    final List<String> specialities = [
      'Đông Y',
      'Can Thiệp Mạch Máu - U Gan',
      'Da liễu',
      'Cơ Xương Khớp',
      'Gan Mật Tụy',
    ]; // Danh sách chuyên khoa
    String searchKeyword = ''; // Từ khóa tìm kiếm

    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            // Lọc danh sách chuyên khoa
            final filteredSpecialities = specialities
                .where((speciality) => speciality
                    .toLowerCase()
                    .contains(searchKeyword.toLowerCase()))
                .toList();

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 50,
                      height: 5,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      IconButton(
                        icon: Image.asset('assets/images/Icon.png'),
                        iconSize: 48,
                        onPressed: () {
                          Navigator.pop(context); // Đóng BottomSheet
                        },
                      ),
                      SizedBox(width: 57),
                      const Text(
                        'Chọn chuyên khoa',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 45, 59, 45),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // TextField tìm kiếm
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Tìm nhanh chuyên khoa...',
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.blue),
                      ),
                      filled: true,
                      fillColor: const Color.fromARGB(255, 222, 219, 219),
                    ),
                    style: const TextStyle(
                      color: Color.fromARGB(255, 41, 105, 40),
                      fontSize: 16,
                    ),
                    onChanged: (value) {
                      setState(() {
                        searchKeyword = value;
                      });
                    },
                  ),
                  const SizedBox(height: 12),

                  // Hiển thị danh sách chuyên khoa
                  Expanded(
                    child: ListView.builder(
                      itemCount: filteredSpecialities.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 12.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.blue,
                              width: 0.5,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                            color: Colors.white,
                          ),
                          child: ListTile(
                            title: Text(
                              filteredSpecialities[index],
                              style: const TextStyle(
                                color: Color.fromARGB(255, 45, 59, 45),
                                fontSize: 19.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onTap: () {
                              // Đóng bottom sheet
                              Navigator.of(context).pop();
                              // Cập nhật giá trị vào controller và làm mới giao diện
                              setState(() {
                                _specialityController.text =
                                    filteredSpecialities[index];
                              });
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

// CHỌN GIỜ KHÁM
  void _showDetailBottomSheetHours(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.0),
        ),
      ),
      backgroundColor: Colors.white,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: Image.asset('assets/images/Icon.png'),
                      iconSize: 48,
                      onPressed: () {
                        Navigator.pop(context); // Đóng BottomSheet
                      },
                    ),
                    SizedBox(width: 57),
                    Text(
                      'Chọn giờ khám',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 16),
                Text(
                  'Buổi sáng',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: _buildTimeSlots(timeSlotsMorning),
                ),
                SizedBox(height: 16),
                Text(
                  'Buổi chiều',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(height: 8),
                Center(
                  child: _buildTimeSlots(timeSlotsAfternoon),
                ),
                SizedBox(height: 16),
                Text(
                  'Tất cả thời gian theo múi giờ Việt Nam GMT+7',
                  style: TextStyle(
                    fontSize: 14,
                    color: const Color.fromARGB(255, 215, 101, 44),
                  ),
                ),
                SizedBox(
                    height: MediaQuery.of(context)
                        .viewInsets
                        .bottom), // Đảm bảo khoảng trống với bàn phím
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildTimeSlots(List<String> timeSlots) {
    return Wrap(
      spacing: 15,
      runSpacing: 15,
      alignment: WrapAlignment.center,
      children: timeSlots.map((time) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 18, vertical: 13),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Text(
            time,
            style: TextStyle(
              fontSize: 15,
              color: const Color.fromARGB(255, 42, 140, 46),
            ),
          ),
        );
      }).toList(),
    );
  }

  final List<String> timeSlotsMorning = [
    '06:00 - 07:00',
    '07:00 - 08:00',
    '08:00 - 09:00',
    '09:00 - 10:00',
    '10:00 - 11:00',
    '11:00 - 11:30',
  ];

  final List<String> timeSlotsAfternoon = [
    '12:00 - 13:00',
    '13:00 - 14:00',
    '14:00 - 15:00',
    '15:00 - 16:00',
    '16:00 - 17:00',
    '17:00 - 17:30',
  ];
}
