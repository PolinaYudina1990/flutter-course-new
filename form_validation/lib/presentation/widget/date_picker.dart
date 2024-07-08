import 'package:flutter/material.dart';

Future<DateTime?> selectDate({
  required BuildContext context,
}) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now().subtract(const Duration(days: 1)),
    firstDate: DateTime(2010),
    lastDate: DateTime.now(),
  );
}
