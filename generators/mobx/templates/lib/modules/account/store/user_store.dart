import 'package:f_logs/f_logs.dart';
import 'package:flutter/material.dart';
import 'package:<%= appsName %>/modules/account/models/user_model.dart';
import 'package:<%= appsName %>/modules/account/screens/user_form.dart';
import 'package:<%= appsName %>/modules/account/services/user_routes.dart';
import 'package:<%= appsName %>/modules/account/services/user_services.dart';
import 'package:<%= appsName %>/services/navigation.dart';
import 'package:<%= appsName %>/store/alert/alert_store.dart';
import 'package:<%= appsName %>/utils/helper.dart';
import 'package:mobx/mobx.dart';

part 'user_store.g.dart';

class UserStore = _UserStore with _$UserStore;

abstract class _UserStore with Store {
  _UserStore() {
    //reaction((_) => userList,count);
    //reaction((_) => position,setItemData);
  }

  // other store
  final AlertStore _alertStore = AlertStore();

  // store variables:-----------------------------------------------------------
  @observable
  User? itemDetail;

  @observable
  bool islistEmpty = true;

  @observable
  bool isItemEmpty = true;

  /*  @computed
  User get userProfile => profile2;
 */

  @observable
  User? person;

  @observable
  bool isModified = false;

  @observable
  List<User>? userList;

  @observable
  int totalUser = 0;

  @observable
  bool success = false;

  @observable
  bool loading = false;

  @observable
  int? id;

  @observable
  String? username;

  @observable
  String? firstname;

  @observable
  String? lastname;

  @observable
  String? email;

  @observable
  String? activated;

  @observable
  String? profile;

  @observable
  bool showError = false;

  @observable
  String errorMessage = '';

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
  void count(List<User> list) {
    if (list != null) {
      totalUser = list.length;
      islistEmpty = false;
      showError = false;
    } else {
      showError = true;
      errorMessage = 'Data Empty';
    }
  }

  @computed
  User? get userDetail => itemDetail;

  @action
  setItemData(int data) {
    isItemEmpty = false;
    itemDetail = userList![data];
    //userDetail = data;
    print('$isItemEmpty  ????>>>${userDetail!.email}');
  }

  @observable
  int position = 0;

  @action
  itemTapU(int _position) {
    try {
      position = _position;
      itemDetail = userList![position];
      isItemEmpty = false;
    } catch (e) {}
    // setItemData(userList[position]);
    //if(itemDetail != null)
    //isItemEmpty = false;

    NavigationServices.navigateTo(UserRoutes.userDetail);
  }

  @action
  itemTap(User data) {
    NavigationServices.navigateTo(UserRoutes.userDetail);
    itemDetail = data;
  }

  // @action
  //add() => NavigationServices.navigateTo(UserRoutes.userForm, data: userMapping(true) );

add(context){
  Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserForm(data:person),
                ),
              );
}
  @action
  save() {
    isModified = false;
    UserServices.createUser(userMapping(true));
    //dialogDelete();
    NavigationServices.navigateTo(UserRoutes.userList);
  }

  @action
  delete(String userid) {
    dialogDelete();
    //isModified =true;
    UserServices.deleteUser(userid);
    getUserList();
  }

  @action
  update() {
    //dialogDelete();
    UserServices.createUser(userMapping(false));
  }

  @action
  getUserList() {
    FLog.info(text: '--------store list--------');
    UserServices.users().then((data) => userList = data);
  }

  @action
  getProfile() async {
    profile = await UserServices.profileInfo();
    //setPrefs(PROFILE, profile);

    //userProfile = User.fromJson(json.decode(profile));
    // print('>>>>>'+userProfile.firstName);
  }

  dialogDelete([String? item]) {
    _alertStore.setTitleDialog('Delete');
    _alertStore.setContentDialog('This item $item would be delete');
    print('----');
  }

  dialogUpdate([String? item]) {
    _alertStore.setTitleDialog('Update');
    _alertStore.setContentDialog('This item $item would be update');
  }

  userMapping(isNew) {
    return User(
        id: isNew?0:id!,
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
        lastModifiedDate: instantToDate(DateTime.now()));
  }
}
