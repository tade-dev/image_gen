import 'package:app/core/resources/colors_x.dart';
import 'package:flutter/material.dart';

final ThemeData themeData = ThemeData(
  brightness: Brightness.light,
  scaffoldBackgroundColor: ColorManager.backgroundColor,
  appBarTheme: const AppBarTheme(
    backgroundColor: ColorManager.backgroundColor,
    elevation: 0,
    scrolledUnderElevation: 0
  ),
  iconTheme: const IconThemeData(
    color: ColorManager.primaryTextColor
  ),
);