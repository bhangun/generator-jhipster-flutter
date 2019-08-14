import 'package:flutter/material.dart';
import 'package:<%= appsName %>/services/getIt.dart';
import 'package:<%= appsName %>/services/navigation.dart';
import 'package:<%= appsName %>/themes/theme_services.dart';
import 'package:mobx/mobx.dart';

part 'app_bloc.g.dart';

class AppStore = _AppStore with _$AppStore;


abstract class _AppStore with Store {

  _AppStore(){
     //reaction((_) => isLightTheme,switchTheme);
  }

  @observable
  String locale = 'en';

  @observable
  bool isLightTheme = false;

  bool isLocale = true;

  @observable
  ThemeData theme;

  String errorMessage='error';

  bool showError = false;

  @action
  switchTheme(bool value){
    isLightTheme?switchToLight():switchToDark();
  }

  @action
  switchToDark(){
     print('dark');
    
    theme = getIt<ThemeServices>().darkTheme();
    isLightTheme = false;
  }

  @action
  switchToLight(){
    print('light');
    
    theme = getIt<ThemeServices>().lightTheme();
    isLightTheme = true;
  }

  @action
  switchLocale(String _locale){
    locale = _locale;
  }

  @action
  goTo(String route) {
    getIt<NavigationServices>().navigateTo(route);
  }

}