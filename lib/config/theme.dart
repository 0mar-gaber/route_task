
import 'package:flutter/material.dart';
import '../core/utils/colors.dart';

class AppTheme{
  static ThemeData theme =ThemeData(
    colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primaryColor,
        primaryContainer: AppColors.backGroundColor,
        primary: AppColors.primaryColor,
      secondary: AppColors.textColor
    ),
    scaffoldBackgroundColor: AppColors.backGroundColor,

  );

}
