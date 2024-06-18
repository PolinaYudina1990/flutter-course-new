import 'package:change_theme/presentation/themes/theme.dart';
import 'package:flutter/material.dart';

extension BuildContextExt on BuildContext {
  ThemeTextStyles get text => Theme.of(this).extension<ThemeTextStyles>()!;

  ThemeColors get color => Theme.of(this).extension<ThemeColors>()!;
}
