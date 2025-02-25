import 'package:flutter/material.dart';
import 'package:health_care/views/widgets/widget_header_body.dart';
import 'package:health_care/models/booking/specialty.dart';

class SpecialtyScreen extends StatefulWidget {
  const SpecialtyScreen({super.key, this.specialty});
  final Specialty? specialty;
  @override
  State<SpecialtyScreen> createState() => _SpecialtyScreen();
}

class _SpecialtyScreen extends State<SpecialtyScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController _searchController = TextEditingController();
    String _searchQuery = '';

    final List<Specialty> specialties = [
      Specialty(name: 'Da Liễu', description: 'Chuyên khoa da liễu'),
      Specialty(name: 'Phụ khoa', description: 'Chuyên khoa phụ khoa'),
      Specialty(name: 'Răng hàm mặt', description: 'Chuyên khoa răng hàm mặt'),
      Specialty(name: 'Tai mũi họng', description: 'Chuyên khoa tai mũi họng'),
      Specialty(name: 'Mắt', description: 'Chuyên khoa mắt'),
      Specialty(name: 'Ngoại', description: 'Chuyên khoa ngoại'),
      Specialty(name: 'Nội', description: 'Chuyên khoa nội'),
    ];

    return WidgetHeaderBody(
      iconBack: true,
      title: 'Chọn chuyên khoa',
      body: Container(
        child: Column(
          children: [
            //Thanh tìm kiếm
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Tìm chuyên khoa',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onChanged: (value) {
                  setState(() {
                    _searchQuery = value; // Cập nhật từ khóa tìm kiếm
                  });
                },
              ),
            ), //Thanh tìm kiếm
            Expanded(
                child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: EdgeInsets.all(10),
              children: specialties.map((specialty) {
                return Card(
                  child: Center(
                    child: Text(specialty.name),
                  ),
                );
              }).toList(),
            ))
          ],
        ),
      ),
    );
  }
}
