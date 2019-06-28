import 'package:flutter/material.dart';
import 'package:jh_flutter_mobx/themes/index.dart';

import 'material_theme_colors.dart';

class ThemeService{

  ThemeData darkTheme(){
    return buildTheme();
  }

  ThemeData lightTheme(){
    return lbuildTheme();
  }


  ThemeData lbuildTheme() {
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
    textTheme: _lbuildTextTheme(base.textTheme),
    primaryTextTheme: _lbuildTextTheme(base.primaryTextTheme),
    accentTextTheme: _lbuildTextTheme(base.accentTextTheme),
  );
}

 TextTheme _lbuildTextTheme(TextTheme base) {
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

ThemeData buildTheme() {
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

 TextTheme _buildTextTheme(TextTheme base) {
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
    displayColor: MatThemeColors.amber[900],
    bodyColor: MatThemeColors.amber[100],
  );
}

}