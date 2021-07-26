import 'package:flutter/material.dart';
import '../pages/about.dart';
import '../pages/home.dart';
import '../pages/login.dart';
import '../pages/splash.dart';

class AppsRoutes {
  AppsRoutes._();

  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String about = '/about';
  static const String register = '/register';
  static const String forgot_password = '/forgot_password';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    about: (BuildContext context) => AboutPage(),
  };
}
