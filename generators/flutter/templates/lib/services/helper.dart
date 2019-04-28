import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:corsac_jwt/corsac_jwt.dart';
import 'config.dart';

//
setPrefs(String key,String value) {
  SharedPreferences.getInstance().then((p)=>p.setString(key, value));
}

//
Future<String> prefs(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString("token");
}

Future<JWT> jwt() async {
  return JWT.parse(await prefs(TOKEN));
}

//
Future<List<String>> roles() async {
  return (await jwt()).getClaim("auth").toString().split(",");
}

Future<bool> isRole(String role) async {
  final List<String> b=await roles();
  return b.contains(role);
}

instantToDate(DateTime date){
  return DateTime.parse(date.toString().substring(0,date.toString().length-1));
}

