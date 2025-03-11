import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/models/service.dart';
import 'package:health_care/models/specialty.dart';
import 'package:health_care/viewmodels/api/api_service.dart';
import 'package:health_care/viewmodels/api/specialty_api.dart';
import 'package:health_care/views/widgets/widget_header_body_scoller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';

class ServicecartScreen extends StatefulWidget {
  const ServicecartScreen({super.key});
  @override
  State<ServicecartScreen> createState() => _ServicecartScreenState();
}

class _ServicecartScreenState extends State<ServicecartScreen> {
  List<Service> services = [];
  List<Specialty> specialties = [];
  Map<String, List<Service>> groupedServices = {};
  Set<int> selectedService = {};
  double totalPrice = 0.0;

  @override
  void initState() {
    super.initState();
    loadSelectedServices();

    fetchData();
  }

  void fetchData() async {
    // Gọi API lấy danh sách dịch vụ & chuyên khoa
    List<Service>? serviceData = await ApiService.getAllServe();
    List<Specialty>? specialtyData = await SpecialtyApi.getAllSpecialty();

    if (serviceData != null && specialtyData != null) {
      // Tạo map để lấy tên chuyên khoa từ specialtyId
      Map<int, String> specialtyMap = {
        for (var specialty in specialtyData) specialty.id: specialty.name
      };

      // Gán specialtyName vào service
      for (var service in serviceData) {
        service.specialtyName = specialtyMap[service.specialtyId] ?? 'Khác';
      }

      // Nhóm dịch vụ theo specialtyName
      Map<String, List<Service>> grouped = {};
      for (var service in serviceData) {
        grouped.putIfAbsent(service.specialtyName!, () => []).add(service);
      }

      if (mounted) {
        setState(() {
          services = serviceData;
          specialties = specialtyData;
          groupedServices = grouped;
        });
      }
    }
  }

  void toggleServiceSelection(int serviceId) {
    setState(() {
      if (selectedService.contains(serviceId)) {
        selectedService.remove(serviceId);
      } else {
        selectedService.add(serviceId);
      }
    });
    saveSelectedServices();
    updateTotalPrice();
  }

  void saveSelectedServices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> selectedIds =
        selectedService.map((id) => id.toString()).toList();
    await prefs.setStringList('selected_services', selectedIds);
    await prefs.setDouble('total_price', totalPrice); // Lưu tổng tiền
  }

  void loadSelectedServices() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedIds = prefs.getStringList('selected_services');
    double? savedTotalPrice =
        prefs.getDouble('total_price'); // Lấy tổng tiền đã lưu

    if (savedIds != null) {
      setState(() {
        selectedService = savedIds.map((id) => int.parse(id)).toSet();
        totalPrice = savedTotalPrice ?? 0.0; // Khôi phục tổng tiền
      });
    }
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
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: WidgetHeaderBodyScoller(
              iconBack: true,
              title: 'Chọn dịch vụ',
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          // Ô tìm kiếm
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 15),
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 15),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12),
                              border:
                                  Border.all(color: AppColors.accent, width: 1),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Tìm kiếm chuyên khoa/dịch vụ',
                                    style: TextStyle(color: Colors.black54)),
                                Icon(Icons.search, color: AppColors.accent),
                              ],
                            ),
                          ),

                          // Danh sách dịch vụ theo chuyên khoa
                          groupedServices.isNotEmpty
                              ? Column(
                                  children:
                                      groupedServices.entries.map((entry) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        // Tiêu đề chuyên khoa
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 10, bottom: 5),
                                          child: Text(
                                            entry.key, // specialtyName
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                              color: AppColors.accent,
                                            ),
                                          ),
                                        ),
                                        // Danh sách dịch vụ
                                        GridView.builder(
                                          shrinkWrap: true,
                                          physics:
                                              NeverScrollableScrollPhysics(),
                                          padding: EdgeInsets.zero,
                                          gridDelegate:
                                              SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2,
                                            crossAxisSpacing: 8,
                                            mainAxisSpacing: 8,
                                          ),
                                          itemCount: entry.value.length,
                                          itemBuilder: (context, index) {
                                            final service = entry.value[index];
                                            return Container(
                                              padding: EdgeInsets.all(10),
                                              decoration: BoxDecoration(
                                                border: Border.all(
                                                    color: Colors.black,
                                                    width: 1),
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                              ),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(service.name,
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                  Text(service.formattedPrice,
                                                      style: TextStyle(
                                                          color: Colors.green)),
                                                  OutlinedButton(
                                                    onPressed: () =>
                                                        toggleServiceSelection(
                                                            service.id),
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                      backgroundColor:
                                                          selectedService
                                                                  .contains(
                                                                      service
                                                                          .id)
                                                              ? Colors.green
                                                              : Colors.blue,
                                                    ),
                                                    child: Text('Thêm dịch vụ'),
                                                  )
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                      ],
                                    );
                                  }).toList(),
                                )
                              : Center(child: Text('Không có dịch vụ')),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Thanh thông tin dịch vụ đã chọn
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Đã chọn ${selectedService.length} dịch vụ'),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Tổng thanh toán'),
                        Text(
                          formatCurrency(totalPrice), // Hiển thị tổng tiền
                        ),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () {
                        print(selectedService);
                        List<Service> selectedServiceList = services
                            .where((service) =>
                                selectedService.contains(service.id))
                            .toList();
                        Navigator.pop(context, selectedServiceList);
                      },
                      child: Text('Xong'),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
