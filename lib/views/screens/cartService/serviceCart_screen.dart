import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/models/service.dart';
import 'package:health_care/models/specialty.dart';
import 'package:health_care/viewmodels/api/api_service.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';
import 'package:health_care/viewmodels/api/specialty_api.dart';
import 'package:intl/intl.dart';

class ServicecartScreen extends StatefulWidget {
  const ServicecartScreen({super.key});
  @override
  State<ServicecartScreen> createState() => _ServicecartScreenState();
}

class _ServicecartScreenState extends State<ServicecartScreen> {
  List<Service> services = [];
  Map<String, List<Service>> groupedServices = {};
  Set<int> selectedService = {}; // Giữ ID các dịch vụ đã chọn
  double totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    List<Service>? serviceData = await ApiService.getAllServe();
    List<Specialty>? specialtyData = await SpecialtyApi.getAllSpecialty();

    if (serviceData != null && specialtyData != null) {
      Map<int, String> specialtyMap = {
        for (var specialty in specialtyData) specialty.id: specialty.name
      };

      for (var service in serviceData) {
        service.specialtyName = specialtyMap[service.specialtyId] ?? 'Khác';
      }

      Map<String, List<Service>> grouped = {};
      for (var service in serviceData) {
        grouped.putIfAbsent(service.specialtyName!, () => []).add(service);
      }

      if (mounted) {
        setState(() {
          services = serviceData;
          groupedServices = grouped;
        });
      }
    }
  }

  void toggleServiceSelection(int serviceId) {
    setState(() {
      if (selectedService.contains(serviceId)) {
        selectedService.remove(serviceId); // Bỏ chọn dịch vụ
      } else {
        selectedService.add(serviceId); // Chọn dịch vụ
      }
      updateTotalPrice();
    });
  }

  void updateTotalPrice() {
    setState(() {
      totalPrice = services
          .where((service) => selectedService.contains(service.id))
          .fold(0.0, (sum, service) => sum + service.price);
    });
  }

  String formatCurrency(double amount) {
    final formatter = NumberFormat("#,###", "vi_VN");
    return "${formatter.format(amount)}đ";
  }

  @override
  Widget build(BuildContext context) {
    return WidgetHeaderBody(
      iconBack: true,
      title: 'Dịch vụ',
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
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
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: groupedServices.isNotEmpty
                          ? Column(
                              children: groupedServices.entries.map((entry) {
                                return Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(top: 5),
                                      child: Text(
                                        entry.key,
                                        style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold,
                                          color: AppColors.neutralDarkGreen1,
                                        ),
                                      ),
                                    ),
                                    GridView.builder(
                                      shrinkWrap: true,
                                      physics: NeverScrollableScrollPhysics(),
                                      gridDelegate:
                                          SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2,
                                        crossAxisSpacing: 1,
                                        mainAxisSpacing: 2,
                                        childAspectRatio: 0.67,
                                      ),
                                      itemCount: entry.value.length,
                                      itemBuilder: (context, index) {
                                        final service = entry.value[index];

                                        return Card(
                                          elevation: 6,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(16),
                                          ),
                                          color: Colors.white,
                                          child: Padding(
                                            padding: EdgeInsets.all(6),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                service.image != null &&
                                                        service
                                                            .image!.isNotEmpty
                                                    ? ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  16),
                                                          topRight:
                                                              Radius.circular(
                                                                  16),
                                                          bottomLeft:
                                                              Radius.zero,
                                                          bottomRight:
                                                              Radius.zero,
                                                        ),
                                                        child: Image.network(
                                                          service.image! ?? '',
                                                          height: 120,
                                                          width:
                                                              double.infinity,
                                                          fit: BoxFit.cover,
                                                          errorBuilder:
                                                              (context, error,
                                                                  stackTrace) {
                                                            return ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        16),
                                                                topRight: Radius
                                                                    .circular(
                                                                        16),
                                                                bottomLeft:
                                                                    Radius.zero,
                                                                bottomRight:
                                                                    Radius.zero,
                                                              ),
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/avt.png',
                                                                height: 120,
                                                                width: double
                                                                    .infinity,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      )
                                                    : ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  16),
                                                          topRight:
                                                              Radius.circular(
                                                                  16),
                                                          bottomLeft:
                                                              Radius.zero,
                                                          bottomRight:
                                                              Radius.zero,
                                                        ),
                                                        child: Image.asset(
                                                          'assets/images/avt.png',
                                                          height: 120,
                                                          width:
                                                              double.infinity,
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
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 15,
                                                        color: Colors.black87,
                                                      ),
                                                      softWrap: true,
                                                    ),
                                                    SizedBox(height: 10),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      children: [
                                                        Icon(
                                                            Icons
                                                                .monetization_on,
                                                            size: 20,
                                                            color:
                                                                Colors.yellow),
                                                        SizedBox(
                                                          width: 3,
                                                        ),
                                                        Text(
                                                          service
                                                              .formattedPrice,
                                                          style: TextStyle(
                                                            color: const Color
                                                                .fromARGB(255,
                                                                32, 32, 32),
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 4,
                                                    ),
                                                    Center(
                                                      child: OutlinedButton(
                                                        onPressed: selectedService
                                                                .contains(
                                                                    service.id)
                                                            ? null
                                                            : () =>
                                                                toggleServiceSelection(
                                                                    service.id),
                                                        style: OutlinedButton
                                                            .styleFrom(
                                                                backgroundColor:
                                                                    Colors
                                                                        .blue),
                                                        child: Text(
                                                          selectedService
                                                                  .contains(
                                                                      service
                                                                          .id)
                                                              ? 'Đã thêm'
                                                              : 'Thêm dịch vụ',
                                                          style: TextStyle(
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                );
                              }).toList(),
                            )
                          : Center(child: Text('Không có dịch vụ')),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Thanh thông tin giỏ hàng
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 5),
                    Text(
                      'Tổng thanh toán',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Color(0xFF4C4C4C),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      formatCurrency(
                          totalPrice), // Đảm bảo phương thức formatCurrency() đã được định nghĩa
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: const Color.fromARGB(255, 15, 149, 169),
                      ),
                    ),
                  ],
                ),
                OutlinedButton(
                  onPressed: () {
                    List<Service> selectedServiceList = services
                        .where(
                            (service) => selectedService.contains(service.id))
                        .toList();
                    List<int> selectedServiceId = selectedService.toList();
                    Navigator.pop(context, {
                      'selectedServiceList': selectedServiceList,
                      'selectedServiceId': selectedServiceId,
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    backgroundColor: Colors.blue, // Màu nền nút
                    side: BorderSide(color: Colors.blue), // Viền của nút
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30), // Bo tròn nút
                    ),
                    padding: EdgeInsets.symmetric(
                        horizontal: 30, vertical: 12), // Padding để nút lớn hơn
                  ),
                  child: Text(
                    'XONG',
                    style: TextStyle(
                      color: Colors.white, // Màu chữ trắng
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
