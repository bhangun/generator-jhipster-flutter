import 'package:flutter/material.dart';
import '../modules/account/views/user_detail.dart';
import '../modules/account/views/user_form.dart';
import '../modules/account/views/user_list.dart';
import '../views/home.dart';
import '../views/login.dart';
import '../views/splash.dart';
// kutilang-needle-add-import-route - Don't remove, used by kutilang to add new import

class Routes {
  

  Routes._();

  //static variables
  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String userList = '/user';
  static const String userForm = '/userForm';
  static const String userDetail = '/userDetail';
  static const String takeCamera = '/takeCamera';
  // kutilang-needle-add-route-1 - Don't remove, used by kutilang to add new import

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    userList: (BuildContext context) => UserList(),
    userForm: (BuildContext context) => UserForm(),
    userDetail: (BuildContext context) => UserDetail(),
    // kutilang-needle-add-route-2 - Don't remove, used by kutilang to add new import
  };

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/home': return MaterialPageRoute(builder: (_) => HomeScreen());
      case '/login': return MaterialPageRoute(builder: (_) => LoginScreen());
      case '/splash': return MaterialPageRoute(builder: (_) => SplashScreen());
      case '/user': return MaterialPageRoute(builder: (_) => UserList());
      // kutilang-needle-add-route-3 - Don't remove, used by kutilang to add
      default: return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          );
        });
    }
  }
}
