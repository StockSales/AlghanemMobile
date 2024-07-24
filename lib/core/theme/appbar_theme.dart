import 'package:el_ghanem_dot_net/core/theme/icon_theme.dart';
import 'package:flutter/material.dart';

import '../constants/app_colors/app_colors.dart';

const AppBarTheme appBarTheme = AppBarTheme(
  backgroundColor: AppColors.primaryColor,
  elevation: 0,
  iconTheme: iconTheme,
  centerTitle: true,
  titleTextStyle: TextStyle(
    color: AppColors.whiteColor,
    fontSize: 20,
    fontWeight: FontWeight.bold,
  ),
);
