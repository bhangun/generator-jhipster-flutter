import 'package:flutter/material.dart';
import 'package:<%= appsName %>/services/getIt.dart';
import 'package:<%= appsName %>/themes/theme_services.dart';



class AppBloc extends ChangeNotifier {
  bool isLocale = true;

  ThemeData theme;// => isLightTheme? getIt<ThemeServices>().lightTheme():getIt<ThemeServices>().darkTheme();

 
  bool isLightTheme = true;

  String locale = 'en';

  String errorMessage='error';

  bool showError = false;

  switchTheme(bool value){
    isLightTheme?switchToLight():switchToDark();
    notifyListeners();
  }

  switchToDark(){
    theme = getIt<ThemeServices>().darkTheme();
    isLightTheme = true;
  }
 
  switchToLight(){
    theme = getIt<ThemeServices>().lightTheme();
    isLightTheme = false;
  }


  switchLocale(String _locale){
    locale = _locale;
  }

  goTo(String route) {
    getIt<NavigationServices>().navigateTo(route);
  }

}