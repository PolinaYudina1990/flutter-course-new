import 'package:form_validation/utils/colors.dart';
import 'package:form_validation/presentation/pet_profile_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        backgroundColor: AppColors.background,
        body: PetProfile(),
      ),
    );
  }
}
