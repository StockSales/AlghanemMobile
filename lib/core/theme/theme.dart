import 'package:flutter/material.dart';
import '../constants/app_colors/app_colors.dart';
import 'FAB_theme.dart';
import 'appbar_theme.dart';
import 'elevated_theme.dart';
import 'icon_theme.dart';
import 'text_form_fields_theme.dart';

final ThemeData lightTheme = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  fontFamily: 'Poppins',
  brightness: Brightness.light,
  scaffoldBackgroundColor: AppColors.whiteColor,
  appBarTheme: appBarTheme,
  floatingActionButtonTheme: fabTheme,
  // bottomNavigationBarTheme: bottomNavBarTheme,
  iconTheme: iconTheme,
  elevatedButtonTheme: elevatedButtonThemeData,
 inputDecorationTheme: textFormFieldTheme,
);
