import 'package:flutter/widgets.dart';

class NavigationService {
  
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  
  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  bool close() {
    return navigatorKey.currentState.pop(true);
  }
}

