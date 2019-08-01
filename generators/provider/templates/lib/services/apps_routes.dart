import 'package:flutter/material.dart';
import '../views/home.dart';
import '../views/login.dart';
import '../views/splash.dart';

class AppsRoutes {
  AppsRoutes._();

  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String takeCamera = '/takeCamera';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
  };
}
