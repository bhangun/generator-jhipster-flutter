import 'dart:async';
import 'dart:convert';
import '../../administration/account/user.dart';
import '../../services/connection.dart';

String API_ACCOUNT = 'account';

// POST saveAccount
const API_ACCOUNT_SAVE = "account";

// POST changePassword
const API_ACCOUNT_CHANGE_PASSWORD = "account/change-password";

//POST finishPasswordReset
const API_ACCOUNT_RESET_FINISH = "account/reset-password/finish";

// POST requestPasswordReset
const API_ACCOUNT_RESET_INIT = "account/reset-password/init";

// GET activateAccount
const API_ACTIVATE = "activate";

// POST registerAccount
const API_REGISTER = "register";

// GET getActiveProfiles
const API_PROFILE_INFO = "profile-info";

// POST authorize
//GET isAuthenticated
const API_USERS_AUTHENTICATE = "authenticate";

// GET getAuthorities
const API_USERS_AUTHORITIES = "users/authorities";

// GET getAllUsers
// POST createUser
// PUT updateUser
const API_USERS = "users";

// GET getUser
// DELETE deleteUser
const API_USER = "users/";

//
Future<User> user(String id) async {
  var response = await restGet(API_USER + id,true,false);
  return User.fromJson(json.decode(response));
}


//
Future<String> users() async {
  print("get users");
  return await restGet(API_USER,true,false);
}

//
createUser(User user) async {
  print("create");
  return await restPost(API_USER, user.toJson().toString(),true);
}

//
updateUser(User user) async {
  print("update");
  return await restPut(API_USER, user.toJson().toString(),true);
}


//
deleteUser(User user) async {
  return await restDelete(API_USER + user.toJson().toString());
}

List<User> usersData(String data) {
  final parsed =json.decode(data).cast<Map<String, dynamic>>();
  List<User> lu= parsed.map<User>((json) => User.fromJson(json)).toList();
  return lu;
}

