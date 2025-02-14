import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return WidgetHeaderBody(
      title: "Chỉnh sửa thông tin",
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildTextField("Họ và tên", "NGUYỄN HỮU THIỆN"),
            const SizedBox(height: 10),
            _buildPhoneField(),
            const SizedBox(height: 10),
            _buildTextField("Mật khẩu mới", "Nhập mật khẩu", isPassword: true),
            const SizedBox(height: 10),
            _buildTextField("Nhập lại mật khẩu", "Nhập lại mật khẩu", isPassword: true),
            const SizedBox(height: 10),
            _buildTextField("Email", "Nhập email"),
            const SizedBox(height: 20),
            _buildUpdateButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, String hint, {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
        TextField(
          obscureText: isPassword,
          decoration: InputDecoration(
            hintText: hint,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
      ],
    );
  }

  Widget _buildPhoneField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Số điện thoại", style: TextStyle(fontWeight: FontWeight.bold)),
        TextField(
          keyboardType: TextInputType.phone,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.flag, color: Colors.red),
                  SizedBox(width: 5),
                  Text("+84", style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            hintText: "0901492845",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
          ),
        ),
      ],
    );
  }

  Widget _buildUpdateButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.grey.shade400,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        child: const Text("Cập nhật", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
