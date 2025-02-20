import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'dart:math' as math;

import 'package:health_care/common/app_icons.dart';

class WidgetInfoPatient extends StatefulWidget {
  const WidgetInfoPatient({
    super.key,
    required this.image,
    required this.text,
  });

  final String image;
  final String text;

  @override
  State<WidgetInfoPatient> createState() => _WidgetInfoPatientState();
}

class _WidgetInfoPatientState extends State<WidgetInfoPatient> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        width: double.infinity,
        height: isExpanded ? 150 : 50,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.only(top: 5),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: const Color.fromARGB(255, 161, 161, 161),
            width: 1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(15),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Transform(
                      transform: Matrix4.rotationY(math.pi),
                      alignment: Alignment.center,
                      child: Image.asset(
                        widget.image,
                        width: 20,
                        color: AppColors.accent,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      widget.text,
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                        color: AppColors.neutralGrey3,
                      ),
                    ),
                  ],
                ),
                Icon(isExpanded
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down),
              ],
            ),
            if (isExpanded)
              Expanded(
                  child: Column(
                children: [
                  _customeRow(image: Icons.phone, value: '0979591276'),
                  _customeRow(image: Icons.cake, value: '07/10/2004'),
                  _customeRow(
                      image: Icons.location_on, value: 'Thành phố Hồ Chí Minh'),
                ],
              )),
          ],
        ),
      ),
    );
  }
}

Widget _customeRow({required IconData image, required String value}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Row(
      children: [
        Icon(
          image,
          weight: 20,
          color: AppColors.accent,
        ),
        const SizedBox(width: 10),
        Text(
          value,
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w500,
            color: AppColors.neutralGrey3,
          ),
        ),
      ],
    ),
  );
}
