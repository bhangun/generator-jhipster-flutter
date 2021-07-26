import 'package:flutter/material.dart';
import 'package:kutilang_example/services/preferences_service.dart';
import 'package:kutilang_example/utils/themes/theme_services.dart';
import 'package:mobx/mobx.dart';

part 'settings_store.g.dart';

class SettingsStore = _SettingsStore with _$SettingsStore;

abstract class _SettingsStore with Store {
  _SettingsStore(this._preferencesService) {
    isLightTheme = _preferencesService.useDarkMode;
  }

  final PreferencesService _preferencesService;

  @observable
  bool isLightTheme = true;

  @observable
  ThemeData theme = ThemeServices.lightTheme();

  @observable
  Locale locale = Locale('en', 'EN');

  @action
  switchTheme() {
    isLightTheme = isLightTheme ? false : true;
    theme =
        isLightTheme ? ThemeServices.lightTheme() : ThemeServices.darkTheme();
  }

  @action
  Future<void> switchLocale(String flag) async {
    locale = Locale(flag.toLowerCase(), flag);
  }
}
