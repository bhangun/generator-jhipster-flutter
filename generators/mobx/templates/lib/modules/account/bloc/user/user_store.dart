
import 'dart:convert';
import 'package:mobx/mobx.dart';

import '../../../../services/getIt.dart';
import '../../../../services/navigation.dart';
import '../../../../services/routes.dart';
import '../../../../bloc/alert/index.dart';
import '../../../../modules/account/models/user_model.dart';
import '../../../../services/helper.dart';
import '../../../../services/network/connection.dart';
import '../../helper/account_helper.dart';
import '../../../../bloc/error/error_store.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore implements Store {

  _UserStore(){
    reaction((_) => userList,count);
    reaction((_) => itemDetail,setItemData);
  }

  // other store  
  final ErrorStore errorStore = ErrorStore();
  final AlertStore alertStore = AlertStore();


  // store variables:-----------------------------------------------------------
  @observable
  User itemDetail;

  @observable
  bool islistEmpty=true;

  @observable
  bool isItemEmpty=true;

  @observable
  User userProfile;

  @observable
  User person;

  @observable
  bool isModified=false;

  @observable
  List<User> userList ;

  @observable
  int totalUser = 0;

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @observable
  int id;

  @observable
  String username;

  @observable
  String firstname;

  @observable
  String lastname;

  @observable
  String email;

  @observable
  String activated;

  @observable
  String profile;

  // actions:-------------------------------------------------------------------
  @action
  void setUserId(int value) {
    id = value;
  }

  @action
  void setUsername(String value) {
    username = value;
  }

  @action
  void setFirstname(String value) {
    firstname = value;
  }

   @action
  void setLastname(String value) {
    lastname = value;
  }

  @action
  void setEmail(String value) {
    email = value;
  }

  @action
  void setActivated(String value) {
    activated = value;
  }

  @action
  void setProfile(String value) {
    profile = value;
  }

  @action
  void count(List<User> list){
    if(list != null ){
      totalUser =  list.length;
      islistEmpty = false;
      errorStore.showError = false;
    } else {
      errorStore.showError = true;
      errorStore.errorMessage = 'Data Empty';
    }
  }

  @action
  setItemData(User data ){
  
  }

  @action
  itemTapU(int position){
     print(position);
      itemDetail = userList[position];

     if(itemDetail!=null){
      isItemEmpty = false;
        
        print('>>>>>>>>   >>>>>>>>data>>>>>> $isItemEmpty >>>>>>>> $itemDetail');
       print(isItemEmpty);
     }
     getIt<NavigationService>().navigateTo(Routes.userDetail);
  }

  @action
  itemTap(User data){
     getIt<NavigationService>().navigateTo(Routes.userDetail);
      itemDetail = data;
  }


  @action
  add(){
    getIt<NavigationService>().navigateTo(Routes.userForm);
  }

  @action
  save(){
    isModified =false;
    createUser(mapping());
    //dialogDelete();
    getIt<NavigationService>().navigateTo(Routes.userForm);
  }

  @action
  delete(String userid){
    print('delete---$id');
    dialogDelete();
    //isModified =true;
    deleteUser(userid);
    getUserList();
  }

  @action
  update(int id){
    dialogDelete();
  }

  @action
  Future getUserList() async{ 
    users().then((data)=> userList = data); 
    totalUser = userList != null ? userList.length:0;
  }

  @action
  getProfile() async {
    String profile = await restGet(API_ACCOUNT,true,false);
      setPrefs(PROFILE, profile);

      userProfile = User.fromJson(json.decode(profile));
  }


  dialogDelete([String item]){
    alertStore.setTitleDialog('Delete');
    alertStore.setContentDialog('This item $item would be delete');
    print('----');
  }

   dialogUpdate([String item]){
    alertStore.setTitleDialog('Update');
    alertStore.setContentDialog('This item $item would be update');
  }

  mapping(){
    return User(
              //id: id,
              login: username,
              firstName: firstname,
              lastName: lastname,
              email: email,
              activated: true,
              createdBy: username,
              createdDate: instantToDate(DateTime.now()),
              langKey: "en",
              imageUrl: "",
              authorities: ['"ROLE_USER"'],
              lastModifiedBy: username,
              lastModifiedDate: instantToDate(DateTime.now())
              );
  }
}