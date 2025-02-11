import 'package:flutter/material.dart';
import 'package:health_care/views/screens/HealthCheckForm/health_check.dart';
import 'package:qr_flutter/qr_flutter.dart';

class DetailHealthCheckScreen extends StatelessWidget {
  final HealthCheck healthCheck;
  const DetailHealthCheckScreen({super.key, required this.healthCheck});


  @override
  Widget build(BuildContext context) {
    String qrdata =
        ('Mã đặt lịch: ${healthCheck.id}\nBệnh nhân: ${healthCheck.name}\nBệnh viện: ${healthCheck.hospital}\nDịch vụ: ${healthCheck.service}\nChuyên khoa: ${healthCheck.department}\nTrạng thái: ${healthCheck.status}');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Chi tiết phiếu khám'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 2,
                  blurRadius: 6,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RichText(
                  text: TextSpan(
                    text: 'Mã đặt lịch: ',
                    style: const TextStyle(
                        fontSize: 18, color: Color.fromARGB(255, 112, 189, 91)),
                    children: [
                      TextSpan(
                        text: healthCheck.id,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 54, 54, 55),
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: 'Chuyên khoa: ',
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 112, 189, 91)),
                    children: [
                      TextSpan(
                        text: healthCheck.department,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 54, 54, 55)),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: 'Dịch vụ: ',
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 112, 189, 91)),
                    children: [
                      TextSpan(
                        text: healthCheck.service,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 54, 54, 55)),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                RichText(
                  text: TextSpan(
                    text: 'Thời gian: ',
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 112, 189, 91)),
                    children: [
                      TextSpan(
                        // text: healthCheck.hospital,
                        text: "03/01/2025 (08:00 - 09:00)",
                        style: const TextStyle(
                            color: Color.fromARGB(255, 54, 54, 55)),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                RichText(
                  text: TextSpan(
                    text: 'Địa điểm: ',
                    style: const TextStyle(
                        fontSize: 16, color: Color.fromARGB(255, 112, 189, 91)),
                    children: [
                      TextSpan(
                        text: healthCheck.hospital,
                        style: const TextStyle(
                            color: Color.fromARGB(255, 54, 54, 55)),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 8),

                const SizedBox(height: 16),
                // QR Code display
                if (qrdata.isNotEmpty)
                  Center(
                    child: QrImageView(
                      data: qrdata,
                      version: QrVersions.auto,
                      size: 200,
                      gapless: false,
                    ),
                  )
                else
                  const Text('No data available for QR code'),
                const SizedBox(height: 8),
                const Center(
                  child: Text(
                    'Chụp màn hình để lưu giữ',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFFFFA500),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Logic xử lý khi bấm nút
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Màu nền
                        foregroundColor: Colors.white, // Màu chữ
                      ),
                      child: const Text('Hủy lịch'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // Logic xử lý khi bấm nút
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green, // Màu nền
                        foregroundColor: Colors.white, // Màu chữ
                      ),
                      child: const Text('Đổi lịch'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}