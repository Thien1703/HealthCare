import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:provider/provider.dart'; 
import 'package:health_care/common/app_colors.dart';  
import 'package:health_care/models/clinic/clinic.dart';  
import 'package:health_care/views/screens/clinic/clinic_card.dart';  
import 'package:health_care/viewmodels/clinic_viewmodel.dart';  
=======
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/models/clinic.dart';
import 'package:health_care/viewmodels/api_service.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';
import 'package:health_care/views/screens/appointment/appointment_screen.dart';

>>>>>>> e0159da21452efe9d27355b4ea6cb6110a4c774b
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
<<<<<<< HEAD
  final TextEditingController _searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
   
    Future.delayed(Duration.zero, () {
      context.read<ClinicViewModel>().fetchClinics();
=======
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
>>>>>>> e0159da21452efe9d27355b4ea6cb6110a4c774b
    });
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return ChangeNotifierProvider<ClinicViewModel>(
      create: (_) => ClinicViewModel()..fetchClinics(), 
      child: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text(
              'Chọn cơ sở y tế'.toUpperCase(),  
              style: TextStyle(
                color: Colors.white,  
                fontWeight: FontWeight.bold,  
              ),
            ),
          ),
          backgroundColor: AppColors.accent,
        ),
        body: Consumer<ClinicViewModel>(
          builder: (context, viewModel, child) {
            return Column(
              children: [
              
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: TextField(
                    controller: _searchController,
                    decoration: InputDecoration(
                      hintText: 'Tìm cơ sở y tế',  
                      prefixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onChanged: (value) {
                      
                      viewModel.updateSearchQuery(value);
                    },
                  ),
                ),
                
                // list phòng khám
                Expanded(
                  child: viewModel.isLoading
                      ? const Center(child: CircularProgressIndicator())  
                      : viewModel.filteredClinics.isEmpty
                          ? const Center(child: Text('Không tìm thấy cơ sở y tế phù hợp.'))  
                          : ListView.builder(
                              itemCount: viewModel.filteredClinics.length,
                              itemBuilder: (context, index) {
                                final clinic = viewModel.filteredClinics[index];
                                return ClinicCard(clinic: clinic); 
                              },
                            ),
                ),
              ],
            );
          },
        ),
      ),
    );
=======
    return WidgetHeaderBody(
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
                              print(clinic.id);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => AppointmentScreen(
                                            clinicId: clinic.id,
                                          )));
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
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
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
                                      ],
                                    ))),
                          );
                        },
                      )
                    : Center(
                        child: Text('Không có phòng khám nào'),
                      )
              ],
            ),
          ),
        ));
>>>>>>> e0159da21452efe9d27355b4ea6cb6110a4c774b
  }
}
