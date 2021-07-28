import 'dart:async';
import 'dart:convert';

import 'package:f_logs/f_logs.dart';
import 'package:<%= appsName %>/utils/helper.dart';
import 'package:logging/logging.dart';

import '../../../services/network/rest_services.dart';
import '../models/user_model.dart';

class UserServices {
  static final log = Logger('UserServices');
  // GET getAllUsers
  // POST createUser
  // PUT updateUser
  static const API_USERS = "users";

  // GET getUser
  // DELETE deleteUser
  static const API_USER = "users/";

   // Regex for acceptable logins
  static final String loginRegex = "^(?>[a-zA-Z0-9!\$${'&'}*+=?^_`{|}~.-]+@[a-zA-Z0-9-]+(?:\\.[a-zA-Z0-9-]+)*)|(?>[_.@A-Za-z0-9-]+)\$";

  static regex(String login){
    // Iterable<RegExpMatch> matches;
    try{
    RegExp exp = new RegExp(loginRegex);
    return exp.stringMatch(login);
     // if () return login;
    }catch(e){
      log.info('>>>>>>>>>>>>>>>>> '+e.toString());
      return login;
    }
  }

  // Fetch single user
  static Future<User> user(String login) async {
    //String param = '{"login":"'+login+'"}';
    String param = '{login:$login}';
    var response = await RestServices.fetch(API_USER + regex(param)); //param);//
    return User.fromJson(response);//User.fromJson(json.decode(response));
  }


  // Fetch all user
  static Future<List<User>> users([var page, var size, var sort]) async {
    FLog.info(text: '--------1--------');
    List<dynamic> data = await RestServices.fetch(API_USERS);
    FLog.info(text: '--------2--------');
    return User.listFromJson(data);
  }

  // Create user
  static createUser(User user) async {
    await RestServices.post(API_USER, user);
  }

  // Update user
  static updateUser(User user) async {
    await RestServices.put(API_USER, user);
  }

  // Delete user
  static deleteUser(String userID) async {
    await RestServices.delete(API_USER, userID);
  }


  /// Path profile-info
  /// GET getActiveProfiles
  static profileInfo() async {
    var data = await RestServices.fetch('profile-info');
    User user = User.fromJson(json.decode(data.toString()));
    return user;
  }

  /// registerAccount
  static register(
      String login, String email, String password, String langkey) async {
    var body = '{ $login, $email, $password, $langkey }';
    await RestServices.post('register', body);
  }

  List<User> usersData(String data) {
    final parsed = json.decode(data).cast<Map<String, dynamic>>();
    List<User> lu = parsed.map<User>((json) => User.fromJson(json)).toList();
    return lu;
  }

  /// profile
  Future<User> userProfile() async {
    String profile = await prefs('profile');
    return User.fromJson(json.decode(profile));
  }
}
