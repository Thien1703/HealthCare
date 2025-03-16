import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';

class HospitalInfoWidget extends StatelessWidget {
  const HospitalInfoWidget({
    super.key,
    required this.nameHospital,
    required this.addressHospital,
  });

  final String nameHospital;
  final String addressHospital;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity, 
      padding: EdgeInsets.all(10) ,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: AppColors.accent, width: 1.5),
        borderRadius: BorderRadius.all(
          Radius.circular(15),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.local_hospital,
                size: 23,
                color: Colors.blue,
              ),
              SizedBox(width: 10), 
              Expanded( 
                child: Text(
                  nameHospital,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.neutralDarkGreen1,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Row(
            children: [
              Icon(
                Icons.location_on,
                size: 20,
                color: const Color.fromARGB(255, 255, 58, 58),
              ),
              SizedBox(width: 10), 
              Expanded( 
                child: Text(
                  addressHospital,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: AppColors.neutralGrey3,
                  ),
                  overflow: TextOverflow.ellipsis, 
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}