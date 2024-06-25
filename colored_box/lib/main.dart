import 'package:colored_box/data/api/colors_api_from_assets.dart';
import 'package:colored_box/data/mapper/color_mapper.dart';
import 'package:colored_box/data/repository/colors_repository.dart';
import 'package:colored_box/presentation/color_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

final colorsRepository = ColorRepository(
    colorsApi: ColorsApiFromAssets(), colorMapper: ColorMapper());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: ColorScreen(),
      ),
    );
  }
}
