import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/viewmodels/api_service.dart';
import 'package:health_care/views/widgets/widget_header_body_scoller.dart';
import 'package:health_care/models/service.dart';

class ServicecartScreen extends StatefulWidget {
  const ServicecartScreen({super.key});
  @override
  State<ServicecartScreen> createState() => _ServicecartScreen();
}

class _ServicecartScreen extends State<ServicecartScreen> {
  List<Service> services = [];

  @override
  void initState() {
    super.initState();
    fetchServices();
  }

  void fetchServices() async {
    List<Service>? data = await ApiService.getAllServe();
    if (mounted) {
      setState(() {
        services = data ?? [];
      });
    }
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

                          // Danh sách dịch vụ
                          services.isNotEmpty
                              ? GridView.builder(
                                  shrinkWrap: true,
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 8,
                                    mainAxisSpacing: 8,
                                  ),
                                  itemCount: services.length,
                                  itemBuilder: (context, index) {
                                    final service = services[index];
                                    return Container(
                                      child: Column(
                                        children: [
                                          Text(service.name),
                                          Text(service.description,),
                                          Text(service.price.toString()),
                                        ],
                                      ),
                                    );
                                  },
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
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(15),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Đã chọn 0 dịch vụ'),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text('Tổng thanh toán'),
                        Text('0k'),
                      ],
                    ),
                    OutlinedButton(
                      onPressed: () {},
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
