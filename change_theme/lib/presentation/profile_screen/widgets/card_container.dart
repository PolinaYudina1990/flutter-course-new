import 'package:change_theme/core/utils/build_context_ext.dart';
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final bool iconNeed;
  final String titleText;
  final String text;
  final VoidCallback? onTap;
  const MyContainer({
    super.key,
    required this.iconNeed,
    required this.titleText,
    required this.text,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: context.color.myContainerBackground,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleText,
                  style: context.text.myContainerTitle,
                ),
                Text(
                  text,
                  style: context.text.myContainerText,
                )
              ],
            ),
            if (iconNeed)
              IconButton(
                  onPressed: onTap,
                  icon: const Icon(
                    Icons.arrow_forward_ios,
                    size: 15,
                  ),
                  color: context.color.accentColor)
          ],
        ),
      ),
    );
  }
}
