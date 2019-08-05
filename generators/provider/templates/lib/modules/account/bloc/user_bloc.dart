import 'package:flutter/material.dart';
import 'package:<%= appsName %>/modules/account/services/user_routes.dart';
import 'package:<%= appsName %>/modules/account/services/user_services.dart';
import 'package:<%= appsName %>/modules/account/models/user_model.dart';
import 'package:<%= appsName %>/services/getIt.dart';
import 'package:<%= appsName %>/services/navigation.dart';
import 'package:<%= appsName %>/utils/helper.dart';


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
      getIt<NavigationServices>().navigateTo(UserRoutes.userDetail);

    } catch (e) {
      isItemEmpty = true;
    }
  }

  add() {
    itemDetail = null;
    isUpdated = false;
    getIt<NavigationServices>().navigateTo(UserRoutes.userForm);
  }

  save() {
    loading = true;
    success = false;
    try {
      isUpdated ? getIt<UserServices>().updateUser(_toUser())
          :getIt<UserServices>().createUser(_toUser());
      getIt<NavigationServices>().navigateTo(UserRoutes.userList);
      loading = false;
      success = true;

    }catch(e){
      print(e.toString());
    }
  }

  delete(String userid) {
    loading = true;
    success = false;
    try {
      getIt<UserServices>().deleteUser(userid);
      isDeleted =true;
      loading = false;
      success = true;

    }catch(e){
      print(e.toString());
    }
  }

  update() {
    loading = true;
    success = false;
    try {
      getIt<NavigationServices>().navigateTo(UserRoutes.userForm);
      isUpdated = true;
      loading = false;
      success = true;

    }catch(e){
      print(e.toString());
    }
  }

   getUserList() async {
    loading = true;
    success = false;
    isListEmpty = true;
    try {
      getIt<UserServices>().users().then((data) => _setUserList(data));
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
     // notifyListeners();
      print('userbloc>>> $userList');
    }
  }

  getProfile() {
    getIt<UserServices>().profileInfo().then((v)=> userProfile =v);;
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
    getIt<NavigationServices>().navigateTo(UserRoutes.userList);
  }
}

