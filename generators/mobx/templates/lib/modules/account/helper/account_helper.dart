import 'dart:async';
import 'dart:convert';

import '../../../services/config.dart';
import '../../../services/helper.dart';

import '../models/user_model.dart';
import '../../../services/network/connection.dart';


const API_ACCOUNT = 'account';

const PROFILE = 'profile';
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
Future<List<User>> users() async{
  String v= await restGet(API_USER,true,false);
  List<User> l=User.listFromString(v);
  return l;
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
deleteUser(String userid) async {
  return await restDelete(API_USER + userid);
}

List<User> usersData(String data) {
  final parsed =json.decode(data).cast<Map<String, dynamic>>();
  List<User> lu= parsed.map<User>((json) => User.fromJson(json)).toList();
  return lu;
}


Future<bool> login(String username, String password, bool rememberMe) async {
  logout();
  var body = jsonEncode(
      {"username": username, "password": password, "rememberMe": rememberMe});
  try {
    final response = await restPost("authenticate", body);
    setPrefs(TOKEN, json.decode(response)["id_token"]);

    String profile = await restGet(API_ACCOUNT,true,false);
    setPrefs(PROFILE, profile);

    return true;
  } catch (e) {
    return false;
  }
}

logout(){
  setPrefs(TOKEN, "");
  setPrefs(PROFILE, "");
}

Future<User> userProfile() async {
 String profile = await prefs(PROFILE);
  return User.fromJson(json.decode(profile));
}

/* 
updateUser(User data){
 
      }

void _save() async {
    try {
      if (widget.isEdit) {
        await  else {
        await createUser(User(
            login: _username.text,
            firstName: _firstname.text,
            lastName: _lastname.text,
            email: _email.text,
            imageUrl: "",
            activated: _activated,
            langKey: "en",
            authorities: ['"ROLE_USER"'],
            createdBy: "",
            createdDate: DateTime.now(),
            lastModifiedBy: "",
            lastModifiedDate: DateTime.now()));
      }
    } catch (e) {
      print("gk bisa imel");
    }
    Navigator.pop(context);
  }
 */