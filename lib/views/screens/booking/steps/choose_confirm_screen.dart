import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/common/app_icons.dart';
import 'package:health_care/views/widgets/widget_hospital_info_card.dart';
import 'package:health_care/views/widgets/widget_select_item.dart';
import 'package:health_care/views/widgets/widget_selectCheckbox.dart';
import 'package:health_care/views/widgets/widget_customPricePayment.dart';
import 'package:health_care/views/widgets/widget_customButton.dart';

class ChooseConfirmScreen extends StatefulWidget {
  const ChooseConfirmScreen({
    super.key,
    required this.onNavigateToScreen,
  });
  final Function(int, String) onNavigateToScreen;

  @override
  State<ChooseConfirmScreen> createState() {
    return _ChooseConfirmScreen();
  }
}

class _ChooseConfirmScreen extends State<ChooseConfirmScreen> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: [
                HospitalInfoWidget(
                    nameHospital: 'Bệnh viện nhân dân Gia Định',
                    addressHospital:
                        'Số 1 Nơ Trang Long, Phường 7, Quận Bình Thạnh, TpHCM'),
                _customeTitle(title: 'Thông tin bệnh nhân', text: null),
                SelectItemWidget(
                    image: AppIcons.user1, text: 'Nguyễn Hữu Thiện '),
                _customeTitle(title: 'Thông tin đặt khám', text: null),
                _customInformationBooking(
                    text1: 'Đông Y',
                    text2: 'Khám Dịch Vụ Khu Vip',
                    text3: '03/01/2025 (08:00 - 09:00)',
                    text4: '127,000đ'),
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 10),
                  child: Dash(
                    direction: Axis.horizontal,
                    length: MediaQuery.of(context).size.width - 40,
                    dashLength: 8,
                    dashColor: Colors.grey,
                  ),
                ),
                _customeTitle(
                    title: 'Dịch vụ đặt thêm (Không bắt buộc)',
                    text:
                        'Xét nghiệm tại nhà, tư vấn dinh dưỡng, chăm sóc sức khỏe,...'),
                WidgetSelectcheckbox(),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 238, 206, 203),
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(AppIcons.exclamationMark, width: 20),
                      SizedBox(width: 10),
                      Expanded(
                        child: Text(
                          'Trong thời gian quy định, nếu quý khách hủy phiếu khám sẽ được hoàn lại tiền khám và các dịch vụ đặt thêm (không bao gồm phí tiện ích',
                          style: TextStyle(
                            fontSize: 12,
                            color: const Color.fromARGB(255, 216, 93, 84),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.only(top: 15),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Column(
              children: [
                WidgetCustompricepayment(),
                WidgetCustombutton(
                    onTap: () {
                      widget.onNavigateToScreen(3, 'Thông tin thanh toán');
                    },
                    text: 'Tiếp tục'),
              ],
            ),
          ),
        )
      ],
    );
  }
}

Widget _customeTitle({required String title, required String? text}) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: AppColors.neutralDarkGreen1),
        ),
        if (text != null)
          Text(
            text,
            style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color: AppColors.neutralGrey3),
          ),
      ],
    ),
  );
}

Widget _customInformationBooking({
  required String text1,
  required String text2,
  required String text3,
  required String text4,
}) {
  return Container(
    margin: EdgeInsets.only(top: 10),
    padding: EdgeInsets.all(10),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(15),
      color: Colors.white,
    ),
    child: Column(
      children: [
        _customRowImageWithText(image: AppIcons.specialty, text: text1),
        _customRowImageWithText(image: AppIcons.service2, text: text2),
        _customRowImageWithText(image: AppIcons.calendar, text: text3),
        _customRowImageWithText(
            image: AppIcons.payment, text: text4, isTextBlack: true)
      ],
    ),
  );
}

Widget _customRowImageWithText({
  required String image,
  required String text,
  bool isTextBlack = false,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 5),
    child: Row(
      children: [
        Image.asset(
          image,
          width: 23,
          color: AppColors.accent,
        ),
        SizedBox(width: 10),
        Text(
          text,
          style: TextStyle(
            fontSize: isTextBlack ? 17 : 16,
            fontWeight: isTextBlack ? FontWeight.w700 : FontWeight.w500,
            color: isTextBlack ? Colors.black : AppColors.neutralDarkGreen2,
          ),
        ),
      ],
    ),
  );
}
