import 'package:mobx/mobx.dart';
import 'package:f_logs/f_logs.dart';

import '../../services/apps_routes.dart';
import '../../services/auth_jwt_services.dart';
import '../../services/navigation.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


part 'auth_store.g.dart';

class AuthStore = _AuthStore with _$AuthStore;

abstract class _AuthStore with Store {
  @observable
  String username = '';

  @observable
  String loginMessage = '';

  @observable
  String password = '';

  @observable
  String passwordMessage = '';

  @observable
  String confirmPassword = '';

  @observable
  String confirmPasswordMessage = '';

  @observable
  bool success = false;

  @observable
  bool loggedIn = false;

  @observable
  bool loading = false;

  @observable
  bool rememberMe = false;

  @observable
  String errorMessage = '';

  @observable
  bool showError = false;

  //@action
  bool get canLogin => hasErrorsInLogin; //&& username !='' && password !='';

  bool get canRegister =>
      !hasErrorsInRegister &&
      username.isNotEmpty &&
      password.isNotEmpty &&
      confirmPassword.isNotEmpty;

  @computed
  bool get canForgetPassword =>
      !hasErrorInForgotPassword && username.isNotEmpty;

  // error handling:-------------------------------------------------------------------
  @computed
  bool get hasErrorsInLogin => username != '' || password != '';

  @computed
  bool get hasErrorsInRegister =>
      username != null || password != null || confirmPassword != null;
  @computed
  bool get hasErrorInForgotPassword => username != null;

  // actions:-------------------------------------------------------------------
  @action
  void setUserId(String value) {
    username = value;
    _validateUserEmail(value);
  }

  @action
  void setPassword(String value) {
    password = value;
    _validatePassword(value);
  }

  @action
  void setConfirmPassword(String value) {
    confirmPassword = value;
  }

  void _validateUserEmail(String value) {
    // Regex for email validation
    String p = "[a-zA-Z0-9\+\.\_\%\-\+]{1,256}" +
        "\\@" +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,64}" +
        "(" +
        "\\." +
        "[a-zA-Z0-9][a-zA-Z0-9\\-]{0,25}" +
        ")+";

    String p2 = "^[_.@A-Za-z0-9-]*\$";

    RegExp regExp = new RegExp(p);

    if (value.isEmpty) {
      loginMessage = "empty";
    } else if (regExp.hasMatch(value)) {
      loginMessage = 'username';
    } else {
      showError = true;
      loginMessage = 'unauthorized';
    }
  }

  void _validatePassword(String value) {
    if (value.isEmpty) {
      passwordMessage = "empty";
    } else if (value.length < 6) {
      passwordMessage = "length";
    } else {
      passwordMessage = '';
    }
  }

  void _validateConfirmPassword(String value) {
    if (value.isEmpty) {
      confirmPasswordMessage = "confirm";
    } else if (value != password) {
      confirmPasswordMessage = "match";
    } else {
      confirmPasswordMessage = '';
    }
    //notifyListeners();
  }


  String messagePassword(context){
    switch (passwordMessage) {
      case "confirm":
        return AppLocalizations.of(context)!.passwordConfirm;
      case "empty":
        return AppLocalizations.of(context)!.passwordEmpty;
      case "length":
        return AppLocalizations.of(context)!.passwordLength;
      case "match":
        return AppLocalizations.of(context)!.passwordMatch;
      default:
        return "";
    }
  }
  String message(context) {
    switch (errorMessage) {
      case "unauthorized":
        return AppLocalizations.of(context)!.errorUnauthorized;
      case "username":
        return AppLocalizations.of(context)!.errorUsername;
      default:
        return AppLocalizations.of(context)!.errorNetwork;
    }
  }


  @action
  login() async {
    loading = true;
    success = false;
    AuthServices.login(username, password, rememberMe)
        .then((v) => _loggedin(v));
  }

  void _loggedin(value) {
      if (value=='SUCCESS') {
        FLog.info(text: "Success login!");
        loggedIn = true;
        loading = false;
        success = true;
        NavigationServices.navigateTo(AppsRoutes.home);
      } else if (value.toString().contains("[401]")) {
        showError = true;
        loading = false;
        errorMessage = "unauthorized";
      } else if (value.toString().contains("[400]"))  {
        showError = true;
        loading = false;
        errorMessage = "username";
      }
  }

  @action
  Future register() async {
    loading = true;
  }

  @action
  Future gotoHome() async {
    if (loggedIn) NavigationServices.navigateTo(AppsRoutes.home);
  }

  @action
  Future forgotPassword() async {
    loading = true;
  }

  @action
  Future<void> logout() async {
    loading = true;
    AuthServices.logout();
    NavigationServices.navigateTo(AppsRoutes.login);
    loading = false;
  }


  dispose() {}
}
