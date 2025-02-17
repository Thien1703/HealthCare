import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/views/screens/examination/paidDetail_screen.dart';
import 'package:health_care/views/screens/examination/unpaidDetail_screen.dart';
import 'package:health_care/views/screens/examination/completedDetail_scteen.dart';
import 'package:health_care/models/clinic/examination.dart';

class WidgetCardItem extends StatelessWidget {
  final Examination examination;
  const WidgetCardItem({super.key, required this.examination});

  @override
  Widget build(BuildContext context) {
    String getStatusText(int status) {
      switch (status) {
        case 1:
          return 'Đã thanh toán';
        case 2:
          return 'Chưa thanh toán';
        case 3:
          return 'Đã khám';
        case 4:
          return 'Đã hủy';
        default:
          return 'Không xác định';
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.grey4, width: 2),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      margin: EdgeInsets.only(right: 20, left: 20, bottom: 20),
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text('Mã đặt lịch:',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.neutralGrey3)),
                      SizedBox(width: 20),
                      Text(examination.maDatLich,
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.neutralDarkGreen1,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                  Text(examination.nameUser,
                      style: TextStyle(
                          fontSize: 15,
                          color: AppColors.neutralDarkGreen1,
                          fontWeight: FontWeight.w500)),
                ],
              ),
              if (examination.status != 4)
                InkWell(
                  onTap: () {
                    if (examination.status == 1) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PaidDetailScreen(examination: examination,)));
                    } else if (examination.status == 2) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UnPaidDetailScreen()));
                    } else if (examination.status == 3) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CompletedDetailScteen()));
                    }
                  },
                  child: Row(
                    children: [
                      Text('Xem chi tiết',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.accent)),
                      Icon(
                        Icons.keyboard_arrow_right_outlined,
                        color: AppColors.accent,
                      )
                    ],
                  ),
                )
            ],
          ),
          _customDashedLine(),
          Text(examination.nameHospital,
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: AppColors.accent)),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _textLabel(label: 'Dịch vụ'),
              SizedBox(width: 50),
              Expanded(
                child: Text(examination.service,
                    textAlign: TextAlign.right,
                    softWrap: true,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.neutralDarkGreen2)),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Chuyên khoa:',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutralGrey2)),
              Text(examination.chuyenKhoa,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutralDarkGreen2)),
            ],
          ),
          if (examination.status == 3)
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Ngày tái khám',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        color: AppColors.neutralGrey2)),
                Text('4235',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: AppColors.accent)),
              ],
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Trạng thái:',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: AppColors.neutralGrey2)),
              Text(getStatusText(examination.status),
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.black))
            ],
          ),
        ],
      ),
    );
  }
}

Widget _customDashedLine() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: List.generate(23, (index) {
      return Container(
        margin: EdgeInsets.symmetric(vertical: 15),
        width: 7,
        height: 1.5,
        color: AppColors.grey4,
      );
    }),
  );
}

Widget _textLabel({required String label}) {
  return Padding(
    padding: EdgeInsets.symmetric(vertical: 5),
    child: Text(label,
        style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.neutralGrey2)),
  );
}
