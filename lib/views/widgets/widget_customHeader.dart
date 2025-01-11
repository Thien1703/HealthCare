import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';

class WidgetCustomheader extends StatelessWidget {
  const WidgetCustomheader({
    super.key,
    required this.title,
    required this.isEnabled,
    required this.body,
  });
  final String title;
  final bool isEnabled;
  final Widget body;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.neutralGrey,
        appBar: AppBar(
            backgroundColor: AppColors.accent,
            leading: isEnabled
                ? IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back),
                    color: AppColors.neutralWhite,
                    iconSize: 25)
                : Container(),
            centerTitle: true,
            title: Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary),
            )),
        body: Container(
          margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            children: [body],
          ),
        ));
  }
}
