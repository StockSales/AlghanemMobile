import 'package:flutter/material.dart';

const double textInputBorderRadius = 50;
const InputDecorationTheme textFormFieldTheme = InputDecorationTheme(
  contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(textInputBorderRadius)),
    borderSide: BorderSide(
      color: Colors.black,
      width: 1,
    ),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(textInputBorderRadius)),
    borderSide: BorderSide(
      color: Colors.red,
      width: 1,
    ),
  ),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(textInputBorderRadius)),
    borderSide: BorderSide(
      color: Colors.grey,
      width: 1,
    ),
  ),
);
