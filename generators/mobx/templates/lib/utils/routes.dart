import 'package:flutter/material.dart';
import 'package:<%= appsName %>/services/apps_routes.dart';

class RoutesService {
  static final RoutesService _singleton = RoutesService._();
  RoutesService._();

  factory RoutesService() => _singleton;

  static Map<String, Widget Function(BuildContext)> _routes = <String, WidgetBuilder>{};

  static Future<RoutesService> get instance async{ 
    _routes.addAll(AppsRoutes.routes);
    return _singleton;
  }

  static get routes => _routes;

  static addRoutes(Map<String, Widget Function(BuildContext)> newRoutes) {
    _routes.addAll(newRoutes);
  }
}
