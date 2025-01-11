import 'package:flutter/material.dart';
import 'package:health_care/views/widgets/widget_steps_status.dart';

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

class AppointmentBody extends StatelessWidget {
  const AppointmentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Thông tin bệnh viện
          Container(
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green, width: 1.5),
              borderRadius: BorderRadius.circular(8.0),
              color: Colors.green.shade50,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Bệnh viện Nhân Dân Gia Định',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.green,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Số 1 Nơ Trang Long, Phường 7, Quận Bình Thạnh, TP.HCM',
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),

          // Chuyên khoa
          _buildListItem(
            context,
            title: 'Chuyên khoa',
            value: 'Đông Y',
            icon: Icons.local_hospital,
            onTap: () {
              _showSpecialtyBottomSheet(context);
            },
          ),

          // Dịch vụ
          _buildListItem(
            context,
            title: 'Dịch vụ',
            value: 'Chọn dịch vụ',
            icon: Icons.medical_services,
            onTap: () {
              print('Chọn dịch vụ');
            },
          ),

          // Ngày khám
          _buildListItem(
            context,
            title: 'Ngày khám',
            value: 'Chọn ngày khám',
            icon: Icons.calendar_today,
            onTap: () {
              print('Chọn ngày khám');
            },
          ),

          // Giờ khám
          _buildListItem(
            context,
            title: 'Giờ khám',
            value: 'Chọn giờ khám',
            icon: Icons.access_time,
            onTap: () {
              print('Chọn giờ khám');
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
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.green, size: 24),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(width: 8),
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
          ],
        ),
      ),
    );
  }

  void _showSpecialtyBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Đảm bảo nội dung vừa đủ hiển thị
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Chọn chuyên khoa',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              ListTile(
                title: const Text('Đông Y'),
                onTap: () {
                  Navigator.of(context).pop(); // Đóng bottom sheet
                  print('Chọn Đông Y');
                },
              ),
              ListTile(
                title: const Text('Nội Tiết'),
                onTap: () {
                  Navigator.of(context).pop(); // Đóng bottom sheet
                  print('Chọn Nội Tiết');
                },
              ),
              ListTile(
                title: const Text('Ngoại Khoa'),
                onTap: () {
                  Navigator.of(context).pop(); // Đóng bottom sheet
                  print('Chọn Ngoại Khoa');
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
