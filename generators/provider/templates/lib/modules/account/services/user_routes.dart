import 'package:flutter/material.dart';

import '../views/user_list.dart';
import '../views/user_detail.dart';
import '../views/user_form.dart';

class UserRoutes {

  UserRoutes._();

  static const String userList = '/userList';
  static const String userDetail = '/userDetail';
  static const String userForm = '/userForm';

  static final routes = <String, WidgetBuilder>{

    userList: (BuildContext context) => UserList(),
    userDetail: (BuildContext context) => UserDetail(),
    userForm: (BuildContext context) => UserForm(),

  };
}

