import 'package:colored_box/assets/color_strings.dart';
import 'package:colored_box/assets/fonts.dart';
import 'package:colored_box/domain/entity/color_entity.dart';
import 'package:colored_box/presentation/color_screen.dart';
import 'package:flutter/material.dart';

class DetailedColorScreen extends StatelessWidget {
  final ColorEntity data;
  const DetailedColorScreen({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(MediaQuery.of(context).size.height /
              2), // here the desired height
          child: AppBar(
            flexibleSpace: Container(
              decoration: BoxDecoration(color: hexToColor(data.value!)),
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                data.name,
                style: AppTypography.fontTitleDetailedScreen,
              ),
              BoxShadow(
                title: AppStrings.titleDetailedScreenShadowBox,
                textValue: data.value!.replaceAll("#", ""),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BoxShadow(
                    title: RgbTitle.Red.name,
                    textValue: hexToColor(data.value!).red.toString(),
                  ),
                  BoxShadow(
                    title: RgbTitle.Green.name,
                    textValue: hexToColor(data.value!).green.toString(),
                  ),
                  BoxShadow(
                    title: RgbTitle.Blue.name,
                    textValue: hexToColor(data.value!).blue.toString(),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class BoxShadow extends StatelessWidget {
  final String title;
  final String textValue;
  final void onTap;
  const BoxShadow(
      {super.key, required this.title, required this.textValue, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      // Card(
      //   color: Colors.white,
      //   shadowColor: Colors.grey,
      //   elevation: 12,
      //   shape: RoundedRectangleBorder(
      //     borderRadius: BorderRadius.circular(16.0),
      // ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
          width: 5,
        ),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 5,
              spreadRadius: 1,
              offset: Offset(4, 4)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTypography.fontDetailedScreen),
            SizedBox(
              width: 16,
            ),
            Text(textValue, style: AppTypography.fontDetailedScreen),
          ],
        ),
      ),
    );
  }
}
