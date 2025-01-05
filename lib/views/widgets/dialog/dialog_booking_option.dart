import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dialog Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DialogTestScreen(),
    );
  }
}

class DialogTestScreen extends StatelessWidget {
  const DialogTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Test DialogBokingOption'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            // Hiển thị DialogBokingOption
            showDialog(
              context: context,
              builder: (context) => const DialogBokingOption(),
            );
          },
          child: const Text('Show Dialog'),
        ),
      ),
    );
  }
}

class DialogBokingOption extends StatelessWidget {
  const DialogBokingOption({super.key});

  @override
  Widget build(BuildContext context) {
    return Text("Hello");
  }
}
