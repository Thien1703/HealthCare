import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/common/app_icons.dart';

class ClinicDetailScreen extends StatelessWidget {
  const ClinicDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: AppColors.accent,
            expandedHeight: 200,
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset(
                'assets/images/img_hospital.png',
                fit: BoxFit.cover,
              ),
              centerTitle: true,
              titlePadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              title: Text(
                "Bệnh viện Nhân Dân Gia Định",
                style: TextStyle(
                  color: AppColors.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Padding(
                  padding: EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Image.asset(AppIcons.locationGreen),
                          SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              'Địa chỉ Số 1 Nơ Trang Long, Phương 7, Quận Bình Thạnh, Tp.HCM',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: AppColors.neutralDarkGreen2,
                              ),
                            ),
                          )
                        ],
                      ),
                      customeTitle(title: 'Dịch vụ', top: 20, bottom: 10),
                      customBookingExaming(
                          titleBooking: 'Đặt khám theo chuyên khoa',
                          onTap: () {}),
                      SizedBox(height: 10),
                      customBookingExaming(
                        titleBooking: 'Đặt khám theo chuyên gia',
                        onTap: () {},
                      ),
                      customeTitle(title: 'Giới thiệu', top: 10, bottom: 5),
                      customeTextFont(
                        textFont:
                            'Bệnh viện Nhân dân Gia Định là một trong những Bệnh viện Đa khoa loại I trực thuộc Sở Y tế TP.HCM. Với đội ngũ Y, Bác sĩ chuyên môn cao, dày dạn kinh nghiệm, Bệnh viện có đủ các chuyên khoa lớn, nhiều phân khoa sâu, trang bị đầy đủ trang thiết bị y tế nhằm nâng cao chất lượng chẩn đoán, điều trị và chăm sóc bệnh nhân, đáp ứng nhu cầu khám chữa bệnh ngày càng cao của nhân dân',
                      ),
                      customeTitle(title: 'Chuyên khoa', top: 30, bottom: 5),
                      customeTextFont(
                        textFont:
                            'Bệnh viện Nhân Dân Gia Định hiên đang triển khai da dạng các chuyên khoa nhằm đáp ứng nhu cầu khám bệnh ngày một tăng cao của người dân, bao gồm:',
                      ),
                      Text('Thông tin Các khoa Lâm Sàng'),
                      Text('1. Nội Tổng Quát'),
                      Text('2. Đông Y'),
                      Text('3. Da Liễu'),
                      Text('4. Hô Hấp'),
                      Text('5. Cơ Xương Khớp'),
                      Text('6. Nội Tiết'),
                      Text('7. Nội Thần Kinh'),
                      Text('8. Ngoại Thần Kinh'),
                      Text('9. Lão Khoa'),
                      customeTitle(
                          title: 'Một số bác sĩ tiêu biểu tại bệnh viện',
                          top: 30,
                          bottom: 5),
                      customeTextFont(
                        textFont:
                            'Bệnh viện Nhân Dân Gia Định hiên sở hữu đội ngũ các y bác sĩ là những chuyên gia đầu ngành, có trình độ chuyên môn cao bao gồm Giáo sư, Tiến sĩ, Thạc sĩ,... Một trong số đó có thể kể đến như:',
                      ),
                      customeTextFont(
                        textFont:
                            'TS.BS Nguyễn Hoàng Hải: Giám đốc bệnh viện Nhân dân Gia Định;',
                      ),
                      customeTextFont(
                        textFont:
                            'TS.BS Võ Hồng Minh Công: Phó Giám đốc Bệnh viện Nhân dân Gia Định;',
                      ),
                      customeTextFont(
                        textFont:
                            'Bác sĩ Chuyên khoa II Lê Nguyễn Thụy Khương: Trưởng khoa Nội Tiết Thận Bệnh viện Nhân dân Gia Định;',
                      ),
                      customeTextFont(
                        textFont:
                            'Phó Giáo sư Tiến sĩ Bác sĩ Nguyễn Thy Khuê: Phó Chủ tịch thường trực Hội Nội tiết TP.HCM;',
                      ),
                      customeTitle(
                          title: 'Cơ sở vật chất tại bệnh viện',
                          top: 30,
                          bottom: 5),
                      customeTextFont(
                        textFont:
                            'Hiện nay, bệnh viện cung cấp quy mô lớn với 1.500 giường bệnh. Hàng ngày, bệnh viện tiếp đón khoảng 1.500 bệnh nhân nội trú, hơn 4.000 lượt bệnh nhân đến khám bệnh và hơn 300 lượt bệnh nhân cấp cứu. Bên cạnh viếc khám chữa bệnh cho người dân sống tại khu vực nội thành, bệnh vienj còn thực hiện khám chữa và điều trị cho các tỉnh thành lân cận như Biên Hòa, Đồng Nai, Vũng Tàu,...',
                      ),
                      SizedBox(height: 20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

Widget customeTitle(
    {required String title, required double top, required double bottom}) {
  return Padding(
    padding: EdgeInsets.only(top: top, bottom: bottom),
    child: Text(
      title,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.accent,
      ),
    ),
  );
}

Widget customeTextFont({required String textFont}) {
  return Text(
    textFont,
    style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.neutralGrey3),
  );
}

Widget customBookingExaming({required String titleBooking, required onTap}) {
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration: BoxDecoration(
      border: Border.all(color: AppColors.neutralGrey3, width: 1),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(titleBooking),
        Container(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            decoration: BoxDecoration(
              color: AppColors.accent,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: InkWell(
              onTap: onTap,
              child: Row(
                children: [
                  Text(
                    'Đặt lịch',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  Image.asset(AppIcons.rightArrow),
                ],
              ),
            )),
      ],
    ),
  );
}
