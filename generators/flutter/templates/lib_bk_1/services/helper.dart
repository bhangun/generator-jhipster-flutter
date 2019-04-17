import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:corsac_jwt/corsac_jwt.dart';
import 'config.dart';
import 'package:event_bus/event_bus.dart';



//
setPrefs(String key,String value) {
  SharedPreferences.getInstance().then((p)=>p.setString(key, value));
}

//
Future<String> prefs(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key);
}

Future<bool> hasPrefs(String key) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString(key).isNotEmpty;
}

removePrefs(String key) {
  SharedPreferences.getInstance().then((p)=>p.remove(key));
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



