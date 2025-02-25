import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:health_care/views/screens/welcome/splash_screen.dart';
import 'package:health_care/views/screens/clinic/clinic_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCqzgAi64GAYpZZ_pkEwriIV4-RFuYEgWM",
      appId: "1:357055052387:android:3ca405edbbe269ed929656",
      messagingSenderId: "357055052387",
      projectId: "health-care-a85f5",
      storageBucket: "health-care-a85f5.firebasestorage.app",
    ),
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Login',
      initialRoute: '/clinic',
      routes: {
        
        '/clinic':(context) => ClinicScreen(),
      },
    );
  }
}
