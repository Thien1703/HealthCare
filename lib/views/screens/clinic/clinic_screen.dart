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
        title: "Đặt khám",
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
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(vertical: 3, horizontal: 3),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_on_outlined),
                      Text('Tìm gần đây'),
                    ],
                  ),
                ),
                clinics != null
                    ? ListView.builder(
                        padding: EdgeInsets.only(top: 10),
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: clinics!.length,
                        itemBuilder: (context, index) {
                          final clinic = clinics![index];
                          return InkWell(
                            onTap: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content: Text('ID phòng khám: ${clinic.id}'),
                                duration: Duration(seconds: 2),
                              ));
                            }, 
                            child: Card(
                                margin: EdgeInsets.symmetric(vertical: 10),
                                elevation: 10,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 30, horizontal: 10),
                                  child: Row(
                                    children: [
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.network(
                                          clinic.image,
                                          width: 110,
                                          height: 100,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      SizedBox(width: 10),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              clinic.name,
                                            ),
                                            Text(
                                              clinic.address,
                                              softWrap: true,
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )),
                          );
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
