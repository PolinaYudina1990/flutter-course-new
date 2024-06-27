import 'package:change_theme/assets/app_strings.dart';
import 'package:change_theme/core/utils/build_context_ext.dart';
import 'package:change_theme/presentation/themes/theme.dart';
import 'package:flutter/material.dart';

class ButtonReady extends StatelessWidget {
  final VoidCallback onTap;
  const ButtonReady({super.key, required this.onTap});

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
              backgroundColor: context.color.buttonReadyColor,
              side: BorderSide(
                width: 1,
                color: context.color.buttonReadyColor,
              ),
              shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(16))),
            ),
            onPressed: () {
              onTap();
            },
            child: Text(
              AppStrings.buttonReadyProfileScreen,
              style: context.text.buttonTitle.copyWith(color: AppColors.white),
            ),
          ),
        ),
      ),
    );
  }
}
