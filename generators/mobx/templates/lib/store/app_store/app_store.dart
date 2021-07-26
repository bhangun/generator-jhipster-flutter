import 'package:flutter/material.dart';
import 'package:kutilang_example/services/apps_routes.dart';
import 'package:kutilang_example/services/navigation.dart';
import 'package:kutilang_example/utils/themes/theme_services.dart';

import 'package:mobx/mobx.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore with Store {
  _AppStore() {
    // reaction((_) => isLightTheme, switchTheme);
  }


  @observable
  bool isLightTheme = true;

  bool isLocale = true;

  @observable
  ThemeData theme = ThemeServices.lightTheme();

  @observable
  Locale locale = Locale('en', 'EN');

  String errorMessage = 'error';

  String userMessage = 'user message';

  String passwordMessage = 'user message';

  String forgotMessage = 'user message';
  bool showError = false;


  @action
  forgotPassword() {}

  @action
  login() {}


  @action
  goTo(int index) {
    switch (index) {
      case 0:
        NavigationServices.navigateTo(AppsRoutes.home);
        break;
      default:
    }
  }

  void dispose() {}
}
