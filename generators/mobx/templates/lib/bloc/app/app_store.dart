import 'package:flutter/material.dart';
import 'package:jh_flutter_mobx/services/locator.dart';
import 'package:jh_flutter_mobx/themes/theme_service.dart';
import 'package:mobx/mobx.dart';
import '../../themes/index.dart';

part 'app_store.g.dart';

class AppStore = _AppStore with _$AppStore;

abstract class _AppStore implements Store {

  //final mm = locator<ThemeService>();
  final mm = ThemeService();

  _AppStore(){
     reaction((_) => isLightTheme,count);
  }

  @computed
  ThemeData get theme => isLightTheme? mm.lightTheme():mm.darkTheme() ;

   @computed
  bool get wtheme => isLightTheme? true:false ;

  @observable
  bool isLightTheme = true;

 @action
  void count(bool b){
print('>>>>>>>>>>>>>>>>$b');
  }

  @action
  switchToDark(){
    isLightTheme = true;
    print('$theme Light $isLightTheme');
  }

  @action
  switchToLight(){
    isLightTheme = true;
    print('$wtheme Light $isLightTheme');
  }
}