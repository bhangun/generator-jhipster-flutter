// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$UserStore on _UserStore, Store {
  Computed<User> _$userProfileComputed;

  @override
  User get userProfile =>
      (_$userProfileComputed ??= Computed<User>(() => super.userProfile)).value;
  Computed<User> _$userDetailComputed;

  @override
  User get userDetail =>
      (_$userDetailComputed ??= Computed<User>(() => super.userDetail)).value;

  final _$itemDetailAtom = Atom(name: '_UserStore.itemDetail');

  @override
  User get itemDetail {
    _$itemDetailAtom.context.enforceReadPolicy(_$itemDetailAtom);
    _$itemDetailAtom.reportObserved();
    return super.itemDetail;
  }

  @override
  set itemDetail(User value) {
    _$itemDetailAtom.context.conditionallyRunInAction(() {
      super.itemDetail = value;
      _$itemDetailAtom.reportChanged();
    }, _$itemDetailAtom, name: '${_$itemDetailAtom.name}_set');
  }

  final _$islistEmptyAtom = Atom(name: '_UserStore.islistEmpty');

  @override
  bool get islistEmpty {
    _$islistEmptyAtom.context.enforceReadPolicy(_$islistEmptyAtom);
    _$islistEmptyAtom.reportObserved();
    return super.islistEmpty;
  }

  @override
  set islistEmpty(bool value) {
    _$islistEmptyAtom.context.conditionallyRunInAction(() {
      super.islistEmpty = value;
      _$islistEmptyAtom.reportChanged();
    }, _$islistEmptyAtom, name: '${_$islistEmptyAtom.name}_set');
  }

  final _$isItemEmptyAtom = Atom(name: '_UserStore.isItemEmpty');

  @override
  bool get isItemEmpty {
    _$isItemEmptyAtom.context.enforceReadPolicy(_$isItemEmptyAtom);
    _$isItemEmptyAtom.reportObserved();
    return super.isItemEmpty;
  }

  @override
  set isItemEmpty(bool value) {
    _$isItemEmptyAtom.context.conditionallyRunInAction(() {
      super.isItemEmpty = value;
      _$isItemEmptyAtom.reportChanged();
    }, _$isItemEmptyAtom, name: '${_$isItemEmptyAtom.name}_set');
  }

  final _$profile2Atom = Atom(name: '_UserStore.profile2');

  @override
  User get profile2 {
    _$profile2Atom.context.enforceReadPolicy(_$profile2Atom);
    _$profile2Atom.reportObserved();
    return super.profile2;
  }

  @override
  set profile2(User value) {
    _$profile2Atom.context.conditionallyRunInAction(() {
      super.profile2 = value;
      _$profile2Atom.reportChanged();
    }, _$profile2Atom, name: '${_$profile2Atom.name}_set');
  }

  final _$personAtom = Atom(name: '_UserStore.person');

  @override
  User get person {
    _$personAtom.context.enforceReadPolicy(_$personAtom);
    _$personAtom.reportObserved();
    return super.person;
  }

  @override
  set person(User value) {
    _$personAtom.context.conditionallyRunInAction(() {
      super.person = value;
      _$personAtom.reportChanged();
    }, _$personAtom, name: '${_$personAtom.name}_set');
  }

  final _$isModifiedAtom = Atom(name: '_UserStore.isModified');

  @override
  bool get isModified {
    _$isModifiedAtom.context.enforceReadPolicy(_$isModifiedAtom);
    _$isModifiedAtom.reportObserved();
    return super.isModified;
  }

  @override
  set isModified(bool value) {
    _$isModifiedAtom.context.conditionallyRunInAction(() {
      super.isModified = value;
      _$isModifiedAtom.reportChanged();
    }, _$isModifiedAtom, name: '${_$isModifiedAtom.name}_set');
  }

  final _$userListAtom = Atom(name: '_UserStore.userList');

  @override
  List<User> get userList {
    _$userListAtom.context.enforceReadPolicy(_$userListAtom);
    _$userListAtom.reportObserved();
    return super.userList;
  }

  @override
  set userList(List<User> value) {
    _$userListAtom.context.conditionallyRunInAction(() {
      super.userList = value;
      _$userListAtom.reportChanged();
    }, _$userListAtom, name: '${_$userListAtom.name}_set');
  }

  final _$totalUserAtom = Atom(name: '_UserStore.totalUser');

  @override
  int get totalUser {
    _$totalUserAtom.context.enforceReadPolicy(_$totalUserAtom);
    _$totalUserAtom.reportObserved();
    return super.totalUser;
  }

  @override
  set totalUser(int value) {
    _$totalUserAtom.context.conditionallyRunInAction(() {
      super.totalUser = value;
      _$totalUserAtom.reportChanged();
    }, _$totalUserAtom, name: '${_$totalUserAtom.name}_set');
  }

  final _$successAtom = Atom(name: '_UserStore.success');

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

  final _$loadingAtom = Atom(name: '_UserStore.loading');

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

  final _$idAtom = Atom(name: '_UserStore.id');

  @override
  int get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(int value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$usernameAtom = Atom(name: '_UserStore.username');

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

  final _$firstnameAtom = Atom(name: '_UserStore.firstname');

  @override
  String get firstname {
    _$firstnameAtom.context.enforceReadPolicy(_$firstnameAtom);
    _$firstnameAtom.reportObserved();
    return super.firstname;
  }

  @override
  set firstname(String value) {
    _$firstnameAtom.context.conditionallyRunInAction(() {
      super.firstname = value;
      _$firstnameAtom.reportChanged();
    }, _$firstnameAtom, name: '${_$firstnameAtom.name}_set');
  }

  final _$lastnameAtom = Atom(name: '_UserStore.lastname');

  @override
  String get lastname {
    _$lastnameAtom.context.enforceReadPolicy(_$lastnameAtom);
    _$lastnameAtom.reportObserved();
    return super.lastname;
  }

  @override
  set lastname(String value) {
    _$lastnameAtom.context.conditionallyRunInAction(() {
      super.lastname = value;
      _$lastnameAtom.reportChanged();
    }, _$lastnameAtom, name: '${_$lastnameAtom.name}_set');
  }

  final _$emailAtom = Atom(name: '_UserStore.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$activatedAtom = Atom(name: '_UserStore.activated');

  @override
  String get activated {
    _$activatedAtom.context.enforceReadPolicy(_$activatedAtom);
    _$activatedAtom.reportObserved();
    return super.activated;
  }

  @override
  set activated(String value) {
    _$activatedAtom.context.conditionallyRunInAction(() {
      super.activated = value;
      _$activatedAtom.reportChanged();
    }, _$activatedAtom, name: '${_$activatedAtom.name}_set');
  }

  final _$profileAtom = Atom(name: '_UserStore.profile');

  @override
  String get profile {
    _$profileAtom.context.enforceReadPolicy(_$profileAtom);
    _$profileAtom.reportObserved();
    return super.profile;
  }

  @override
  set profile(String value) {
    _$profileAtom.context.conditionallyRunInAction(() {
      super.profile = value;
      _$profileAtom.reportChanged();
    }, _$profileAtom, name: '${_$profileAtom.name}_set');
  }

  final _$showErrorAtom = Atom(name: '_UserStore.showError');

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

  final _$errorMessageAtom = Atom(name: '_UserStore.errorMessage');

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

  final _$positionAtom = Atom(name: '_UserStore.position');

  @override
  int get position {
    _$positionAtom.context.enforceReadPolicy(_$positionAtom);
    _$positionAtom.reportObserved();
    return super.position;
  }

  @override
  set position(int value) {
    _$positionAtom.context.conditionallyRunInAction(() {
      super.position = value;
      _$positionAtom.reportChanged();
    }, _$positionAtom, name: '${_$positionAtom.name}_set');
  }

  final _$getUserListAsyncAction = AsyncAction('getUserList');

  @override
  Future<dynamic> getUserList() {
    return _$getUserListAsyncAction.run(() => super.getUserList());
  }

  final _$getProfileAsyncAction = AsyncAction('getProfile');

  @override
  Future getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void setUserId(int value) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.setUserId(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.setUsername(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFirstname(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.setFirstname(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastname(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.setLastname(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.setEmail(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActivated(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.setActivated(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProfile(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.setProfile(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void count(List<User> list) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.count(list);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setItemData(int data) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.setItemData(data);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic itemTapU(int _position) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.itemTapU(_position);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic itemTap(User data) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.itemTap(data);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic add() {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.add();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save() {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.save();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic delete(String userid) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.delete(userid);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic update(int id) {
    final _$actionInfo = _$_UserStoreActionController.startAction();
    try {
      return super.update(id);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }
}
