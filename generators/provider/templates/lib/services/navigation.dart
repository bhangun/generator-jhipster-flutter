import 'package:flutter/widgets.dart';

class NavigationServices {
  
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  bool close() {
    return navigatorKey.currentState.pop(true);
  }
}

