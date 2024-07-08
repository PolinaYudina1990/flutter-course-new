import 'package:flutter/material.dart';

class PageViewItem extends StatelessWidget {
  final String color;
  const PageViewItem({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16.0),
      child: Image.asset(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.75,
        color,
        fit: BoxFit.cover,
      ),
    );
  }
}
