import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/common/app_icons.dart';

class WidgetUserprofileCard extends StatelessWidget {
  const WidgetUserprofileCard({super.key});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        padding: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _customeRow(
                    image: AppIcons.user1, titleOfImage: 'NGUYỄN HỮU THIỆN'),
                _customeRow(image: AppIcons.call, titleOfImage: '0901492845'),
                _customeRow(
                    image: AppIcons.calendar, titleOfImage: '01/07/2023'),
                _customeRow(
                    image: AppIcons.location,
                    titleOfImage: 'Thành phố Hồ Chí Minh'),
              ],
            ),
            InkWell(
              onTap: () {},
              child: Image.asset(AppIcons.variant21),
            )
          ],
        ),
      ),
    );
  }
}

Widget _customeRow({required String image, required String titleOfImage}) {
  return Container(
    margin: EdgeInsets.only(bottom: 5),
    child: Row(
      children: [
        Image.asset(
          image,
          color: AppColors.accent,
          width: 25,
        ),
        SizedBox(width: 10),
        Text(
          titleOfImage,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: AppColors.accent),
        ),
      ],
    ),
  );
}
