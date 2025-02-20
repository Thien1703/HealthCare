import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool isButtonEnabled = false;

  @override
  void initState() {
    super.initState();
    _nameController.addListener(_updateButtonState);
    _phoneController.addListener(_updateButtonState);
    _passwordController.addListener(_updateButtonState);
    _confirmPasswordController.addListener(_updateButtonState);
    _emailController.addListener(_updateButtonState);
  }

  void _updateButtonState() {
    setState(() {
      isButtonEnabled = _nameController.text.isNotEmpty &&
          _phoneController.text.isNotEmpty &&
          _passwordController.text.isNotEmpty &&
          _confirmPasswordController.text.isNotEmpty &&
          _emailController.text.isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetHeaderBody(
      iconBack: true,
      title: "Chỉnh sửa thông tin",
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _customTitle("Họ và tên"),
            _customTextField(controller: _nameController, labelText: "Nhập họ và tên"),
            const SizedBox(height: 10),

            _customTitle("Số điện thoại"),
            _buildPhoneField(),

            const SizedBox(height: 10),
            _customTitle("Mật khẩu mới"),
            _customTextField(controller: _passwordController, labelText: "Nhập mật khẩu", isPassword: true),

            const SizedBox(height: 10),
            _customTitle("Nhập lại mật khẩu"),
            _customTextField(controller: _confirmPasswordController, labelText: "Nhập lại mật khẩu", isPassword: true),

            const SizedBox(height: 10),
            _customTitle("Email"),
            _customTextField(controller: _emailController, labelText: "Nhập email"),

            const SizedBox(height: 20),
            _buildUpdateButton(),
          ],
        ),
      ),
    );
  }

  Widget _customTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    );
  }

  Widget _customTextField({required TextEditingController controller, required String labelText, bool isPassword = false}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.never,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
    );
  }

  Widget _buildPhoneField() {
    return TextField(
      controller: _phoneController,
      keyboardType: TextInputType.phone,
      decoration: InputDecoration(
        prefixIcon: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset("assets/icons/vn_flag.png", width: 24, height: 16),
              const SizedBox(width: 5),
              const Text("+84", style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(width: 5),
              const Icon(Icons.arrow_drop_down, color: Colors.grey),
            ],
          ),
        ),
        hintText: "09xxxxxxxx",
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8.0)),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      ),
    );
  }

  Widget _buildUpdateButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: isButtonEnabled ? () {} : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: isButtonEnabled ? AppColors.accent : AppColors.grey4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        ),
        child: const Text("Cập nhật", style: TextStyle(color: Colors.white)),
      ),
    );
  }
}