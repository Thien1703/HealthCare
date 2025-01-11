import 'package:flutter/material.dart';
import 'package:health_care/common/app_colors.dart';
import 'package:health_care/models/clinic/clinic.dart';
import 'package:health_care/views/screens/appointment/appointment_screen.dart';
import 'package:health_care/views/screens/clinic/clinic_detail_screen.dart';

class ClinicCard extends StatelessWidget {
  final Clinic clinic;

  const ClinicCard({super.key, required this.clinic});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 2,
      margin: const EdgeInsets.all(10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header
          _MedicalCardHeader(clinic: clinic),
          // Actions
          Container(
            decoration: const BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: _MedicalCardActions(
              clinic: clinic,
            ),
          ),
        ],
      ),
    );
  }
}

class _MedicalCardHeader extends StatelessWidget {
  final Clinic clinic;

  const _MedicalCardHeader({Key? key, required this.clinic}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              clinic.image,
              width: 48,
              height: 39,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  clinic.name,
                  style: const TextStyle(
                    color: AppColors.neutralBlack,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  clinic.address,
                  style: const TextStyle(
                    fontSize: 14,
                    color: AppColors.neutralGrey2,
                  ),
                ),
                const SizedBox(height: 5),
                _MedicalRatingRow(rating: clinic.rating),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MedicalRatingRow extends StatelessWidget {
  final double rating;

  const _MedicalRatingRow({Key? key, required this.rating}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int fullStars = rating.floor();
    bool hasHalfStar = (rating - fullStars) > 0;

    return Row(
      children: [
        Text(
          rating.toStringAsFixed(1),
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.neutralYellow,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(width: 5),
        Row(
          children: List.generate(
            fullStars,
            (index) => const Icon(
              Icons.star,
              size: 16,
              color: AppColors.neutralYellow,
            ),
          ),
        ),
        if (hasHalfStar)
          const Icon(
            Icons.star_half,
            size: 16,
            color: AppColors.neutralYellow,
          ),
        for (int i = 0; i < (5 - fullStars - (hasHalfStar ? 1 : 0)); i++)
          const Icon(
            Icons.star_border,
            size: 16,
            color: AppColors.neutralYellow,
          ),
      ],
    );
  }
}

class _MedicalCardActions extends StatelessWidget {
  const _MedicalCardActions({Key? key, required this.clinic}) : super(key: key);
  final Clinic clinic;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ClinicDetailScreen(
                  clinic: clinic,
                ),
              ),
            );
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(
              color: AppColors.accent,
              width: 2,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
            ),
          ),
          child: const Text(
            'Xem chi tiết',
            style: TextStyle(
              color: AppColors.accent,
              fontSize: 16,
            ),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AppointmentScreen(),
              ),
            );
            // Xử lý logic cho nút "Đặt khám ngay"
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.accent,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
              vertical: 15,
            ),
          ),
          child: const Text(
            "Đặt khám ngay",
            style: TextStyle(
              color: AppColors.neutralWhite,
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}
