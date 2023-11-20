import 'package:flutter/material.dart';
import 'package:validated_form/form.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  final String titleText = 'custom form';
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: FormValidationScreen(),
    );
  }
}
