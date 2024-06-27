part of '../theme.dart';

class ThemeTextStyles extends ThemeExtension<ThemeTextStyles> {
  final TextStyle appTitle;
  final TextStyle appBarAction;
  final TextStyle myContainerTitle;
  final TextStyle myContainerText;
  final TextStyle editAndBottomNavBarSmallText;
  final TextStyle buttonTitle;
  final TextStyle smallTitle;

  ThemeTextStyles({
    required this.appTitle,
    required this.appBarAction,
    required this.myContainerTitle,
    required this.myContainerText,
    required this.editAndBottomNavBarSmallText,
    required this.buttonTitle,
    required this.smallTitle,
  });

  @override
  ThemeExtension<ThemeTextStyles> copyWith({
    TextStyle? appTitle,
    TextStyle? appBarAction,
    TextStyle? myContainerTitle,
    TextStyle? myContainerText,
    TextStyle? editAndBottomNavBarSmallText,
    TextStyle? buttonTitle,
    TextStyle? smallTitle,
  }) {
    return ThemeTextStyles(
      appTitle: appTitle ?? this.appTitle,
      appBarAction: appBarAction ?? this.appBarAction,
      myContainerTitle: myContainerTitle ?? this.myContainerTitle,
      myContainerText: myContainerText ?? this.myContainerText,
      editAndBottomNavBarSmallText:
          editAndBottomNavBarSmallText ?? this.editAndBottomNavBarSmallText,
      buttonTitle: buttonTitle ?? this.buttonTitle,
      smallTitle: smallTitle ?? this.smallTitle,
    );
  }

  @override
  ThemeExtension<ThemeTextStyles> lerp(
    ThemeExtension<ThemeTextStyles>? other,
    double t,
  ) {
    if (other is! ThemeTextStyles) {
      return this;
    }

    return ThemeTextStyles(
      appTitle: TextStyle.lerp(appTitle, other.appTitle, t)!,
      appBarAction: TextStyle.lerp(appBarAction, other.appBarAction, t)!,
      myContainerTitle:
          TextStyle.lerp(myContainerTitle, other.myContainerTitle, t)!,
      myContainerText:
          TextStyle.lerp(myContainerText, other.myContainerText, t)!,
      editAndBottomNavBarSmallText: TextStyle.lerp(
          editAndBottomNavBarSmallText, other.editAndBottomNavBarSmallText, t)!,
      buttonTitle: TextStyle.lerp(buttonTitle, other.buttonTitle, t)!,
      smallTitle: TextStyle.lerp(smallTitle, other.smallTitle, t)!,
    );
  }

  static get lightGreen => ThemeTextStyles(
        appTitle: headline1.copyWith(
          color: AppColors.black,
        ),
        appBarAction: bodyText1.copyWith(
          color: AppColors.green,
          fontWeight: FontWeight.w500,
        ),
        myContainerTitle: headline1.copyWith(
          color: AppColors.greyBlue,
          fontWeight: FontWeight.w500,
        ),
        myContainerText: headline1.copyWith(
          color: AppColors.greyDark,
          fontWeight: FontWeight.w400,
        ),
        editAndBottomNavBarSmallText: headline2.copyWith(
          fontSize: 18,
        ),
        buttonTitle: headline2.copyWith(
          color: AppColors.red,
        ),
        smallTitle: headline2.copyWith(
          color: AppColors.black,
        ),
      );

  static get lightblue => ThemeTextStyles(
        appTitle: headline1.copyWith(
          color: AppColors.black,
        ),
        appBarAction: bodyText1.copyWith(
          color: AppColors.blue,
          fontWeight: FontWeight.w500,
        ),
        myContainerTitle: headline1.copyWith(
          color: AppColors.greyBlue,
          fontWeight: FontWeight.w500,
        ),
        myContainerText: headline1.copyWith(
          color: AppColors.greyDark,
          fontWeight: FontWeight.w400,
        ),
        editAndBottomNavBarSmallText: headline2.copyWith(
          fontSize: 18,
        ),
        buttonTitle: headline2.copyWith(
          color: AppColors.red,
        ),
        smallTitle: headline2.copyWith(
          color: AppColors.black,
        ),
      );

  static get lightOrange => ThemeTextStyles(
        appTitle: headline1.copyWith(
          color: AppColors.black,
        ),
        appBarAction: bodyText1.copyWith(
          color: AppColors.orange,
          fontWeight: FontWeight.w500,
        ),
        myContainerTitle: headline1.copyWith(
          color: AppColors.lightOrange,
          fontWeight: FontWeight.w500,
        ),
        myContainerText: headline1.copyWith(
          color: AppColors.greyOrange,
          fontWeight: FontWeight.w400,
        ),
        editAndBottomNavBarSmallText: headline2.copyWith(
          fontSize: 18,
        ),
        buttonTitle: headline2.copyWith(
          color: AppColors.red,
        ),
        smallTitle: headline2.copyWith(
          color: AppColors.black,
        ),
      );

  static get darkGreen => ThemeTextStyles(
        appTitle: headline1.copyWith(
          color: AppColors.white,
        ),
        appBarAction: bodyText1.copyWith(
          color: AppColors.green,
        ),
        myContainerTitle: bodyText1.copyWith(
          color: AppColors.lightGrey,
        ),
        myContainerText: bodyText1.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
        editAndBottomNavBarSmallText: headline3.copyWith(
          color: AppColors.white,
        ),
        buttonTitle: headline2.copyWith(
          color: AppColors.red,
        ),
        smallTitle: headline3.copyWith(
          color: AppColors.white,
        ),
      );

  static get darkBlue => ThemeTextStyles(
        appTitle: headline1.copyWith(
          color: AppColors.white,
        ),
        appBarAction: bodyText1.copyWith(
          color: AppColors.blue,
        ),
        myContainerTitle: bodyText1.copyWith(
          color: AppColors.lightBlue,
        ),
        myContainerText: bodyText1.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
        editAndBottomNavBarSmallText: headline3.copyWith(
          color: AppColors.white,
        ),
        buttonTitle: headline2.copyWith(
          color: AppColors.red,
        ),
        smallTitle: headline3.copyWith(
          color: AppColors.white,
        ),
      );

  static get darkOrange => ThemeTextStyles(
        appTitle: headline1.copyWith(
          color: AppColors.white,
        ),
        appBarAction: bodyText1.copyWith(
          color: AppColors.orange,
        ),
        myContainerTitle: bodyText1.copyWith(
          color: AppColors.lightOrange,
        ),
        myContainerText: bodyText1.copyWith(
          color: AppColors.white,
          fontWeight: FontWeight.w400,
        ),
        editAndBottomNavBarSmallText: headline3.copyWith(
          color: AppColors.white,
        ),
        buttonTitle: headline2.copyWith(
          color: AppColors.red,
        ),
        smallTitle: headline3.copyWith(
          color: AppColors.white,
        ),
      );
}
