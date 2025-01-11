import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/common/app_icons.dart';
import 'dart:math' as math;

class WidgetCustomeselect extends StatelessWidget {
  const WidgetCustomeselect(
      {super.key, required this.image, required this.text});
  final String image;
  final String text;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
          width: double.infinity,
          height: 55,
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 5),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                  color: const Color.fromARGB(255, 161, 161, 161), width: 1),
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              )),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Transform(
                    transform: Matrix4.rotationY(math.pi),
                    alignment: Alignment.center,
                    child: Image.asset(image, width: 20),
                  ),
                  SizedBox(width: 10),
                  Text(text,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColors.neutralGrey3,
                      )),
                ],
              ),
              Icon(Icons.keyboard_arrow_right_outlined)
            ],
          )),
    );
  }
}
