import 'package:flutter/material.dart';
import 'package:jh_flutter_provider/services/locator.dart';
import 'package:jh_flutter_provider/themes/index.dart';
import 'package:jh_flutter_provider/themes/theme_services.dart';



class AppBloc extends ChangeNotifier {
  bool isLocale = true;

  ThemeData theme;// => isLightTheme? locator<ThemeServices>().lightTheme():locator<ThemeServices>().darkTheme();

 
  bool isLightTheme = true;

  String locale = 'en';

  String errorMessage='error';

  bool showError = false;

  switchTheme(bool value){
    isLightTheme?switchToLight():switchToDark();
    notifyListeners();
  }

  switchToDark(){
    theme = locator<ThemeServices>().darkTheme();
    isLightTheme = true;
  }
 
  switchToLight(){
    theme = locator<ThemeServices>().lightTheme();
    isLightTheme = false;
  }


  switchLocale(String _locale){
    locale = _locale;
  }



}