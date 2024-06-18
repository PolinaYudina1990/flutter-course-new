part of '../theme.dart';

const headline1 =
    TextStyle(fontFamily: 'SF', fontWeight: FontWeight.w700, fontSize: 18);
const bodyText1 =
    TextStyle(fontFamily: 'SF', fontWeight: FontWeight.w400, fontSize: 14);
const headline2 =
    TextStyle(fontFamily: 'SF', fontWeight: FontWeight.w400, fontSize: 16);
const headline3 =
    TextStyle(fontFamily: 'SF', fontWeight: FontWeight.w400, fontSize: 12);

abstract class AppColors {
  static const white = Colors.white;
  static const black = Colors.black;
  static const grey = Color(0xFF222222);
  static const greyDark = Color(0xFF242439);
  static const greyOrange = Color(0xFF262020);
  static const lightGrey = Color(0xFF77767B);
  static const greyBack = Color(0xFFFAFAFA);

  static const greenLightBack = Color(0xFFF6F6F6);
  static const blueLightBack = Color(0xFFF5F8FD);
  static const orangeLightBack = Color(0xFFFAF8F7);
  static const greenDarkBack = Color(0xFF292929);
  static const blueDarkBack = Color(0xFF444C65);
  static const orangeDarkBack = Color(0xFF4A3F3B);

  static const blueBack = Color(0xFFF4F7FC);
  static const orangeBack = Color(0xFFFCF8F4);
  static const red = Color(0xFFFF392A);

  static const green = Color(0xFF6DD902);
  static const blue = Color(0xFF5114FF);
  static const lightBlue = Color(0xFF5261EB);
  static const orange = Color(0xFFFF7A00);
  static const lightOrange = Color(0xFFBE937B);

  static const greyBlue = Color(0xFF7B8EBE);
}

ThemeData getTheme(ThemeType type) {
  switch (type) {
    case ThemeType.system:
      return createLightGreenTheme();
    case ThemeType.lightGreen:
      return createLightGreenTheme();
    case ThemeType.darkGreen:
      return createDarkGreenTheme();
    case ThemeType.lightOrange:
      return createLightOrangeTheme();
    case ThemeType.lightBlue:
      return createLightBlueTheme();
    case ThemeType.darkOrange:
      return createDarkOrangeTheme();
    case ThemeType.darkBlue:
      return createDarkBlueTheme();
  }
}

enum ThemeType {
  system,
  lightGreen,
  lightOrange,
  lightBlue,
  darkGreen,
  darkOrange,
  darkBlue,
}

// enum MyThemeMode {
//   system,
//   light,
//   dark,
// }

extension MyThemeExtension on ThemeType {
  String get name {
    switch (this) {
      case ThemeType.system:
        return 'Системная';
      case ThemeType.lightGreen || ThemeType.lightOrange || ThemeType.lightBlue:
        return 'Светлая';
      case ThemeType.darkGreen || ThemeType.darkOrange || ThemeType.darkBlue:
        return 'Темная';
      default:
        return 'Системная';
    }
  }
}

extension ThemeModeExtension on ThemeType {
  ThemeMode themeMode() {
    switch (this) {
      case ThemeType.system:
        return ThemeMode.system;
      case ThemeType.lightGreen || ThemeType.lightOrange || ThemeType.lightBlue:
        return ThemeMode.light;
      case ThemeType.darkGreen || ThemeType.darkOrange || ThemeType.darkBlue:
        return ThemeMode.dark;
    }
  }
}
