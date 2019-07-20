import 'dart:async';
import 'dart:convert';

import 'package:<%= appsName %>/services/locator.dart';
import 'package:<%= appsName %>/services/navigation.dart';
import 'package:<%= appsName %>/services/routes.dart';
import 'package:<%= appsName %>/services/shared_preference_services.dart';

import '../../../services/helper.dart';
import '../models/user_model.dart';
import '../../../services/network/rest_http_services.dart';

class UserServices {
  static const API = '/api/';

  static const API_ACCOUNT = API + 'account';

  static const PROFILE = API + 'profile';
// POST saveAccount
  static const API_ACCOUNT_SAVE = API + "account";

// POST changePassword
  static const API_ACCOUNT_CHANGE_PASSWORD = API + "account/change-password";

//POST finishPasswordReset
  static const API_ACCOUNT_RESET_FINISH = API + "account/reset-password/finish";

// POST requestPasswordReset
  static const API_ACCOUNT_RESET_INIT = API + "account/reset-password/init";

// GET activateAccount
  static const API_ACTIVATE = API + "activate";

// POST registerAccount
  static const API_REGISTER = API + "register";

// GET getActiveProfiles
  static const API_PROFILE_INFO = API + "profile-info";

// POST authorize
//GET isAuthenticated
  static const API_USERS_AUTHENTICATE = API + "authenticate";

// GET getAuthorities
  static const API_USERS_AUTHORITIES = API + "users/authorities";

// GET getAllUsers
// POST createUser
// PUT updateUser
  static const API_USERS = API + "users";

// GET getUser
// DELETE deleteUser
  static const API_USER = API + "users/";

  login(String _username, String _password, [bool _rememberMe = false]) {
    var body = jsonEncode({
      "username": _username,
      "password": _password,
      "rememberMe": _rememberMe
    });
    try {
      locator<RestHttpServices>()
          .post(UserServices.API_USERS_AUTHENTICATE, body)
          .then((d) => _saveToken(d.toString()));
    } catch (e) {
      print(e.toString());
    }
  }

  bool _saveToken(var token) {
    String _token = json.decode(token)["id_token"];
    if (_token != null) {
      locator<SharedPrefServices>().saveAuthToken(_token);
      locator<NavigationServices>().navigateTo(Routes.home);
      return true;
    } else
      return false;
  }

  Future<User> user(String id) async {
    var response = await locator<RestHttpServices>().fetch(API_USER + id);
    return User.fromJson(json.decode(response));
  }

  Future<List<User>> users([var page, var size, var sort]) async {
    var data = await locator<RestHttpServices>().fetch(API_USERS);
    return User.listFromString(data);
  }

  //
  createUser(User user) async {
    //return await restPost(API_USER, user.toJson().toString(), true);
  }

  //
  updateUser(User user) async {
    //return await restPut(API_USER, user.toJson().toString(), true);
  }

  //
  deleteUser(String userid) async {
    //return await restDelete(API_USER + userid);
  }

  changePassword(String currentPassword, String newPassword) async {
    //var body = '{"currentPassword": "$currentPassword","newPassword": "$newPassword"}';
  }

  authorities() {}

  activate() async {
    // ?key=
  }

  resetPasswordFinish(String key, String newPassword) async {
    // var body = '{"key": "$key","newPassword": "$newPassword"}';
  }

  resetPasswordInit(String email) async {}

  profileInfo() async {
    var data = await locator<RestHttpServices>().fetch(API_ACCOUNT);
    User user = User.fromJson(json.decode(data.toString()));
    return user;
  }

  register() {}

  List<User> usersData(String data) {
    final parsed = json.decode(data).cast<Map<String, dynamic>>();
    List<User> lu = parsed.map<User>((json) => User.fromJson(json)).toList();
    return lu;
  }

  Future<User> userProfile() async {
    String profile = await prefs(PROFILE);
    return User.fromJson(json.decode(profile));
  }
}
