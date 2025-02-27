import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/models/clinic.dart';
import 'package:health_care/viewmodels/api_service.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';

class ClinicScreen extends StatefulWidget {
  const ClinicScreen({super.key});

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  List<Clinic>? clinics;
  @override
  void initState() {
    super.initState();
    fetchClinics();
  }

  void fetchClinics() async {
    List<Clinic>? data = await ApiService.getAllClinic();
    setState(() {
      clinics = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WidgetHeaderBody(
        iconBack: false,
        title: "Đặt khám giữ chổ",
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColors.accent,
                        width: 1.5,
                      )),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text('Tìm kiếm chuyên khoa/dịch vụ',
                          style: TextStyle(color: Colors.black54)),
                      Icon(Icons.search, color: AppColors.accent),
                    ],
                  ),
                ),
                const SizedBox(height: 10), // Thêm khoảng cách
                clinics != null
                    ? ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: clinics!.length,
                        itemBuilder: (context, index) {
                          final clinic = clinics![index];
                          return Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(vertical: 10),
                                child: Row(
                                  children: [
                                    Image.network(
                                      clinic.image,
                                      width: 100,
                                    ),
                                    SizedBox(width: 10),
                                    Column(
                                      children: [
                                        Text(
                                          clinic.name,
                                        ),
                                        Text(clinic.address)
                                      ],
                                    ),
                                  ],
                                ),
                              ));
                        },
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      )
              ],
            ),
          ),
        ));
  }
}
