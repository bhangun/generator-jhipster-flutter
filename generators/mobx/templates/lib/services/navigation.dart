import 'package:flutter/widgets.dart';

class NavigationServices {
  
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  static Future<dynamic> navigateTo(String routeName, {data}) {
    return navigatorKey.currentState!.pushNamed(routeName,  arguments: data);
  }

  static close() {
    return navigatorKey.currentState!.pop(true);
  }
}
