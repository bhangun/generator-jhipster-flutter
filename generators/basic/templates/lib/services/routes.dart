import 'package:flutter/material.dart';
import '../administration/dashboard.dart';
import '../administration/account/user.form.dart';
import '../administration/account/user.list.dart';
import '../screens/login.dart';
// kutilang-needle-add-import-route - Don't remove, used by kutilang to add new import

Route<dynamic> route(RouteSettings settings) {
  if (settings.name != '/login') {
    return null;
  }

  return MaterialPageRoute<void>(
    settings: settings,
    builder: (BuildContext context) => LoginPage(),
    fullscreenDialog: true,
  );
}

final loginRoute = "/login";

final routes = <String, WidgetBuilder> {
  "/home":(BuildContext context) => null,
  "/register": (BuildContext context) => null,//new SignIn(),
  "/users": (BuildContext context) => UserListPage(),
  "/usersForm": (BuildContext context) => UserFormPage(),
  "/dashboard": (BuildContext context) => Dashboard(),
  // kutilang-needle-add-route - Don't remove, used by kutilang to add new import
};