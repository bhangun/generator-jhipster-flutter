import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:<%= appsName %>/modules/account/services/user_services.dart';
import 'package:<%= appsName %>/services/getIt.dart';
import 'package:<%= appsName %>/services/navigation.dart';
import 'package:<%= appsName %>/services/network/rest_http_services.dart';
import 'package:<%= appsName %>/services/apps_routes.dart';
import 'package:<%= appsName %>/services/shared_preference_services.dart';
import 'package:<%= appsName %>/utils/preferences.dart';

class AuthenticationBloc extends ChangeNotifier {

  String username = '';

  String userMessage = '';

  String password = '';

  String passwordMessage = '';

  String confirmPassword = '';

  String confirmPasswordMessage = '';

  bool success = false;

  bool loggedIn = false;

  bool loading = false;

  bool rememberMe = false;

  String errorMessage = 'error';

  bool showError = false;

  bool get canLogin => hasErrorsInLogin; //&& username !='' && password !='';

  bool get canRegister =>
      !hasErrorsInRegister &&
      username.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty;

  bool get canForgetPassword =>
      !hasErrorInForgotPassword && username.isNotEmpty;

  // error handling:-------------------------------------------------------------------

  bool get hasErrorsInLogin => username != '' || password != '';

  bool get hasErrorsInRegister =>
      username != null || password != null || confirmPassword != null;

  bool get hasErrorInForgotPassword => username != null;

  // actions:-------------------------------------------------------------------

  void setUserId(String value) {
    username = value;
    _validateUserEmail(value);
  }

  void setPassword(String value) {
    password = value;
    _validatePassword(value);
  }

  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  void _validateUserEmail(String value) {
    // Regex for email validation
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";

    RegExp regExp = new RegExp(p);

    if (value.isEmpty) {
      userMessage = "Email can't be empty";
    } else if (regExp.hasMatch(value)) {

    }else userMessage = null;
    /* else if (!isEmail(value)) {
      userMessage = 'Please enter a valid email address';
    } */
    /*else {

      showError = true;
      errorMessage = 'Email provided isn\'t valid.Try another email address';
    }*/
  }

  void _validatePassword(String value) {
    if (value.isEmpty) {
      passwordMessage = "Password can't be empty";
    } /* else if (value.length < 6) {
      password = "Password must be at-least 6 characters long";
    }  */
    else {
      passwordMessage = null;
    }
  }

  /*void _validateConfirmPassword(String value) {
    if (value.isEmpty) {
      confirmPasswordMessage = "Confirm password can't be empty";
    } else if (value != password) {
      confirmPasswordMessage = "Password doen't match";
    } else {
      confirmPasswordMessage = null;
    }
    notifyListeners();
  }*/

  Future register() async {
    loading = true;
  }

  login() async{
    loading = true;
    success = false;
    loggedIn = false;

    try {
      var body = jsonEncode({"username": username, "password": password, "rememberMe": rememberMe});

      var response = await getIt<RestHttpServices>()
          .post(UserServices.API_USERS_AUTHENTICATE, body);

      if (_saveToken(response)){
        loggedIn = true;
        loading = false;
        success = true;
        getIt<NavigationServices>().navigateTo(AppsRoutes.home);

      }else if (response.toString().contains("Unauthorized")){
        showError = true;
        errorMessage =  "Username and password doesn't match";
        loading = false;
      } else {
        showError = true;
        errorMessage =  "Something went wrong, please check your network and try again";
        loading = false;
      }

    } catch (e) {
      showError = true;
      errorMessage =  "Something went wrong, please check your network and try again";
      loading = false;
      print(e.toString());
    }

    notifyListeners();
  }

  bool _saveToken(var token) {
    String _token = json.decode(token)["id_token"];
    if (_token != null) {
      getIt<SharedPrefServices>().saveAuthToken(_token);
      return true;
    } else return false;
  }

  Future forgotPassword() async {
    loading = true;
  }

  Future logout() async {
    SharedPreferences.getInstance().then((preference) {
      preference.setBool(Preferences.is_logged_in, false);
    });
    loading = true;
  }
}
