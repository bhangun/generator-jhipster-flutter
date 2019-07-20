import 'package:flutter/material.dart';
import 'package:jh_flutter_provider/modules/account/services/user_services.dart';
import 'package:jh_flutter_provider/modules/account/models/user_model.dart';
import 'package:jh_flutter_provider/services/locator.dart';
import 'package:jh_flutter_provider/services/navigation.dart';
import 'package:jh_flutter_provider/services/routes.dart';
import 'package:jh_flutter_provider/services/helper.dart';

class UserBloc extends ChangeNotifier {

  bool isListEmpty = true;

  bool isItemEmpty = true;

  bool isUpdated = false;

  bool isDeleted = false;


  String errorMessage='error';

  bool showError = false;

  String title = '';


  int totalItem = 0;

  bool success = false;

  bool loading = false;

  int position = 0;


  User itemDetail;

  User userProfile;

  List<User> userList;


  String userName='';

  String firstName='-';

  String lastName='';

  String email='-';

  String activated='';

  String profile='';


  // actions:-------------------------------------------------------------------

  String get formTitle => isUpdated? title='Update User':'Create User';

  void setUsername(String value) {
    userName = value;
  }

  void setFirstname(String value) {
    firstName = value;
  }

  void setLastName(String value) {
    print(value);
    lastName = value;
  }

  void setEmail(String value) {
    email = value;
  }

  void setActivated(String value) {
    activated = value;
  }

  void setProfile(String value) {
    profile = value;
  }


  itemTap(int _position) {
    try {
      position = _position;
      itemDetail = userList[position];
      isItemEmpty = false;
      locator<NavigationServices>().navigateTo(Routes.userDetail);

    } catch (e) {
      isItemEmpty = true;
    }
  }

  add() {
    itemDetail = null;
    isUpdated = false;
    locator<NavigationServices>().navigateTo(Routes.userForm);
  }

  save() {
    loading = true;
    success = false;
    try {
      isUpdated ? locator<UserServices>().updateUser(_toUser())
          :locator<UserServices>().createUser(_toUser());
      locator<NavigationServices>().navigateTo(Routes.userList);
      loading = false;
      success = true;
      getUserList();
    }catch(e){
      print(e.toString());
    }
  }

  delete(String userid) {
    loading = true;
    success = false;
    try {
      locator<UserServices>().deleteUser(userid);
      isDeleted =true;
      loading = false;
      success = true;
      getUserList();
    }catch(e){
      print(e.toString());
    }
  }

  update() {
    loading = true;
    success = false;
    try {
      locator<NavigationServices>().navigateTo(Routes.userForm);
      isUpdated = true;
      loading = false;
      success = true;
      getUserList();
    }catch(e){
      print(e.toString());
    }
  }

  Future getUserList() async {
    loading = true;
    success = false;
    isListEmpty = true;
    try {
      locator<UserServices>().users().then((data) => _setUserList(data));
      isListEmpty = false;
      loading = false;
      success = true;
    } catch (e) {
      showError = true;
      errorMessage = 'Data Empty';
      print(e.toString());
    }

  }

  _setUserList(List<User> data){
    if (data != null) {
      userList = data;
      totalItem = data.length;
    }
  }

  getProfile() {
    locator<UserServices>().profileInfo().then((v)=> userProfile =v);;
  }

  User _toUser() {
    return User(
        id: isUpdated ? itemDetail.id : '',
        login: userName,
        firstName: firstName,
        lastName: lastName,
        email: email,
        activated: true,
        createdBy: userName,
        createdDate: instantToDate(DateTime.now()),
        langKey: "en",
        imageUrl: "",
        authorities: ['"ROLE_USER"'],
        lastModifiedBy: userName,
        lastModifiedDate: instantToDate(DateTime.now()));
  }

  viewList() {
    getUserList();
    locator<NavigationServices>().navigateTo(Routes.userList);
  }
}
