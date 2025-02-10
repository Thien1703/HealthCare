import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

// HealthCheck model
class HealthCheck {
  final String id;
  final String name;
  final String hospital;
  final String service;
  final String department;
  final String status;

  HealthCheck({
    required this.id,
    required this.name,
    required this.hospital,
    required this.service,
    required this.department,
    required this.status,
  });

  factory HealthCheck.fromJson(Map<String, dynamic> json) {
    return HealthCheck(
      id: json['id'],
      name: json['name'],
      hospital: json['hospital'],
      service: json['service'],
      department: json['department'],
      status: json['status'],
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HealthCheckForm(),
    );
  }
}

class HealthCheckForm extends StatefulWidget {
  const HealthCheckForm({super.key});

  @override
  _HealthCheckFormState createState() => _HealthCheckFormState();
}

class _HealthCheckFormState extends State<HealthCheckForm> {
  List<HealthCheck> healthChecks = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchHealthChecks();
  }

  Future<void> fetchHealthChecks() async {
    try {
      // Using predefined healthChecks data instead of API
      final List<dynamic> data = [
        {
          "id": "1",
          "name": "Nguyen Van A",
          "hospital": "BỆNH VIỆN NHÂN DÂN GIA ĐỊNH",
          "service": "Khám Dịch Vụ Khu Vip (Tầng 2 - Phòng 201)",
          "department": "Đông Y",
          "status": "Đã thanh toán",
        },
        {
          "id": "2",
          "name": "Tran Thi B",
          "hospital": "BỆNH VIỆN NHÂN DÂN GIA ĐỊNH",
          "service": "Khám Dịch Vụ Khu Vip (Tầng 2 - Phòng 201)",
          "department": "Đông Y",
          "status": "Chưa thanh toán",
        },
        {
          "id": "3",
          "name": "Tran Thi B",
          "hospital": "BỆNH VIỆN NHÂN DÂN GIA ĐỊNH",
          "service": "Khám Dịch Vụ Khu Vip (Tầng 2 - Phòng 201)",
          "department": "Đông Y",
          "status": "Đã thanh toán",
        },
        {
          "id": "4",
          "name": "Tran Thi B",
          "hospital": "BỆNH VIỆN NHÂN DÂN GIA ĐỊNH",
          "service": "Khám Dịch Vụ Khu Vip (Tầng 2 - Phòng 201)",
          "department": "Đông Y",
          "status": "Chưa thanh toán",
        },
        {
          "id": "5",
          "name": "Tran Thi B",
          "hospital": "BỆNH VIỆN NHÂN DÂN GIA ĐỊNH",
          "service": "Khám Dịch Vụ Khu Vip (Tầng 2 - Phòng 201)",
          "department": "Đông Y",
          "status": "Đã thanh toán",
        },
        {
          "id": "6",
          "name": "Tran Thi B",
          "hospital": "BỆNH VIỆN NHÂN DÂN GIA ĐỊNH",
          "service": "Khám Dịch Vụ Khu Vip (Tầng 2 - Phòng 201)",
          "department": "Đông Y",
          "status": "Chưa thanh toán",
        },

      ];

      setState(() {
        healthChecks = data.map((e) => HealthCheck.fromJson(e)).toList();
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching data: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách phiếu khám'),
        backgroundColor: Colors.green,
      ),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: healthChecks.length,
              padding: const EdgeInsets.all(16),
              itemBuilder: (context, index) {
                final healthCheck = healthChecks[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16.0),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade200,
                          blurRadius: 6,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      'Mã đặt lịch:',
                                      style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      healthCheck.id,
                                      style: const TextStyle(
                                        fontSize: 17,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  healthCheck.name,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 17,
                                  ),
                                ),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailScreen(healthCheck: healthCheck),
                                  ),
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text(
                                    'Xem chi tiết',
                                    style: TextStyle(
                                      color: Colors.green,
                                      fontSize: 17,
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Icon(
                                    Icons.arrow_forward_ios,
                                    size: 16,
                                    color: Colors.green,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Text(
                          healthCheck.hospital,
                          style: const TextStyle(
                            color: Color.fromARGB(255, 56, 146, 59),
                            fontWeight: FontWeight.bold,
                            fontSize: 17,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Dịch vụ:',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            Expanded(
                              child: Text(
                                healthCheck.service,
                                textAlign: TextAlign.end,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 123, 145, 125),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Chuyên khoa:',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              healthCheck.department,
                              style: const TextStyle(
                                color: Color.fromARGB(255, 123, 145, 125),
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Trạng thái:',
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              healthCheck.status,
                              style: TextStyle(
                                color: healthCheck.status == 'Đã thanh toán'
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final HealthCheck healthCheck;

  const DetailScreen({super.key, required this.healthCheck});

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
