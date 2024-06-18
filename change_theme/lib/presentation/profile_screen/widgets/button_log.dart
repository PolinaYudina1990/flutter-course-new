import 'package:change_theme/assets/app_strings.dart';
import 'package:change_theme/core/utils/build_context_ext.dart';
import 'package:flutter/material.dart';

class ButtonLog extends StatelessWidget {
  const ButtonLog({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(
            style: TextButton.styleFrom(
              minimumSize: const Size(double.infinity, 48),
              side: BorderSide(
                width: 1,
                color: context.color.buttonLogAccentColor,
              ),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
            ),
            onPressed: () {},
            child: Text(
              AppStrings.buttonProfileScreen,
              style: context.text.buttonTitle,
            ),
          ),
        ),
      ),
    );
  }
}
