import 'package:flutter/material.dart';
import '../screens/dashboard_screen.dart';


class AdminRoutes {

  AdminRoutes._();

  static const String dashboard = '/dashboard';

  static final routes = <String, WidgetBuilder>{

    dashboard: (BuildContext context) => DashboardScreen(key: Key("dash"),),
  };
}

