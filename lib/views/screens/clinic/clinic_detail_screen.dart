import 'package:flutter/material.dart';

class ClinicDetailScreen extends StatelessWidget {
  const ClinicDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clinic Detail'),
      ),
      body: const Center(
        child: Text('Clinic Detail Screen'),
      ),
    );
  }
}


