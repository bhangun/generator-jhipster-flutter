import 'package:flutter/material.dart';

import '../pages/user_list.dart';
import '../pages/user_detail.dart';
import '../pages/user_form.dart';

class UserRoutes {

  UserRoutes._();

  static const String userList = '/user/list';
  static const String userDetail = '/user/detail';
  static const String userForm = '/user/form';

  static final routes = <String, WidgetBuilder>{
    userList: (BuildContext context) => UserList(),
    userDetail: (BuildContext context) => UserDetail(),
    //userForm: (BuildContext context) => UserForm(),

  };
}

