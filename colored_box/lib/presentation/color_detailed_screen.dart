import 'package:colored_box/assets/color_strings.dart';
import 'package:colored_box/assets/fonts.dart';
import 'package:colored_box/domain/entity/color_entity.dart';
import 'package:colored_box/presentation/color_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';

bool onTapValue = false;

Future<void> onTapCopy(ColorEntity data) {
  return Clipboard.setData(ClipboardData(text: data.value.toString()));
}

class DetailedColorScreen extends StatefulWidget {
  final ColorEntity data;
  const DetailedColorScreen({super.key, required this.data});

  @override
  State<DetailedColorScreen> createState() => _DetailedColorScreenState();
}

class _DetailedColorScreenState extends State<DetailedColorScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(MediaQuery.of(context).size.height / 2),
        child: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(color: hexToColor(widget.data.value!)),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.data.name,
              style: AppTypography.fontTitleDetailedScreen,
            ),
            const SizedBox(
              height: 16,
            ),
            InkWell(
              onTap: () async {
                await onTapCopy(widget.data);
                setState(() {
                  onTapValue = true;
                });
              },
              child: MyBoxShadow(
                title: AppStrings.titleDetailedScreenShadowBox,
                textValue: widget.data.value!.replaceAll("#", ""),
                iconNeed: true,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                MyBoxShadow(
                  title: RgbTitle.red.name,
                  textValue: hexToColor(widget.data.value!).red.toString(),
                  iconNeed: false,
                ),
                MyBoxShadow(
                  title: RgbTitle.Green.name,
                  textValue: hexToColor(widget.data.value!).green.toString(),
                  iconNeed: false,
                ),
                MyBoxShadow(
                  title: RgbTitle.Blue.name,
                  textValue: hexToColor(widget.data.value!).blue.toString(),
                  iconNeed: false,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyBoxShadow extends StatelessWidget {
  final String title;
  final String textValue;
  final bool iconNeed;
  const MyBoxShadow(
      {super.key,
      required this.title,
      required this.textValue,
      required this.iconNeed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
              color: Colors.grey[200]!,
              blurRadius: 12,
              spreadRadius: 1,
              offset: const Offset(0, 12)),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title, style: AppTypography.fontDetailedScreen),
            const SizedBox(
              width: 16,
            ),
            if (onTapValue == true && iconNeed == true)
              Row(
                children: [
                  Text(textValue, style: AppTypography.fontDetailedScreen),
                  const SizedBox(width: 10),
                  const SvgIcon(
                    icon: SvgIconData(IconStrings.copyIcon),
                    color: Colors.grey,
                    size: 15,
                  ),
                ],
              )
            else
              Text(textValue, style: AppTypography.fontDetailedScreen),
          ],
        ),
      ),
    );
  }
}
