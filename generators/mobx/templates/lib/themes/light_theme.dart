import 'package:flutter/material.dart';

import 'material_theme_colors.dart';

class LightTheme {

//final ThemeData lightTheme = _buildTheme();

static ThemeData buildTheme() {
  print('terang');
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: MatThemeColors.blue[800],
    primaryColor: MatThemeColors.blue[500],
    buttonColor: MatThemeColors.blue[200],
    scaffoldBackgroundColor: MatThemeColors.blue[50],
    cardColor: MatThemeColors.blue[50],
    textSelectionColor: MatThemeColors.blue[200],
    errorColor: MatThemeColors.deepPurple[200],
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    primaryIconTheme: base.iconTheme.copyWith(
        color: MatThemeColors.deepPurple[100]
    ),
    textTheme: _buildTextTheme(base.textTheme),
    primaryTextTheme: _buildTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildTextTheme(base.accentTextTheme),
  );
}

static TextTheme _buildTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
    body2: base.body2.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 16.0,
    ),
  ).apply(
    fontFamily: 'ProductSans',
    displayColor: MatThemeColors.blue,
    bodyColor: MatThemeColors.black,
  );
}

}