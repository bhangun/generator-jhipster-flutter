import 'package:jh_flutter_mobx/services/locator.dart';
import 'package:jh_flutter_mobx/services/navigation.dart';
import 'package:mobx/mobx.dart';

part 'alert_store.g.dart';

class AlertStore = _AlertStore with _$AlertStore;

abstract class _AlertStore implements Store {

  @computed
  String get title => dialogTitle ;

  @observable
  String dialogTitle = 'Title';

  @observable
  String dialogContent = 'Content';

  @observable
  bool isOk=false;

  @observable
  bool isCancel=false;

  @action
  onDialogOk(){
    isOk =true;
    isCancel=false;
    print('Ok');
    locator<NavigationService>().close();
  }

  @action
  onDialogCancel(){
    isOk =false;
    isCancel=true;
    print('Cancel');
    locator<NavigationService>().close();
  }

  @action
  setTitleDialog(String text){
    dialogTitle = text;
  }

  @action
  setContentDialog(String text){
    dialogContent = text;
  }

}