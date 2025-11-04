import 'package:flutter/material.dart';
import 'package:health/dashboard.dart';

void main() {
  runApp(const HealthApp());
}

class HealthApp extends StatelessWidget {
  const HealthApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Health App',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Arial'),
      home: const HealthDashboardScreen(),
    );
  }
}
