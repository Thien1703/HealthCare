import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/common/app_icons.dart';
import 'package:health_care/views/widgets/appointment/widget_hospital_info_card.dart';
import 'package:health_care/views/widgets/widget_selectCheckbox.dart';
import 'package:health_care/views/widgets/appointment/widget_customPricePayment.dart';
import 'package:health_care/views/widgets/appointment/widget_customButton.dart';
import 'package:health_care/views/widgets/widget_lineBold.dart';
import 'package:health_care/views/widgets/appointment/widget_infoPatient.dart';

class ConfirmBooking extends StatefulWidget {
  const ConfirmBooking({
    super.key,
    required this.onNavigateToScreen,
  });
  final Function(int, String) onNavigateToScreen;

  @override
  State<ConfirmBooking> createState() => _ConfirmBooking();
}

class _ConfirmBooking extends State<ConfirmBooking> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: ListView(
              children: const [
                HospitalInfoWidget(
                  nameHospital: 'Bệnh viện nhân dân Gia Định',
                  addressHospital:
                      'Số 1 Nơ Trang Long, Phường 7, Quận Bình Thạnh, TpHCM',
                ),
                SectionTitle(title: 'Thông tin bệnh nhân'),
                Expanded(
                  child: PatientInfo(),
                ),
                SectionTitle(title: 'Thông tin đặt khám'),
                BookingInformation(
                  text1: 'Đông Y',
                  text2: 'Khám Dịch Vụ Khu Vip',
                  text3: '03/01/2025 (08:00 - 09:00)',
                  text4: '127,000đ',
                ),
                WidgetLineBold(),
                AdditionalServicesTitle(),
                WidgetSelectcheckbox(),
                CancellationNotice(),
              ],
            ),
          ),
        ),
        BottomBar(
          onContinue: () {
            widget.onNavigateToScreen(3, 'Thông tin thanh toán');
          },
        ),
      ],
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: AppColors.neutralDarkGreen1,
        ),
      ),
    );
  }
}

class PatientInfo extends StatelessWidget {
  const PatientInfo({super.key});

  @override
  Widget build(BuildContext context) {
    return const WidgetInfoPatient(
      image: AppIcons.user1,
      text: 'Nguyễn Hữu Thiện ',
    );
  }
}

class BookingInformation extends StatelessWidget {
  final String text1;
  final String text2;
  final String text3;
  final String text4;

  const BookingInformation({
    super.key,
    required this.text1,
    required this.text2,
    required this.text3,
    required this.text4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Column(
        children: [
          BookingInfoRow(image: AppIcons.specialty, text: text1),
          BookingInfoRow(image: AppIcons.service2, text: text2),
          BookingInfoRow(image: AppIcons.calendar, text: text3),
          BookingInfoRow(
              image: AppIcons.payment, text: text4, isTextBlack: true),
        ],
      ),
    );
  }
}

class BookingInfoRow extends StatelessWidget {
  final String image;
  final String text;
  final bool isTextBlack;

  const BookingInfoRow({
    super.key,
    required this.image,
    required this.text,
    this.isTextBlack = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Image.asset(
            image,
            width: 23,
            color: AppColors.accent,
          ),
          const SizedBox(width: 10),
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
}

class AdditionalServicesTitle extends StatelessWidget {
  const AdditionalServicesTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        SectionTitle(title: 'Dịch vụ đặt thêm (Không bắt buộc)'),
        Text(
          'Xét nghiệm tại nhà, tư vấn dinh dưỡng, chăm sóc sức khỏe,...',
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: AppColors.neutralGrey3,
          ),
        ),
      ],
    );
  }
}

class CancellationNotice extends StatelessWidget {
  const CancellationNotice({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 238, 206, 203),
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.priority_high_rounded,
              color: Color.fromARGB(255, 216, 93, 84)),
          const SizedBox(width: 10),
          const Expanded(
            child: Text(
              'Trong thời gian quy định, nếu quý khách hủy phiếu khám sẽ được hoàn lại tiền khám và các dịch vụ đặt thêm (không bao gồm phí tiện ích)',
              style: TextStyle(
                fontSize: 12,
                color: Color.fromARGB(255, 216, 93, 84),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  final VoidCallback onContinue;

  const BottomBar({super.key, required this.onContinue});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: const WidgetCustompricepayment(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: WidgetCustombutton(
              onTap: onContinue,
              text: 'Tiếp tục',
            ),
          ),
        ],
      ),
    );
  }
}
