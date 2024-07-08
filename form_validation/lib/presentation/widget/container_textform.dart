import 'package:form_validation/utils/colors.dart';
import 'package:form_validation/utils/fonts.dart';
import 'package:flutter/material.dart';

class ContainerTextFormField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? validators;
  final String labelText;
  final TextInputType? keyboardType;
  final VoidCallback? onTap;
  const ContainerTextFormField({
    super.key,
    this.validators,
    required this.labelText,
    required this.controller,
    this.keyboardType,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: TextFormField(
        controller: controller,
        onTap: onTap,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        validator: validators as String? Function(String?)?,
        style: AppTypography.bodyText.copyWith(color: AppColors.greyDark),
        keyboardType: keyboardType,
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.white,
          focusColor: AppColors.white,
          border: border,
          focusedBorder: border,
          focusedErrorBorder: border,
          disabledBorder: border,
          enabledBorder: border,
          errorBorder: border,
          labelText: labelText,
          labelStyle: AppTypography.bodyText,
          errorStyle: AppTypography.bodyText
              .copyWith(color: AppColors.selected, fontSize: 12),
        ),
      ),
    );
  }
}

OutlineInputBorder border = OutlineInputBorder(
  borderRadius: BorderRadius.circular(12.0),
  borderSide: const BorderSide(color: AppColors.white),
);
