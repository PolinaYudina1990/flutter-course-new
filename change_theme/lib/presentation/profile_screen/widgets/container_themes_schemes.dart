// ignore_for_file: prefer_const_constructors

import 'package:change_theme/core/utils/build_context_ext.dart';
import 'package:change_theme/presentation/themes/theme.dart';
import 'package:flutter/material.dart';

class ContainerThemeScheme extends StatelessWidget {
  final ThemeType myValue;
  final String title;
  final String imgName;
  final VoidCallback onTap;
  final bool selected;

  const ContainerThemeScheme(
      {super.key,
      required this.title,
      required this.onTap,
      required this.imgName,
      required this.myValue,
      required this.selected});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: width * 0.07),
        decoration: BoxDecoration(
            color: context.color.containerScheme,
            border: selected
                ? Border.all(color: context.color.accentColor, width: 1)
                : null,
            borderRadius: const BorderRadius.all(
              Radius.circular(16),
            )),
        child: Column(
          children: [
            Image.asset(
              imgName,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: selected
                  ? context.text.smallTitle
                  : context.text.smallTitle
                      .copyWith(color: context.color.myContainerTitleColor),
            ),
          ],
        ),
      ),
    );
  }
}
