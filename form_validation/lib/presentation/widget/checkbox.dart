import 'package:flutter/material.dart';
import 'package:form_validation/presentation/widget/container_textform.dart';
import 'package:form_validation/utils/app_strings.dart';
import 'package:form_validation/utils/colors.dart';

class CheckboxWidget extends StatelessWidget {
  final bool value;
  final bool submited;
  final String title;
  final ValueChanged<bool?>? onChanged;
  final bool enabled;
  final VoidCallback? onTapTextFieldCheckBox;
  final TextEditingController? controllerTextFieldCheckBox;
  const CheckboxWidget(
      {super.key,
      required this.title,
      required this.value,
      this.onChanged,
      this.onTapTextFieldCheckBox,
      this.controllerTextFieldCheckBox,
      required this.submited,
      required this.enabled});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Transform.scale(
              scale: 1.3,
              child: Checkbox(
                value: value,
                onChanged: onChanged,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(6),
                ),
                side: MaterialStateBorderSide.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.focused) ||
                        states.contains(MaterialState.selected) ||
                        states.contains(MaterialState.pressed)) {
                      return const BorderSide(
                          width: 1.0, color: AppColors.selected);
                    } else {
                      return const BorderSide(
                          width: 1.0, color: AppColors.white);
                    }
                  },
                ),
                activeColor: AppColors.selected,
                fillColor: MaterialStateProperty.resolveWith((states) {
                  if (states.contains(MaterialState.focused) ||
                      states.contains(MaterialState.selected) ||
                      states.contains(MaterialState.pressed)) {
                    return AppColors.selected;
                  } else {
                    return AppColors.white;
                  }
                }),
                checkColor: AppColors.white,
              ),
            ),
            Text(title),
          ],
        ),
        if (value == true)
          ContainerTextFormField(
            enabled: enabled,
            labelText: AppStrings.pasportPageSubtitleVaccine,
            onTap: onTapTextFieldCheckBox,
            controller: controllerTextFieldCheckBox,
          ),
      ],
    );
  }
}
