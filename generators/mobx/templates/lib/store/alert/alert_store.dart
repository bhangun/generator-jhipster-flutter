
import 'package:mobx/mobx.dart';

part 'alert_store.g.dart';

class AlertStore = _AlertStore with _$AlertStore;

abstract class _AlertStore with Store {

  @computed
  String get title => dialogTitle ;

  @observable
  String dialogTitle = 'Title';

  @observable
  String dialogku = 'Title';

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
   // getIt<NavigationServices>().close();
  }

  @action
  onDialogCancel(){
    isOk =false;
    isCancel=true;
    print('Cancel');
   // getIt<NavigationServices>().close();
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