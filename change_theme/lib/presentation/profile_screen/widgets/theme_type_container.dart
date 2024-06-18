import 'package:change_theme/assets/app_strings.dart';
import 'package:change_theme/core/utils/build_context_ext.dart';
import 'package:change_theme/presentation/profile_screen/widgets/container_themes_schemes.dart';
import 'package:change_theme/presentation/themes/theme.dart';
import 'package:flutter/material.dart';

class ThemeTypeWidget extends StatefulWidget {
  final ValueChanged<ThemeType> onTypeChanged;
  final ThemeType currentTheme;
  final ThemeMode mode;

  const ThemeTypeWidget(
      {super.key,
      required this.currentTheme,
      required this.onTypeChanged,
      required this.mode});

  @override
  State<ThemeTypeWidget> createState() => _ThemeTypeWidgetState();
}

class _ThemeTypeWidgetState extends State<ThemeTypeWidget> {
  late ThemeType themeType = widget.currentTheme;
  late ThemeType themeType1;
  late ThemeType themeType2;
  late ThemeType themeType3;

  void onChangeTheme(ThemeType? value) {
    setState(() {
      themeType = value!;
      widget.onTypeChanged(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.mode == ThemeMode.light) {
      themeType1 = ThemeType.lightGreen;
      themeType2 = ThemeType.lightBlue;
      themeType3 = ThemeType.lightOrange;
    }
    if (widget.mode == ThemeMode.dark) {
      themeType1 = ThemeType.darkGreen;
      themeType2 = ThemeType.darkBlue;
      themeType3 = ThemeType.darkOrange;
    }
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStrings.titleThemeScheme,
            style: context.text.myContainerTitle,
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ContainerThemeScheme(
                title: AppStrings.themeSchemeTitle1,
                onTap: () {
                  onChangeTheme(themeType1);
                },
                imgName: IconStrings.themesScheme1,
                myValue: themeType1,
                selected: themeType == themeType1,
              ),
              ContainerThemeScheme(
                title: AppStrings.themeSchemeTitle2,
                onTap: () {
                  onChangeTheme(themeType2);
                },
                imgName: IconStrings.themesScheme2,
                myValue: themeType2,
                selected: themeType == themeType2,
              ),
              ContainerThemeScheme(
                title: AppStrings.themeSchemeTitle3,
                onTap: () {
                  onChangeTheme(themeType3);
                },
                imgName: IconStrings.themesScheme3,
                myValue: themeType3,
                selected: themeType == themeType3,
              ),
            ],
          )
        ],
      ),
    );
  }
}
