// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$AuthenticationStore on _AuthenticationStore, Store {
  Computed<bool> _$canLoginComputed;

  @override
  bool get canLogin =>
      (_$canLoginComputed ??= Computed<bool>(() => super.canLogin)).value;
  Computed<bool> _$canRegisterComputed;

  @override
  bool get canRegister =>
      (_$canRegisterComputed ??= Computed<bool>(() => super.canRegister)).value;
  Computed<bool> _$canForgetPasswordComputed;

  @override
  bool get canForgetPassword => (_$canForgetPasswordComputed ??=
          Computed<bool>(() => super.canForgetPassword))
      .value;
  Computed<bool> _$hasErrorsInLoginComputed;

  @override
  bool get hasErrorsInLogin => (_$hasErrorsInLoginComputed ??=
          Computed<bool>(() => super.hasErrorsInLogin))
      .value;
  Computed<bool> _$hasErrorsInRegisterComputed;

  @override
  bool get hasErrorsInRegister => (_$hasErrorsInRegisterComputed ??=
          Computed<bool>(() => super.hasErrorsInRegister))
      .value;
  Computed<bool> _$hasErrorInForgotPasswordComputed;

  @override
  bool get hasErrorInForgotPassword => (_$hasErrorInForgotPasswordComputed ??=
          Computed<bool>(() => super.hasErrorInForgotPassword))
      .value;

  final _$userEmailAtom = Atom(name: '_AuthenticationStore.userEmail');

  @override
  String get userEmail {
    _$userEmailAtom.reportObserved();
    return super.userEmail;
  }

  @override
  set userEmail(String value) {
    _$userEmailAtom.context
        .checkIfStateModificationsAreAllowed(_$userEmailAtom);
    super.userEmail = value;
    _$userEmailAtom.reportChanged();
  }

  final _$passwordAtom = Atom(name: '_AuthenticationStore.password');

  @override
  String get password {
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.checkIfStateModificationsAreAllowed(_$passwordAtom);
    super.password = value;
    _$passwordAtom.reportChanged();
  }

  final _$confirmPasswordAtom =
      Atom(name: '_AuthenticationStore.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.reportObserved();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.context
        .checkIfStateModificationsAreAllowed(_$confirmPasswordAtom);
    super.confirmPassword = value;
    _$confirmPasswordAtom.reportChanged();
  }

  final _$successAtom = Atom(name: '_AuthenticationStore.success');

  @override
  bool get success {
    _$successAtom.reportObserved();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.context.checkIfStateModificationsAreAllowed(_$successAtom);
    super.success = value;
    _$successAtom.reportChanged();
  }

  final _$loggedInAtom = Atom(name: '_AuthenticationStore.loggedIn');

  @override
  bool get loggedIn {
    _$loggedInAtom.reportObserved();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.context.checkIfStateModificationsAreAllowed(_$loggedInAtom);
    super.loggedIn = value;
    _$loggedInAtom.reportChanged();
  }

  final _$loadingAtom = Atom(name: '_AuthenticationStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.checkIfStateModificationsAreAllowed(_$loadingAtom);
    super.loading = value;
    _$loadingAtom.reportChanged();
  }

  final _$rememberMeAtom = Atom(name: '_AuthenticationStore.rememberMe');

  @override
  bool get rememberMe {
    _$rememberMeAtom.reportObserved();
    return super.rememberMe;
  }

  @override
  set rememberMe(bool value) {
    _$rememberMeAtom.context
        .checkIfStateModificationsAreAllowed(_$rememberMeAtom);
    super.rememberMe = value;
    _$rememberMeAtom.reportChanged();
  }

  final _$registerAsyncAction = AsyncAction('register');

  @override
  Future<dynamic> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future login(String _username, String _password, [bool _rememberMe = false]) {
    return _$loginAsyncAction
        .run(() => super.login(_username, _password, _rememberMe));
  }

  final _$forgotPasswordAsyncAction = AsyncAction('forgotPassword');

  @override
  Future<dynamic> forgotPassword() {
    return _$forgotPasswordAsyncAction.run(() => super.forgotPassword());
  }

  final _$logoutAsyncAction = AsyncAction('logout');

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  final _$_AuthenticationStoreActionController =
      ActionController(name: '_AuthenticationStore');

  @override
  void setUserId(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction();
    try {
      return super.setUserId(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction();
    try {
      return super.setPassword(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setConfirmPassword(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction();
    try {
      return super.setConfirmPassword(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateUserEmail(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction();
    try {
      return super.validateUserEmail(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validatePassword(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction();
    try {
      return super.validatePassword(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void validateConfirmPassword(String value) {
    final _$actionInfo = _$_AuthenticationStoreActionController.startAction();
    try {
      return super.validateConfirmPassword(value);
    } finally {
      _$_AuthenticationStoreActionController.endAction(_$actionInfo);
    }
  }
}
