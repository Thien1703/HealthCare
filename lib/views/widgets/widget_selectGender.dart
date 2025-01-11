import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/common/app_icons.dart';

class WidgetSelectgender extends StatefulWidget {
  const WidgetSelectgender({super.key});

  @override
  State<WidgetSelectgender> createState() {
    return _WidgetSelectgender();
  }
}

class _WidgetSelectgender extends State<WidgetSelectgender> {
  String selectedGender = 'Giới tính';
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showModalBottomSheet(
            context: context,
            builder: (BuildContext context) {
              return Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: SizedBox(
                      width: double.infinity,
                      height: 200,
                      child: Column(children: [
                        _customLineBold(),
                        _customeTitleGender(context),
                        _customButtonSelectedGender(
                            gender: 'Nam',
                            onPressed: () {
                              setState(() {
                                selectedGender = 'Nam';
                              });
                              Navigator.pop(context);
                            }),
                        _customButtonSelectedGender(
                            gender: 'Nữ',
                            onPressed: () {
                              setState(() {
                                selectedGender = 'Nữ';
                              });
                              Navigator.pop(context);
                            })
                      ])));
            });
      },
      child: Container(
        width: 160,
        height: 43,
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.neutralGrey2, width: 1),
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(selectedGender),
            Icon(Icons.keyboard_arrow_right_sharp)
          ],
        ),
      ),
    );
  }
}

Widget _customButtonSelectedGender(
    {required String gender, required onPressed}) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    child: SizedBox(
      width: double.infinity,
      height: 50,
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            side: BorderSide(color: AppColors.neutralGrey2, width: 1),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10)))),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              gender,
              style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w400,
                  color: Colors.black),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget _customLineBold() {
  return Container(
    margin: EdgeInsets.only(bottom: 15),
    width: 100,
    decoration: BoxDecoration(
      border: Border.all(
        color: AppColors.neutralGrey2,
        width: 2,
      ),
    ),
  );
}

Widget _customeTitleGender(BuildContext context) {
  return Stack(alignment: Alignment.center, children: [
    Row(children: [
      InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset(
            AppIcons.cancel,
            width: 15,
          ))
    ]),
    Text('Giới tính',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ))
  ]);
}
