import 'package:form_validation/utils/colors.dart';
import 'package:flutter/material.dart';

class IconPet extends StatelessWidget {
  final bool isSelected;
  final String iconName;
  final String iconText;
  final VoidCallback onPressed;
  const IconPet(
      {super.key,
      required this.isSelected,
      required this.onPressed,
      required this.iconName,
      required this.iconText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Column(
        children: [
          Container(
            height: 72,
            width: 72,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.selected : AppColors.white,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Image.asset(
                iconName,
                color: isSelected ? AppColors.white : AppColors.black,
              ),
            ),
          ),
          Text(iconText),
        ],
      ),
    );
  }
}
