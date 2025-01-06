import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';

class WidgetHeaderBody extends StatelessWidget {
  final String title;
  final Widget body;
  final double headerHeight; // Chiều cao theo phần trăm
  final VoidCallback? onBackPressed;

  const WidgetHeaderBody({
    super.key,
    required this.title,
    required this.body,
    this.headerHeight = 0.15, // 0.1 =10% chiều cao màn hình mặc định
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    // Tính chiều cao header theo phần trăm màn hình
    final screenHeight = MediaQuery.of(context).size.height;
    final header = screenHeight * headerHeight;

    return Scaffold(
      body: Column(
        children: [
          // Header
          Container(
            width: double.infinity,
            height: header,
            color: AppColors.accent,
            child: SafeArea(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 16.0,
                    left: 10,
                    right: 0,
                    child: HeaderRow(
                      title: title,
                      onBackPressed: onBackPressed,
                    ),
                  ),
                ],
              ),
            ),
          ),
          // Body
          Expanded(
            child: body,
          ),
        ],
      ),
    );
  }
}

class HeaderRow extends StatelessWidget {
  final String title;
  final VoidCallback? onBackPressed;

  const HeaderRow({
    super.key,
    required this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon back
        IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppColors.neutralWhite,
            size: 22.0,
          ),
          onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
        ),

        // Tiêu đề
        Expanded(
          child: Center(
            child: Text(
              title,
              style: const TextStyle(
                color: AppColors.neutralWhite,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        const SizedBox(width: 48), // Tạo khoảng trống tương ứng với IconButton
      ],
    );
  }
}
