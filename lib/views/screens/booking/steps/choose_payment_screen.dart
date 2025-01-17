import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/common/app_icons.dart';
import 'package:health_care/views/widgets/widget_hospital_info_card.dart';
import 'package:health_care/views/widgets/widget_select_item.dart';
import 'package:health_care/views/widgets/widget_customPricePayment.dart';
import 'package:health_care/views/widgets/widget_customButton.dart';

class ChoosePaymentScreen extends StatefulWidget {
  const ChoosePaymentScreen({super.key});
  @override
  State<ChoosePaymentScreen> createState() {
    return _ChoosePaymentScreen();
  }
}

class _ChoosePaymentScreen extends State<ChoosePaymentScreen> {
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
                _customeTitle(title: 'Phương thức thanh toán', text: null),
                SelectItemWidget(
                    image: AppIcons.user1, text: 'Chọn phương thức thanh toán'),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15)),
                  child: WidgetCustompricepayment(),
                ),
                Container(
                  margin: EdgeInsets.symmetric(vertical: 10),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(AppIcons.checkSucess, width: 20),
                      SizedBox(width: 10),
                      Expanded(
                          child: Text(
                              'Tôi đồng ý Phí tiện ích Health Care để sử dụng dịch vụ đặt khám, thanh toán viện phí, tra cứu kết quả khám và các tính năng tiện lợi khác trên nền tảng Health Care, đây không phải là dịch vụ bắt buộc bới cơ sở y tế.'))
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15)),
          ),
          child: WidgetCustombutton(onTap: () {}, text: 'Thanh toán'),
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
    margin: EdgeInsets.symmetric(vertical: 3),
    child: Row(
      children: [
        Image.asset(
          image,
          width: 21,
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
