import 'dart:async';
import 'package:<%= appsName %>/services/apps_routes.dart';
import 'package:<%= appsName %>/utils/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/material.dart';

import '../utils/routes.dart';
import '../widgets/app_icon_widget.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(child: AppIconWidget(image: Preferences.splash_image)),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 300);
    return Timer(_duration, navigate);
  }

  navigate() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();

    if (preferences.getBool(Preferences.is_logged_in) ?? false) {
      Navigator.of(context).pushReplacementNamed(AppsRoutes.login);
    } else {
      Navigator.of(context).pushReplacementNamed(AppsRoutes.login);
    }
  }
}
