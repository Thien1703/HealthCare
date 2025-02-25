import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; 
import 'package:health_care/common/app_colors.dart';  
import 'package:health_care/models/clinic/clinic.dart';  
import 'package:health_care/views/screens/clinic/clinic_card.dart';  
import 'package:health_care/viewmodels/clinic_viewmodel.dart';  
class ClinicScreen extends StatefulWidget {
  const ClinicScreen({super.key});

  @override
  State<ClinicScreen> createState() => _ClinicScreenState();
}

class _ClinicScreenState extends State<ClinicScreen> {
  final TextEditingController _searchController = TextEditingController();
  
  @override
  void initState() {
    super.initState();
   
    Future.delayed(Duration.zero, () {
      context.read<ClinicViewModel>().fetchClinics();
    });
  }

  @override
  Widget build(BuildContext context) {
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
  }
}
