import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ThanhToanScreen(),
    );
  }
}

class ThanhToanScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thanh toán thành công'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _showDetailsBottomSheet(context);
          },
          child: Text('Xem thông tin lịch khám'),
        ),
      ),
    );
  }

  void _showDetailsBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      isScrollControlled: true, // Cho phép cuộn khi nội dung dài
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            // Cho phép cuộn khi nội dung dài
            child: Column(
              mainAxisSize: MainAxisSize.min, // Chỉ chiếm không gian cần thiết
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
                SizedBox(width: 10),
                Row(
                  children: [
                    IconButton(
                      icon: Image.asset('assets/images/Icon.png'),
                      iconSize: 48,
                      onPressed: () {
                        Navigator.pop(context); // Đóng dialog
                      },
                    ),
                    SizedBox(width: 55), // Khoảng cách ngang giữa Image và Text
                    Text(
                      'Thanh toán thành công',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  'Cảm ơn bạn đã sử dụng dịch vụ của chúng tôi.',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 3),
                Text(
                  'Dưới đây là thông tin chi tiết về lịch khám của bạn:',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                SizedBox(height: 20),
                _buildInfoRow('Mã đặt lịch:', '4F450TY'),
                _buildInfoRow('Chuyên gia:', 'Đông Y'),
                _buildInfoRow('Dịch vụ đã đặt:', 'Khám Dịch Vụ Khu Vip'),
                _buildInfoRow('Thời gian khám:', '03/01/2025 (08:00 - 09:00)'),
                _buildInfoRow('Địa điểm:', 'Bệnh viện Nhân dân Gia Định'),
                _buildInfoRow('Số tiền thanh toán:', '427,000 VNĐ'),
                SizedBox(height: 20),
                Center(
                  child: Column(
                    children: [
                      Image.asset('assets/images/Qrcode.png'),
                      SizedBox(height: 10),
                      Text(
                        'Chụp màn hình để lưu giữ',
                        style: TextStyle(
                          fontSize: 16,
                          color: const Color.fromARGB(255, 250, 155, 13),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(
                          255, 32, 128, 23), // Màu nền cho nút
                      padding: EdgeInsets.symmetric(
                          horizontal: 120,
                          vertical: 12), // Khoảng cách bên trong nút
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8), // Bo góc nút
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'Xem lịch đặt',
                      style: TextStyle(
                        color: Colors.white, // Màu chữ
                        fontSize: 18, // Kích thước chữ
                        fontWeight: FontWeight.bold, // Kiểu chữ đậm
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: const Color.fromARGB(255, 122, 168, 123),
              fontSize: 17,
            ),
          ),
          SizedBox(
            width: 5,
          ),
          Text(
            value,
            style: TextStyle(
              fontSize: 17,
              color: const Color.fromARGB(255, 50, 54, 50),
            ),
          ),
        ],
      ),
    );
  }
}
