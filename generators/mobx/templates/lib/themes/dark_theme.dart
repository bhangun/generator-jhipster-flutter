import 'package:flutter/material.dart';
import '../themes/material_theme_colors.dart';


class DarkTheme {

//final ThemeData darkTheme = _buildTheme();

static ThemeData buildTheme() {
   print('gelap');
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    primaryColor:  MatThemeColors.grey,
    buttonColor: MatThemeColors.grey,
    scaffoldBackgroundColor: MatThemeColors.grey[900],
    cardColor: MatThemeColors.grey,
    textSelectionColor: MatThemeColors.grey,
    errorColor: MatThemeColors.amber[300],
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.accent,
    ),
    primaryIconTheme: base.iconTheme.copyWith(
        color: MatThemeColors.grey
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
    // fontFamily: 'ProductSans',
    displayColor: MatThemeColors.amber[900],
    bodyColor: MatThemeColors.amber[100],
  );
}

}
