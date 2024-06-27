part of '../theme.dart';

class ThemeColors extends ThemeExtension<ThemeColors> {
  final Color myContainerBackground;
  final Color myContainerTitleColor;
  final Color myContainerTextColor;
  final Color buttonLogAccentColor;
  final Color buttonReadyColor;
  final Color accentColor;
  final Color buttonTitle;
  final Color containerScheme;

  const ThemeColors({
    required this.myContainerBackground,
    required this.myContainerTitleColor,
    required this.myContainerTextColor,
    required this.buttonLogAccentColor,
    required this.buttonReadyColor,
    required this.accentColor,
    required this.buttonTitle,
    required this.containerScheme,
  });

  @override
  ThemeExtension<ThemeColors> copyWith({
    Color? myContainerBackground,
    Color? myContainerTitleColor,
    Color? myContainerTextColor,
    Color? buttonLogAccentColor,
    Color? buttonReadyColor,
    Color? accentColor,
    Color? buttonTitle,
    Color? containerScheme,
  }) {
    return ThemeColors(
      myContainerBackground:
          myContainerBackground ?? this.myContainerBackground,
      myContainerTitleColor:
          myContainerTitleColor ?? this.myContainerTitleColor,
      myContainerTextColor: myContainerTextColor ?? this.myContainerTextColor,
      buttonLogAccentColor: buttonLogAccentColor ?? this.buttonLogAccentColor,
      buttonReadyColor: buttonReadyColor ?? this.buttonReadyColor,
      accentColor: accentColor ?? this.accentColor,
      buttonTitle: buttonTitle ?? this.buttonTitle,
      containerScheme: containerScheme ?? this.containerScheme,
    );
  }

  @override
  ThemeExtension<ThemeColors> lerp(
    ThemeExtension<ThemeColors>? other,
    double t,
  ) {
    if (other is! ThemeColors) {
      return this;
    }

    return ThemeColors(
      myContainerBackground:
          Color.lerp(myContainerBackground, other.myContainerBackground, t)!,
      myContainerTitleColor:
          Color.lerp(myContainerTitleColor, other.myContainerTitleColor, t)!,
      myContainerTextColor:
          Color.lerp(myContainerTextColor, other.myContainerTextColor, t)!,
      buttonLogAccentColor:
          Color.lerp(buttonLogAccentColor, other.buttonLogAccentColor, t)!,
      buttonReadyColor:
          Color.lerp(buttonReadyColor, other.buttonReadyColor, t)!,
      accentColor: Color.lerp(accentColor, other.accentColor, t)!,
      buttonTitle: Color.lerp(buttonTitle, other.buttonTitle, t)!,
      containerScheme: Color.lerp(buttonTitle, other.buttonTitle, t)!,
    );
  }

  static get lightGreen => const ThemeColors(
        myContainerBackground: AppColors.greyBack,
        myContainerTitleColor: AppColors.lightGrey,
        myContainerTextColor: AppColors.grey,
        buttonLogAccentColor: AppColors.red,
        buttonReadyColor: AppColors.blue,
        accentColor: AppColors.green,
        buttonTitle: AppColors.black,
        containerScheme: AppColors.greyBack,
      );

  static get lightBlue => const ThemeColors(
        myContainerBackground: AppColors.white,
        myContainerTitleColor: AppColors.lightGrey,
        myContainerTextColor: AppColors.grey,
        buttonLogAccentColor: AppColors.red,
        buttonReadyColor: AppColors.lightBlue,
        accentColor: AppColors.lightBlue,
        buttonTitle: AppColors.black,
        containerScheme: AppColors.blueLightBack,
      );

  static get lightOrange => const ThemeColors(
        myContainerBackground: AppColors.greyBack,
        myContainerTitleColor: AppColors.lightOrange,
        myContainerTextColor: AppColors.grey,
        buttonLogAccentColor: AppColors.red,
        buttonReadyColor: AppColors.orange,
        accentColor: AppColors.orange,
        buttonTitle: AppColors.black,
        containerScheme: AppColors.orangeLightBack,
      );

  static get darkGreen => const ThemeColors(
        myContainerBackground: AppColors.grey,
        myContainerTitleColor: AppColors.lightGrey,
        myContainerTextColor: AppColors.white,
        buttonLogAccentColor: AppColors.red,
        buttonReadyColor: AppColors.blue,
        accentColor: AppColors.green,
        buttonTitle: AppColors.white,
        containerScheme: AppColors.greenDarkBack,
      );

  static get darkBlue => const ThemeColors(
        myContainerBackground: AppColors.grey,
        myContainerTitleColor: AppColors.lightGrey,
        myContainerTextColor: AppColors.white,
        buttonLogAccentColor: AppColors.red,
        buttonReadyColor: AppColors.lightBlue,
        accentColor: AppColors.lightBlue,
        buttonTitle: AppColors.white,
        containerScheme: AppColors.blueDarkBack,
      );

  static get darkOrange => const ThemeColors(
        myContainerBackground: AppColors.grey,
        myContainerTitleColor: AppColors.lightGrey,
        myContainerTextColor: AppColors.white,
        buttonLogAccentColor: AppColors.red,
        buttonReadyColor: AppColors.orange,
        accentColor: AppColors.orange,
        buttonTitle: AppColors.white,
        containerScheme: AppColors.orangeDarkBack,
      );
}
