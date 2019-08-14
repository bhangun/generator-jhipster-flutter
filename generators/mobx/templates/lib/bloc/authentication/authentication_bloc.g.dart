// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$AuthenticationStore on _AuthenticationStore, Store {
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

  final _$usernameAtom = Atom(name: '_AuthenticationStore.username');

  @override
  String get username {
    _$usernameAtom.context.enforceReadPolicy(_$usernameAtom);
    _$usernameAtom.reportObserved();
    return super.username;
  }

  @override
  set username(String value) {
    _$usernameAtom.context.conditionallyRunInAction(() {
      super.username = value;
      _$usernameAtom.reportChanged();
    }, _$usernameAtom, name: '${_$usernameAtom.name}_set');
  }

  final _$userMessageAtom = Atom(name: '_AuthenticationStore.userMessage');

  @override
  String get userMessage {
    _$userMessageAtom.context.enforceReadPolicy(_$userMessageAtom);
    _$userMessageAtom.reportObserved();
    return super.userMessage;
  }

  @override
  set userMessage(String value) {
    _$userMessageAtom.context.conditionallyRunInAction(() {
      super.userMessage = value;
      _$userMessageAtom.reportChanged();
    }, _$userMessageAtom, name: '${_$userMessageAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_AuthenticationStore.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$passwordMessageAtom =
      Atom(name: '_AuthenticationStore.passwordMessage');

  @override
  String get passwordMessage {
    _$passwordMessageAtom.context.enforceReadPolicy(_$passwordMessageAtom);
    _$passwordMessageAtom.reportObserved();
    return super.passwordMessage;
  }

  @override
  set passwordMessage(String value) {
    _$passwordMessageAtom.context.conditionallyRunInAction(() {
      super.passwordMessage = value;
      _$passwordMessageAtom.reportChanged();
    }, _$passwordMessageAtom, name: '${_$passwordMessageAtom.name}_set');
  }

  final _$confirmPasswordAtom =
      Atom(name: '_AuthenticationStore.confirmPassword');

  @override
  String get confirmPassword {
    _$confirmPasswordAtom.context.enforceReadPolicy(_$confirmPasswordAtom);
    _$confirmPasswordAtom.reportObserved();
    return super.confirmPassword;
  }

  @override
  set confirmPassword(String value) {
    _$confirmPasswordAtom.context.conditionallyRunInAction(() {
      super.confirmPassword = value;
      _$confirmPasswordAtom.reportChanged();
    }, _$confirmPasswordAtom, name: '${_$confirmPasswordAtom.name}_set');
  }

  final _$confirmPasswordMessageAtom =
      Atom(name: '_AuthenticationStore.confirmPasswordMessage');

  @override
  String get confirmPasswordMessage {
    _$confirmPasswordMessageAtom.context
        .enforceReadPolicy(_$confirmPasswordMessageAtom);
    _$confirmPasswordMessageAtom.reportObserved();
    return super.confirmPasswordMessage;
  }

  @override
  set confirmPasswordMessage(String value) {
    _$confirmPasswordMessageAtom.context.conditionallyRunInAction(() {
      super.confirmPasswordMessage = value;
      _$confirmPasswordMessageAtom.reportChanged();
    }, _$confirmPasswordMessageAtom,
        name: '${_$confirmPasswordMessageAtom.name}_set');
  }

  final _$successAtom = Atom(name: '_AuthenticationStore.success');

  @override
  bool get success {
    _$successAtom.context.enforceReadPolicy(_$successAtom);
    _$successAtom.reportObserved();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.context.conditionallyRunInAction(() {
      super.success = value;
      _$successAtom.reportChanged();
    }, _$successAtom, name: '${_$successAtom.name}_set');
  }

  final _$loggedInAtom = Atom(name: '_AuthenticationStore.loggedIn');

  @override
  bool get loggedIn {
    _$loggedInAtom.context.enforceReadPolicy(_$loggedInAtom);
    _$loggedInAtom.reportObserved();
    return super.loggedIn;
  }

  @override
  set loggedIn(bool value) {
    _$loggedInAtom.context.conditionallyRunInAction(() {
      super.loggedIn = value;
      _$loggedInAtom.reportChanged();
    }, _$loggedInAtom, name: '${_$loggedInAtom.name}_set');
  }

  final _$loadingAtom = Atom(name: '_AuthenticationStore.loading');

  @override
  bool get loading {
    _$loadingAtom.context.enforceReadPolicy(_$loadingAtom);
    _$loadingAtom.reportObserved();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.context.conditionallyRunInAction(() {
      super.loading = value;
      _$loadingAtom.reportChanged();
    }, _$loadingAtom, name: '${_$loadingAtom.name}_set');
  }

  final _$rememberMeAtom = Atom(name: '_AuthenticationStore.rememberMe');

  @override
  bool get rememberMe {
    _$rememberMeAtom.context.enforceReadPolicy(_$rememberMeAtom);
    _$rememberMeAtom.reportObserved();
    return super.rememberMe;
  }

  @override
  set rememberMe(bool value) {
    _$rememberMeAtom.context.conditionallyRunInAction(() {
      super.rememberMe = value;
      _$rememberMeAtom.reportChanged();
    }, _$rememberMeAtom, name: '${_$rememberMeAtom.name}_set');
  }

  final _$errorMessageAtom = Atom(name: '_AuthenticationStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.context.enforceReadPolicy(_$errorMessageAtom);
    _$errorMessageAtom.reportObserved();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.context.conditionallyRunInAction(() {
      super.errorMessage = value;
      _$errorMessageAtom.reportChanged();
    }, _$errorMessageAtom, name: '${_$errorMessageAtom.name}_set');
  }

  final _$showErrorAtom = Atom(name: '_AuthenticationStore.showError');

  @override
  bool get showError {
    _$showErrorAtom.context.enforceReadPolicy(_$showErrorAtom);
    _$showErrorAtom.reportObserved();
    return super.showError;
  }

  @override
  set showError(bool value) {
    _$showErrorAtom.context.conditionallyRunInAction(() {
      super.showError = value;
      _$showErrorAtom.reportChanged();
    }, _$showErrorAtom, name: '${_$showErrorAtom.name}_set');
  }

  final _$registerAsyncAction = AsyncAction('register');

  @override
  Future<dynamic> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  final _$loginAsyncAction = AsyncAction('login');

  @override
  Future login() {
    return _$loginAsyncAction.run(() => super.login());
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
}
