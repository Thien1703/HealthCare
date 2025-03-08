import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/models/clinic.dart';
import 'package:health_care/viewmodels/api_service.dart';
import 'package:health_care/views/widgets/widget_header_body_scoller.dart';
import 'package:health_care/views/screens/appointment/appointment_screen.dart';

class ClinicScreen extends StatefulWidget {
  const ClinicScreen({
    super.key,
    this.iconBack,
  });
  final bool? iconBack;

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
    return WidgetHeaderBodyScoller(
        iconBack: widget.iconBack ?? false,
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
                    border: Border.all(color: AppColors.accent, width: 1),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.location_on_outlined, color: Colors.white),
                      Text(
                        'Tìm phòng khám gần đây',
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
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
                              print(clinic.id);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AppointmentScreen(
                                    clinicId: clinic.id,
                                  ),
                                ),
                              );
                            },
                            child: Card(
                              margin: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 15),
                              elevation: 8,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                                side: BorderSide(
                                  color: Colors.greenAccent,
                                  width: 1.5,
                                ),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Hình ảnh nền
                                    Image.network(
                                      clinic.image,
                                      width: double.infinity,
                                      height: 180, 
                                      fit: BoxFit.cover,
                                    ),
                                    
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            clinic.name,
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                          SizedBox(
                                              height:
                                                  5), 
                                          Text(
                                            clinic.address,
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: const Color.fromARGB(255, 111, 107, 107),
                                            ),
                                            softWrap: true,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      )
                    : Center(
                        child: Text('Không có phòng khám nào'),
                      ),
              ],
            ),
          ),
        ));
  }
}
