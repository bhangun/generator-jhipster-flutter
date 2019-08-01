import 'package:flutter/material.dart';
import 'package:<%= appsName %>/services/apps_routes.dart';

class Routes {
  Routes._();

  Map<String, Widget Function(BuildContext)> _routes = <String, WidgetBuilder>{};

  Routes() {
    _routes.addAll(AppsRoutes.routes);
  }

  get routes => _routes;

  addRoutes(Map<String, Widget Function(BuildContext)> newRoutes) {
    _routes.addAll(newRoutes);
  }
}
