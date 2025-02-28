import 'package:flutter/material.dart';
// import 'package:health_care/views/screens/HealthCheckForm/detail_health_check_screen.dart';

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

class HealthCheckForm extends StatefulWidget {
  const HealthCheckForm({super.key});

  @override
  _HealthCheckFormState createState() => _HealthCheckFormState();
}

class _HealthCheckFormState extends State<HealthCheckForm> {
  List<HealthCheck> healthChecks = [];
  List<HealthCheck> filteredHealthChecks = [];
  bool isLoading = true;
  String selectedStatus = 'Tất cả';
  final List<String> statuses = [
    'Tất cả',
    'Đã thanh toán',
    'Chưa thanh toán',
    'Đã khám',
    'Đã hủy'
  ];

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

  void filterByStatus(String status) {
    setState(() {
      selectedStatus = status;
      if (status == 'Tất cả') {
        filteredHealthChecks = List.from(healthChecks);
      } else {
        filteredHealthChecks = healthChecks
            .where((element) => element.status == status)
            .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Danh sách phiếu khám',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
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
                                        DetailHealthCheckScreen(
                                            healthCheck: healthCheck),
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
