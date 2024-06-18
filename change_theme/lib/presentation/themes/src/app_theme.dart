part of '../theme.dart';

ThemeData createSistemTheme() {
  final Brightness brightness =
      SchedulerBinding.instance.platformDispatcher.platformBrightness;
  if (brightness == Brightness.dark) {
    return ThemeData.dark();
  } else {
    return ThemeData.light();
  }
}

ThemeData createDarkGreenTheme() {
  return ThemeData(
      textTheme: createTextTheme(),
      scaffoldBackgroundColor: AppColors.black,
      extensions: <ThemeExtension<dynamic>>[
        ThemeColors.darkGreen,
        ThemeTextStyles.darkGreen,
      ],
      appBarTheme: const AppBarTheme(
        color: AppColors.black,
        iconTheme: IconThemeData(color: AppColors.green),
        titleTextStyle: headline1,
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: AppColors.grey));
}

ThemeData createDarkBlueTheme() {
  return ThemeData(
      textTheme: createTextTheme(),
      scaffoldBackgroundColor: AppColors.black,
      extensions: <ThemeExtension<dynamic>>[
        ThemeColors.darkBlue,
        ThemeTextStyles.darkBlue
      ],
      appBarTheme: const AppBarTheme(
        color: AppColors.black,
        iconTheme: IconThemeData(color: AppColors.greyBlue),
        titleTextStyle: headline1,
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: AppColors.grey));
}

ThemeData createDarkOrangeTheme() {
  return ThemeData(
      textTheme: createTextTheme(),
      scaffoldBackgroundColor: AppColors.black,
      extensions: <ThemeExtension<dynamic>>[
        ThemeColors.darkOrange,
        ThemeTextStyles.darkOrange,
      ],
      appBarTheme: const AppBarTheme(
        color: AppColors.black,
        iconTheme: IconThemeData(color: AppColors.orange),
        titleTextStyle: headline1,
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: AppColors.grey));
}

ThemeData createLightGreenTheme() {
  return ThemeData(
      textTheme: createTextTheme(),
      scaffoldBackgroundColor: AppColors.white,
      extensions: <ThemeExtension<dynamic>>[
        ThemeColors.lightGreen,
        ThemeTextStyles.lightGreen,
      ],
      appBarTheme: const AppBarTheme(
        color: AppColors.white,
        iconTheme: IconThemeData(color: AppColors.green),
        titleTextStyle: headline1,
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: AppColors.white));
}

ThemeData createLightBlueTheme() {
  return ThemeData(
      textTheme: createTextTheme(),
      scaffoldBackgroundColor: AppColors.blueBack,
      extensions: <ThemeExtension<dynamic>>[
        ThemeColors.lightBlue,
        ThemeTextStyles.lightblue,
      ],
      appBarTheme: const AppBarTheme(
        color: AppColors.blueBack,
        iconTheme: IconThemeData(color: AppColors.lightBlue),
        titleTextStyle: headline1,
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: AppColors.white));
}

ThemeData createLightOrangeTheme() {
  return ThemeData(
      textTheme: createTextTheme(),
      scaffoldBackgroundColor: AppColors.orangeBack,
      extensions: <ThemeExtension<dynamic>>[
        ThemeColors.lightOrange,
        ThemeTextStyles.lightOrange,
      ],
      appBarTheme: const AppBarTheme(
        color: AppColors.orangeBack,
        iconTheme: IconThemeData(color: AppColors.orange),
        titleTextStyle: headline1,
      ),
      bottomSheetTheme:
          const BottomSheetThemeData(backgroundColor: AppColors.white));
}
