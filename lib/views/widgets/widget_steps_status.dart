import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';

class WidgetStepsStatus extends StatelessWidget {
  final String title;
  final Widget body;
  final double headerHeight; // Chiều cao theo phần trăm
  final VoidCallback? onBackPressed;
  final int currentStep; // Bước hiện tại
  final int totalSteps; // Tổng số bước

  const WidgetStepsStatus({
    super.key,
    required this.title,
    required this.body,
    this.headerHeight = 0.2, // 0.1 =10% chiều cao màn hình mặc định
    this.onBackPressed,
    required this.currentStep,
    this.totalSteps = 5, // Tổng số bước mặc định là 5
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
              child: Column(
                children: [
                  // Hàng tiêu đề
                  HeaderRow(
                    title: title,
                    onBackPressed: onBackPressed,
                  ),
                  const SizedBox(height: 16),
                  // Thanh trạng thái các bước
                  StepsStatus(
                    currentStep: currentStep,
                    totalSteps: totalSteps,
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

class StepsStatus extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepsStatus({
    super.key,
    required this.currentStep,
    required this.totalSteps,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(totalSteps, (index) {
        final isActive = index < currentStep;
        final isCurrent = index == currentStep - 1;

        return Row(
          children: [
            // Vòng tròn trạng thái
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: isActive
                    ? AppColors.neutralWhite
                    : AppColors.neutralWhite.withOpacity(0.5),
                shape: BoxShape.circle,
                border: Border.all(
                  color: isCurrent
                      ? AppColors.neutralWhite
                      : Colors.transparent,
                  width: 2.0,
                ),
              ),
              child: Center(
                child: Icon(
                  Icons.check,
                  size: 16,
                  color: isActive ? AppColors.accent : Colors.transparent,
                ),
              ),
            ),

            // Đường nối
            if (index < totalSteps - 1)
              Container(
                width: 40,
                height: 2,
                color: isActive
                    ? AppColors.neutralWhite
                    : AppColors.neutralGrey3
              ),
          ],
        );
      }),
    );
  }
}
