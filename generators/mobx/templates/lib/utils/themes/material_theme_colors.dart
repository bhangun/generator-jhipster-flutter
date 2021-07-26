import 'dart:ui';
import 'package:flutter/material.dart';

class MatThemeColors {
  MatThemeColors._(); // this basically makes it so you can instantiate this class
  static const _greyPrimaryValue = 0xFF93c47d;
  static const _greenPrimaryValue = 0xFF4CAF50;
  static const _lightGreenPrimaryValue = 0xFF8BC34A;
  static const _amberPrimaryValue = 0xFFFFC107;
  static const _indigoPrimaryValue = 0xFF3F51B5;
  static const _bluePrimaryValue = 0xFF2196F3;
  static const _deepPurplePrimaryValue = 0xFF673AB7;
  static const _orangePrimaryValue = 0xFFFF9800;
  static const _redPrimaryValue = 0xFFF44336;
  static const _pinkPrimaryValue = 0xFFE91E63;
  static const _purplePrimaryValue = 0xFF673AB7;
  static const _lightBluePrimaryValue = 0xFF03A9F4;
  static const _cyanPrimaryValue = 0xFF00BCD4;
  static const _tealPrimaryValue = 0xFF009688;
  static const _limePrimaryValue = 0xFFCDDC39;
  static const _yellowPrimaryValue = 0xFFFFEB3B;
  static const _deepOrangePrimaryValue = 0xFFFF5722;
  static const _brownPrimaryValue = 0xFF795548;
  static const _blueGreyPrimaryValue = 0xFF607D8B;

  static const Color black = Color(0xFF000000);

  static const Color white = Color(0xFFFFFFFF);

  static const Color transparent = Color(0x00000000);

  static const List<MaterialColor> primaries = <MaterialColor>[
    red,
    pink,
    purple,
    deepPurple,
    indigo,
    blue,
    lightBlue,
    cyan,
    teal,
    green,
    lightGreen,
    lime,
    yellow,
    amber,
    orange,
    deepOrange,
    brown,
    // The grey swatch is intentionally omitted because when picking a color
    // randomly from this list to colorize an application, picking grey suddenly
    // makes the app look disabled.
    blueGrey,
  ];

  static const MaterialColor blueGrey = MaterialColor(
  _blueGreyPrimaryValue,
  <int, Color>{
     50: Color(0xFFECEFF1),
    100: Color(0xFFCFD8DC),
    200: Color(0xFFB0BEC5),
    300: Color(0xFF90A4AE),
    400: Color(0xFF78909C),
    500: Color(_blueGreyPrimaryValue),
    600: Color(0xFF546E7A),
    700: Color(0xFF455A64),
    800: Color(0xFF37474F),
    900: Color(0xFF263238),
  });

  static const MaterialColor brown = MaterialColor(
  _brownPrimaryValue,
  <int, Color>{
     50: Color(0xFFEFEBE9),
    100: Color(0xFFD7CCC8),
    200: Color(0xFFBCAAA4),
    300: Color(0xFFA1887F),
    400: Color(0xFF8D6E63),
    500: Color(_brownPrimaryValue),
    600: Color(0xFF6D4C41),
    700: Color(0xFF5D4037),
    800: Color(0xFF4E342E),
    900: Color(0xFF3E2723),
  });

  static const MaterialColor deepOrange = MaterialColor(
  _deepOrangePrimaryValue,
  <int, Color>{
     50: Color(0xFFFBE9E7),
    100: Color(0xFFFFCCBC),
    200: Color(0xFFFFAB91),
    300: Color(0xFFFF8A65),
    400: Color(0xFFFF7043),
    500: Color(_deepOrangePrimaryValue),
    600: Color(0xFFF4511E),
    700: Color(0xFFE64A19),
    800: Color(0xFFD84315),
    900: Color(0xFFBF360C),
  });

  static const MaterialColor yellow = MaterialColor(
  _yellowPrimaryValue,
  <int, Color>{
     50: Color(0xFFFFFDE7),
    100: Color(0xFFFFF9C4),
    200: Color(0xFFFFF59D),
    300: Color(0xFFFFF176),
    400: Color(0xFFFFEE58),
    500: Color(_yellowPrimaryValue),
    600: Color(0xFFFDD835),
    700: Color(0xFFFBC02D),
    800: Color(0xFFF9A825),
    900: Color(0xFFF57F17),
  });

  static const MaterialColor lightGreen = MaterialColor(
  _lightGreenPrimaryValue,
  <int, Color>{
     50: Color(0xFFF1F8E9),
    100: Color(0xFFDCEDC8),
    200: Color(0xFFC5E1A5),
    300: Color(0xFFAED581),
    400: Color(0xFF9CCC65),
    500: Color(_lightGreenPrimaryValue),
    600: Color(0xFF7CB342),
    700: Color(0xFF689F38),
    800: Color(0xFF558B2F),
    900: Color(0xFF33691E),
  });

  static const MaterialColor lime = MaterialColor(
  _limePrimaryValue,
  <int, Color>{
     50: Color(0xFFF9FBE7),
    100: Color(0xFFF0F4C3),
    200: Color(0xFFE6EE9C),
    300: Color(0xFFDCE775),
    400: Color(0xFFD4E157),
    500: Color(_limePrimaryValue),
    600: Color(0xFFC0CA33),
    700: Color(0xFFAFB42B),
    800: Color(0xFF9E9D24),
    900: Color(0xFF827717),
  });

  static const MaterialColor teal = MaterialColor(
  _tealPrimaryValue,
  <int, Color>{
     50: Color(0xFFE0F2F1),
    100: Color(0xFFB2DFDB),
    200: Color(0xFF80CBC4),
    300: Color(0xFF4DB6AC),
    400: Color(0xFF26A69A),
    500: Color(_tealPrimaryValue),
    600: Color(0xFF00897B),
    700: Color(0xFF00796B),
    800: Color(0xFF00695C),
    900: Color(0xFF004D40),
  });

  static const MaterialColor cyan = MaterialColor(
  _cyanPrimaryValue,
  <int, Color>{
     50: Color(0xFFE0F7FA),
    100: Color(0xFFB2EBF2),
    200: Color(0xFF80DEEA),
    300: Color(0xFF4DD0E1),
    400: Color(0xFF26C6DA),
    500: Color(_cyanPrimaryValue),
    600: Color(0xFF00ACC1),
    700: Color(0xFF0097A7),
    800: Color(0xFF00838F),
    900: Color(0xFF006064),
  });

  static const MaterialColor lightBlue = MaterialColor(
  _lightBluePrimaryValue,
  <int, Color>{
     50: Color(0xFFE1F5FE),
    100: Color(0xFFB3E5FC),
    200: Color(0xFF81D4FA),
    300: Color(0xFF4FC3F7),
    400: Color(0xFF29B6F6),
    500: Color(_lightBluePrimaryValue),
    600: Color(0xFF039BE5),
    700: Color(0xFF0288D1),
    800: Color(0xFF0277BD),
    900: Color(0xFF01579B),
  });


  static const MaterialColor pink = MaterialColor(_pinkPrimaryValue,
  <int, Color>{
     50: Color(0xFFFCE4EC),
    100: Color(0xFFF8BBD0),
    200: Color(0xFFF48FB1),
    300: Color(0xFFF06292),
    400: Color(0xFFEC407A),
    500: Color(_pinkPrimaryValue),
    600: Color(0xFFD81B60),
    700: Color(0xFFC2185B),
    800: Color(0xFFAD1457),
    900: Color(0xFF880E4F),
  });

  static const MaterialColor purple = MaterialColor(_purplePrimaryValue,<int, Color>{
     50: Color(0xFFF3E5F5),
    100: Color(0xFFE1BEE7),
    200: Color(0xFFCE93D8),
    300: Color(0xFFBA68C8),
    400: Color(0xFFAB47BC),
    500: Color(_purplePrimaryValue),
    600: Color(0xFF8E24AA),
    700: Color(0xFF7B1FA2),
    800: Color(0xFF6A1B9A),
    900: Color(0xFF4A148C),
  });

  static const MaterialColor green = MaterialColor(_greenPrimaryValue,<int, Color>{
    50: const Color(0xFFf2f8ef),
    100: const Color(0xFFdfedd8),
    200: const Color(0xFFc9e2be),
    300: const Color(0xFFb3d6a4),
    400: const Color(0xFFa3cd91),
    500: const Color(0xFF93c47d),
    600: const Color(0xFF8bbe75),
    700: const Color(0xFF80b66a),
    800: const Color(0xFF76af60),
    900: const Color(0xFF64a24d)
  });

  static const MaterialColor grey = MaterialColor( _greyPrimaryValue,
  <int, Color>{
     50: Color(0xFFFAFAFA),
    100: Color(0xFFF5F5F5),
    200: Color(0xFFEEEEEE),
    300: Color(0xFFE0E0E0),
    350: Color(0xFFD6D6D6), // only for raised button while pressed in light theme
    400: Color(0xFFBDBDBD),
    500: Color(_greyPrimaryValue),
    600: Color(0xFF757575),
    700: Color(0xFF616161),
    800: Color(0xFF424242),
    850: Color(0xFF303030), // only for background color in dark theme
    900: Color(0xFF212121),
  });

static const MaterialColor amber = MaterialColor(_amberPrimaryValue,
  <int, Color>{
     50: Color(0xFFFFF8E1),
    100: Color(0xFFFFECB3),
    200: Color(0xFFFFE082),
    300: Color(0xFFFFD54F),
    400: Color(0xFFFFCA28),
    500: Color(_amberPrimaryValue),
    600: Color(0xFFFFB300),
    700: Color(0xFFFFA000),
    800: Color(0xFFFF8F00),
    900: Color(0xFFFF6F00),
  });

  static const MaterialColor blue = MaterialColor(_bluePrimaryValue,
  <int, Color>{
     50: Color(0xFFE3F2FD),
    100: Color(0xFFBBDEFB),
    200: Color(0xFF90CAF9),
    300: Color(0xFF64B5F6),
    400: Color(0xFF42A5F5),
    500: Color(_bluePrimaryValue),
    600: Color(0xFF1E88E5),
    700: Color(0xFF1976D2),
    800: Color(0xFF1565C0),
    900: Color(0xFF0D47A1),
  });

  static const MaterialColor indigo = MaterialColor(_indigoPrimaryValue,
  <int, Color>{
     50: Color(0xFFE8EAF6),
    100: Color(0xFFC5CAE9),
    200: Color(0xFF9FA8DA),
    300: Color(0xFF7986CB),
    400: Color(0xFF5C6BC0),
    500: Color(_indigoPrimaryValue),
    600: Color(0xFF3949AB),
    700: Color(0xFF303F9F),
    800: Color(0xFF283593),
    900: Color(0xFF1A237E),
  });

  static const MaterialColor deepPurple = MaterialColor(_deepPurplePrimaryValue,
  <int, Color>{
     50: Color(0xFFEDE7F6),
    100: Color(0xFFD1C4E9),
    200: Color(0xFFB39DDB),
    300: Color(0xFF9575CD),
    400: Color(0xFF7E57C2),
    500: Color(_deepPurplePrimaryValue),
    600: Color(0xFF5E35B1),
    700: Color(0xFF512DA8),
    800: Color(0xFF4527A0),
    900: Color(0xFF311B92),
  });

  static const MaterialColor orange = MaterialColor(
  _orangePrimaryValue,
  <int, Color>{
     50: Color(0xFFFFF3E0),
    100: Color(0xFFFFE0B2),
    200: Color(0xFFFFCC80),
    300: Color(0xFFFFB74D),
    400: Color(0xFFFFA726),
    500: Color(_orangePrimaryValue),
    600: Color(0xFFFB8C00),
    700: Color(0xFFF57C00),
    800: Color(0xFFEF6C00),
    900: Color(0xFFE65100),
  });

  static const MaterialColor red = MaterialColor(
  _redPrimaryValue,
  <int, Color>{
     50: Color(0xFFFFEBEE),
    100: Color(0xFFFFCDD2),
    200: Color(0xFFEF9A9A),
    300: Color(0xFFE57373),
    400: Color(0xFFEF5350),
    500: Color(_redPrimaryValue),
    600: Color(0xFFE53935),
    700: Color(0xFFD32F2F),
    800: Color(0xFFC62828),
    900: Color(0xFFB71C1C),
  });
}