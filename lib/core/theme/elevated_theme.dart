import 'package:flutter/material.dart';
import '../constants/app_colors/app_colors.dart';

final ElevatedButtonThemeData elevatedButtonThemeData = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryColor,
    minimumSize: const Size(double.infinity, 50),
    shape: const StadiumBorder(),
    foregroundColor: AppColors.whiteColor,
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    elevation: 10,
  ),
);
