import 'package:flutter/material.dart';
import 'package:form_validation/utils/colors.dart';
import 'package:form_validation/utils/fonts.dart';

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool enabled;

  const ButtonWidget({
    super.key,
    required this.onPressed,
    this.enabled = false,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:
              enabled ? AppColors.selected : AppColors.buttonDisabled,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          minimumSize: const Size(double.infinity, 56),
        ),
        onPressed: onPressed,
        child: enabled
            ? const CircularProgressIndicator()
            : Text(
                'Отправить',
                style: enabled
                    ? AppTypography.headline2.copyWith(color: AppColors.white)
                    : AppTypography.headline2,
              ),
      ),
    );
  }
}
