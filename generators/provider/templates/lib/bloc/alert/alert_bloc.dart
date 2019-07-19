

import 'package:flutter/material.dart';
import 'package:jh_flutter_provider/services/locator.dart';
import 'package:jh_flutter_provider/services/navigation.dart';

class AlertBloc extends ChangeNotifier {

  String get title => dialogTitle ;

  String dialogTitle = 'Title';
 
  String dialogContent = 'Content';

 
  bool isOk=false;

 
  bool isCancel=false;

 
  onDialogOk(){
    isOk =true;
    isCancel=false;
    print('Ok');
    locator<NavigationServices>().close();
  }

 
  onDialogCancel(){
    isOk =false;
    isCancel=true;
    print('Cancel');
    locator<NavigationServices>().close();
  }

 
  setTitleDialog(String text){
    dialogTitle = text;
  }

 
  setContentDialog(String text){
    dialogContent = text;
  }

}