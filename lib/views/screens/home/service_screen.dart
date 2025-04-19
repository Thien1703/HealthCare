import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/viewmodels/api/api_service.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';
import 'package:health_care/models/service.dart';
import 'package:health_care/views/screens/clinic/clinic_screen.dart';

class ServiceScreen extends StatefulWidget {
  ServiceScreen({super.key, required this.specialtyId});
  final int specialtyId;

  @override
  State<ServiceScreen> createState() => _ServiceScreen();
}

class _ServiceScreen extends State<ServiceScreen> {
  List<Service> services = [];

  @override
  void initState() {
    super.initState();
    fetchServicesById();
  }

  void fetchServicesById() async {
    List<Service>? data = await ApiService.getAllServeById(widget.specialtyId);
    if (mounted) {
      setState(() {
        services = data;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return WidgetHeaderBody(
      iconBack: true,
      title: 'Dịch vụ',
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                const Color.fromARGB(255, 37, 135, 162),
                Colors.white,
                const Color.fromARGB(255, 37, 135, 162),
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 17),
            child: Column(
              children: [
                
                // Container(
                //   margin: EdgeInsets.symmetric(vertical: 15),
                //   padding: EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                //   decoration: BoxDecoration(
                //     color: Colors.white,
                //     borderRadius: BorderRadius.circular(12),
                //     border: Border.all(
                //       color: const Color.fromARGB(255, 37, 135, 162),
                //       width: 1.5,
                //     ),
                //   ),
                  // child: Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Text(
                  //       'Tìm kiếm chuyên khoa/dịch vụ',
                  //       style: TextStyle(color: Colors.black54, fontSize: 14),
                  //     ),
                  //     Icon(Icons.search, color: Colors.blue),
                  //   ],
                  // ),
                // ),

                // Hiển thị danh sách dịch vụ
                services.isEmpty
                    ? Center(child: Text('Chưa có dịch vụ này'))
                    : GridView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8,
                          mainAxisSpacing: 8,
                          childAspectRatio: 0.68,
                        ),
                        itemCount: services.length,
                        itemBuilder: (context, index) {
                          final service = services[index];
                          return Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            color: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.all(6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  
                                  SizedBox(height: 14),
                                  service.image != null &&
                                          service.image!.isNotEmpty
                                      ? ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16),
                                            topRight: Radius.circular(16),
                                            bottomLeft: Radius.zero,
                                            bottomRight: Radius.zero,
                                          ),
                                          child: Image.network(
                                            service.image!,
                                            height: 120,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return ClipRRect(
                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(16),
                                                  topRight: Radius.circular(16),
                                                  bottomLeft: Radius.zero,
                                                  bottomRight: Radius.zero,
                                                ),
                                                child: Image.asset(
                                                  'assets/images/avt.png',
                                                  height: 120,
                                                  width: double.infinity,
                                                  fit: BoxFit.cover,
                                                ),
                                              );
                                            },
                                          ),
                                        )
                                      : ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(16),
                                            topRight: Radius.circular(16),
                                            bottomLeft: Radius.zero,
                                            bottomRight: Radius.zero,
                                          ),
                                          child: Image.asset(
                                            'assets/images/avt.png',
                                            height: 120,
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                  SizedBox(height: 5),

                                  
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        service.name,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                          color: Colors.black87,
                                        ),
                                        softWrap: true,
                                      ),
                                      
                                      Row(
                                        children: [
                                          SizedBox(width: 5),
                                          Expanded(
                                            child: Text(
                                              service.description,
                                              softWrap: true,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black54),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 10),

                                      
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Icon(Icons.monetization_on,
                                              size: 20,
                                              color: Colors.yellow),
                                          SizedBox(width: 2),    
                                          Text(
                                            service.formattedPrice,
                                            style: TextStyle(
                                              color: const Color.fromARGB(255, 32, 32, 32),
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),

                SizedBox(height: 10),
                if (services.isNotEmpty)
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ClinicScreen(
                            iconBack: true,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(16), 
                        side: BorderSide(
                          
                          color: const Color.fromARGB(255, 6, 27, 73), 
                          width: 1.3, 
                        ),
                      ),
                      minimumSize:
                          Size(double.minPositive, 50), 
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.calendar_today,
                          color: const Color.fromARGB(255, 58, 98, 184),
                        ),
                        SizedBox(width: 8),
                        Text(
                          'ĐẶT LỊCH NGAY',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 58, 98, 184),
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
