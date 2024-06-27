// ignore_for_file: prefer_const_constructors

import 'package:change_theme/assets/app_strings.dart';
import 'package:change_theme/core/utils/build_context_ext.dart';
import 'package:change_theme/core/utils/theme_prefs_notif.dart';
import 'package:change_theme/presentation/profile_screen/widgets/button_ready.dart';
import 'package:change_theme/presentation/profile_screen/widgets/radio_button.dart';
import 'package:change_theme/presentation/profile_screen/widgets/theme_type_container.dart';
import 'package:change_theme/presentation/themes/theme.dart';
import 'package:flutter/material.dart';

class MyBottomSheet extends StatefulWidget {
  final ThemeType currentTheme;
  final ThemeNotifier themeNotifier;
  const MyBottomSheet(
      {super.key, required this.currentTheme, required this.themeNotifier});

  @override
  State<MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<MyBottomSheet>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;
  late ThemeType themeType = widget.currentTheme;
  late ThemeMode themeMode = themeType.themeMode();
  late final ThemeType initialPrefs;

  @override
  void initState() {
    initialPrefs = widget.currentTheme;
    super.initState();
  }

  void onChangeMode(
      ThemeMode? mode, ThemeType? type, ThemeNotifier themeNotifier) {
    setState(() {
      themeType = type!;
      themeMode = mode!;
      themeNotifier.setTheme(type);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  AppStrings.titleTheme,
                  style: context.text.appTitle,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close, color: context.color.accentColor),
                onPressed: () {
                  Navigator.of(context).pop();
                  widget.themeNotifier.setTheme(initialPrefs);
                },
              ),
            ],
          ),
          RadioButton(
            title: ThemeType.system.name,
            mode: ThemeMode.system,
            groupValue: themeMode,
            onChange: () {
              onChangeMode(
                  ThemeMode.system, ThemeType.system, widget.themeNotifier);
            },
          ),
          RadioButton(
            title: ThemeType.lightGreen.name,
            mode: ThemeMode.light,
            groupValue: themeMode,
            onChange: () {
              widget.themeNotifier.setTheme(themeType);
              onChangeMode(ThemeMode.light, themeType = ThemeType.lightGreen,
                  widget.themeNotifier);
            },
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return SizeTransition(sizeFactor: animation, child: child);
            },
            child: themeMode == ThemeMode.light
                ? ThemeTypeWidget(
                    currentTheme: themeType,
                    mode: ThemeMode.light,
                    onTypeChanged: (ThemeType value) {
                      widget.themeNotifier.setTheme(value);
                      themeType = value;
                    },
                  )
                : null,
          ),
          RadioButton(
            title: ThemeType.darkGreen.name,
            mode: ThemeMode.dark,
            groupValue: themeMode,
            onChange: () {
              onChangeMode(
                  ThemeMode.dark, ThemeType.darkGreen, widget.themeNotifier);
            },
          ),
          AnimatedSwitcher(
            duration: Duration(milliseconds: 300),
            transitionBuilder: (child, animation) {
              return SizeTransition(sizeFactor: animation, child: child);
            },
            child: themeMode == ThemeMode.dark
                ? ThemeTypeWidget(
                    currentTheme: themeType,
                    mode: ThemeMode.dark,
                    onTypeChanged: (ThemeType value) {
                      widget.themeNotifier.setTheme(value);
                      themeType = value;
                    },
                  )
                : null,
          ),
          ButtonReady(
            onTap: () {
              widget.themeNotifier.setTheme(themeType);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
    );
  }
}
