import 'package:flutter/material.dart';
import 'package:flutter_app_course/strings/colors.dart';

class AppTypography {
  static const fontForBottom = TextStyle(
    color: AppColors.forBottom,
    fontFamily: 'Sora',
    fontSize: 16.0,
    fontWeight: FontWeight.w600,
  );
  static const fontForTitle = TextStyle(
    color: AppColors.mainBlack,
    fontFamily: 'Sora',
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
  );
  static const fontForSubtitleAppBar = TextStyle(
      color: AppColors.darkGrey,
      fontFamily: 'Sora',
      fontSize: 10.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);

  static const fontForListProduct = TextStyle(
      color: AppColors.mainBlack,
      fontFamily: 'Sora',
      fontSize: 12.0,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal);

  static const fontForResult = TextStyle(
    color: AppColors.mainBlack,
    fontFamily: 'Sora',
    fontSize: 17.0,
    fontWeight: FontWeight.w700,
  );

  static const fontTitleFilter = TextStyle(
    color: AppColors.mainBlack,
    fontFamily: 'Sora',
    fontSize: 20.0,
    fontWeight: FontWeight.w700,
  );

  static const fontButton = TextStyle(
    color: Colors.white,
    fontFamily: 'Sora',
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );

  static const fontTitleCategory = TextStyle(
    color: AppColors.mainBlack,
    fontFamily: 'Sora',
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
  );

  static const fontForEmptyScreen = TextStyle(
    color: AppColors.darkGrey,
    fontFamily: 'Sora',
    fontSize: 30.0,
    fontWeight: FontWeight.w900,
  );
}
