import 'package:change_theme/core/utils/build_context_ext.dart';
import 'package:flutter/material.dart';

class RadioButton extends StatelessWidget {
  final String title;
  final ThemeMode mode;
  final ThemeMode groupValue;
  final VoidCallback onChange;
  const RadioButton(
      {super.key,
      required this.title,
      required this.mode,
      required this.groupValue,
      required this.onChange});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      dense: true,
      contentPadding: EdgeInsets.zero,
      title: Text(
        title,
        style: context.text.buttonTitle
            .copyWith(color: context.color.myContainerTextColor),
      ),
      leading: Radio<ThemeMode>(
        overlayColor:
            MaterialStatePropertyAll(context.color.myContainerTitleColor),
        activeColor: context.color.accentColor,
        value: mode,
        groupValue: groupValue,
        onChanged: (value) {
          onChange();
        },
      ),
    );
  }
}
