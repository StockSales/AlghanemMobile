import 'package:flutter/material.dart';
import '../constants/app_colors/app_colors.dart';

final ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,

    shape: const StadiumBorder(),
  ),
);
