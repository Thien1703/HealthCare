import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';

class WidgetHeaderBody extends StatelessWidget {
  final String title;
  final Widget body;
  final double headerHeight;
  final VoidCallback? onBackPressed;
  final Widget? selectedIcon;

  const WidgetHeaderBody({
    super.key,
    required this.title,
    required this.body,
    this.headerHeight = 0.13,
    this.onBackPressed,
    this.selectedIcon,
  });

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final header = screenHeight * headerHeight;

    return Scaffold(
        body: Column(children: [
      Container(
        width: double.infinity,
        height: header,
        color: AppColors.accent,
        child: SafeArea(
            child: Column(children: [
          SizedBox(height: 20),
          HeaderRow(
            title: title,
            onBackPressed: onBackPressed,
          ),
          if (selectedIcon != null) SizedBox(height: 5),
          Container(child: selectedIcon)
        ])),
      ),
      Expanded(child: body)
    ]));
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
        IconButton(
            icon: Icon(Icons.arrow_back,
                color: AppColors.neutralWhite, size: 22.0),
            onPressed: onBackPressed ?? () => Navigator.of(context).pop()),
        Expanded(
          child: Center(
              child: Text(
            title,
            style: const TextStyle(
                color: AppColors.neutralWhite,
                fontSize: 22,
                fontWeight: FontWeight.bold),
          )),
        ),
        const SizedBox(width: 48) // Tạo khoảng trống tương ứng với IconButton
      ],
    );
  }
}
