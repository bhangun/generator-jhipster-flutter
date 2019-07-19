import 'dart:async';
import 'package:jh_flutter_provider/utils/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SharedPrefServices {
  // singleton object
  static final SharedPrefServices _singleton = SharedPrefServices._();

  static SharedPreferences _preferences;
  // A private constructor. Allows us to create instances of SharedPreferenceHelper
  // only from within the SharedPreferenceHelper class itself.
  SharedPrefServices._();

  // factory method to return the same object each time its needed
  factory SharedPrefServices() => _singleton;

  // Singleton accessor
  static Future<SharedPrefServices> get instance async{
    if (_preferences==null)
      _preferences = await SharedPreferences.getInstance();
    return _singleton;
  }
  // General Methods: ----------------------------------------------------------
  String get authToken {
    return _preferences.getString(Preferences.auth_token);
  }

  saveAuthToken(String authToken) {
    _preferences.setString(Preferences.auth_token, authToken);
  }

  removeAuthToken()  {
    _preferences.remove(Preferences.auth_token);
  }

  bool get isLoggedIn {
    return _preferences.getString(Preferences.auth_token) ?? false;
  }

  setPrefs(String key,String value) {
    _preferences.setString(key, value);
  }

  String prefs(String key)  {
    return _preferences.getString(key);
  }

}
