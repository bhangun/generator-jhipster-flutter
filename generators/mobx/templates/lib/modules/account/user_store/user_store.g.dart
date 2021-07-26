// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UserStore on _UserStore, Store {
  Computed<User?>? _$userDetailComputed;

  @override
  User? get userDetail =>
      (_$userDetailComputed ??= Computed<User?>(() => super.userDetail,
              name: '_UserStore.userDetail'))
          .value;

  final _$itemDetailAtom = Atom(name: '_UserStore.itemDetail');

  @override
  User? get itemDetail {
    _$itemDetailAtom.reportRead();
    return super.itemDetail;
  }

  @override
  set itemDetail(User? value) {
    _$itemDetailAtom.reportWrite(value, super.itemDetail, () {
      super.itemDetail = value;
    });
  }

  final _$islistEmptyAtom = Atom(name: '_UserStore.islistEmpty');

  @override
  bool get islistEmpty {
    _$islistEmptyAtom.reportRead();
    return super.islistEmpty;
  }

  @override
  set islistEmpty(bool value) {
    _$islistEmptyAtom.reportWrite(value, super.islistEmpty, () {
      super.islistEmpty = value;
    });
  }

  final _$isItemEmptyAtom = Atom(name: '_UserStore.isItemEmpty');

  @override
  bool get isItemEmpty {
    _$isItemEmptyAtom.reportRead();
    return super.isItemEmpty;
  }

  @override
  set isItemEmpty(bool value) {
    _$isItemEmptyAtom.reportWrite(value, super.isItemEmpty, () {
      super.isItemEmpty = value;
    });
  }

  final _$personAtom = Atom(name: '_UserStore.person');

  @override
  User? get person {
    _$personAtom.reportRead();
    return super.person;
  }

  @override
  set person(User? value) {
    _$personAtom.reportWrite(value, super.person, () {
      super.person = value;
    });
  }

  final _$isModifiedAtom = Atom(name: '_UserStore.isModified');

  @override
  bool get isModified {
    _$isModifiedAtom.reportRead();
    return super.isModified;
  }

  @override
  set isModified(bool value) {
    _$isModifiedAtom.reportWrite(value, super.isModified, () {
      super.isModified = value;
    });
  }

  final _$userListAtom = Atom(name: '_UserStore.userList');

  @override
  List<User>? get userList {
    _$userListAtom.reportRead();
    return super.userList;
  }

  @override
  set userList(List<User>? value) {
    _$userListAtom.reportWrite(value, super.userList, () {
      super.userList = value;
    });
  }

  final _$totalUserAtom = Atom(name: '_UserStore.totalUser');

  @override
  int get totalUser {
    _$totalUserAtom.reportRead();
    return super.totalUser;
  }

  @override
  set totalUser(int value) {
    _$totalUserAtom.reportWrite(value, super.totalUser, () {
      super.totalUser = value;
    });
  }

  final _$successAtom = Atom(name: '_UserStore.success');

  @override
  bool get success {
    _$successAtom.reportRead();
    return super.success;
  }

  @override
  set success(bool value) {
    _$successAtom.reportWrite(value, super.success, () {
      super.success = value;
    });
  }

  final _$loadingAtom = Atom(name: '_UserStore.loading');

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  final _$idAtom = Atom(name: '_UserStore.id');

  @override
  int? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(int? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$usernameAtom = Atom(name: '_UserStore.username');

  @override
  String? get username {
    _$usernameAtom.reportRead();
    return super.username;
  }

  @override
  set username(String? value) {
    _$usernameAtom.reportWrite(value, super.username, () {
      super.username = value;
    });
  }

  final _$firstnameAtom = Atom(name: '_UserStore.firstname');

  @override
  String? get firstname {
    _$firstnameAtom.reportRead();
    return super.firstname;
  }

  @override
  set firstname(String? value) {
    _$firstnameAtom.reportWrite(value, super.firstname, () {
      super.firstname = value;
    });
  }

  final _$lastnameAtom = Atom(name: '_UserStore.lastname');

  @override
  String? get lastname {
    _$lastnameAtom.reportRead();
    return super.lastname;
  }

  @override
  set lastname(String? value) {
    _$lastnameAtom.reportWrite(value, super.lastname, () {
      super.lastname = value;
    });
  }

  final _$emailAtom = Atom(name: '_UserStore.email');

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$activatedAtom = Atom(name: '_UserStore.activated');

  @override
  String? get activated {
    _$activatedAtom.reportRead();
    return super.activated;
  }

  @override
  set activated(String? value) {
    _$activatedAtom.reportWrite(value, super.activated, () {
      super.activated = value;
    });
  }

  final _$profileAtom = Atom(name: '_UserStore.profile');

  @override
  String? get profile {
    _$profileAtom.reportRead();
    return super.profile;
  }

  @override
  set profile(String? value) {
    _$profileAtom.reportWrite(value, super.profile, () {
      super.profile = value;
    });
  }

  final _$showErrorAtom = Atom(name: '_UserStore.showError');

  @override
  bool get showError {
    _$showErrorAtom.reportRead();
    return super.showError;
  }

  @override
  set showError(bool value) {
    _$showErrorAtom.reportWrite(value, super.showError, () {
      super.showError = value;
    });
  }

  final _$errorMessageAtom = Atom(name: '_UserStore.errorMessage');

  @override
  String get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  final _$positionAtom = Atom(name: '_UserStore.position');

  @override
  int get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(int value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  final _$getProfileAsyncAction = AsyncAction('_UserStore.getProfile');

  @override
  Future getProfile() {
    return _$getProfileAsyncAction.run(() => super.getProfile());
  }

  final _$_UserStoreActionController = ActionController(name: '_UserStore');

  @override
  void setUserId(int value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setUserId');
    try {
      return super.setUserId(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUsername(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setUsername');
    try {
      return super.setUsername(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFirstname(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setFirstname');
    try {
      return super.setFirstname(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastname(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setLastname');
    try {
      return super.setLastname(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setActivated(String value) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setActivated');
    try {
      return super.setActivated(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProfile(String value) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.setProfile');
    try {
      return super.setProfile(value);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void count(List<User> list) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.count');
    try {
      return super.count(list);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setItemData(int data) {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.setItemData');
    try {
      return super.setItemData(data);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic itemTapU(int _position) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.itemTapU');
    try {
      return super.itemTapU(_position);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic itemTap(User data) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.itemTap');
    try {
      return super.itemTap(data);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.save');
    try {
      return super.save();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic delete(String userid) {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.delete');
    try {
      return super.delete(userid);
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic update() {
    final _$actionInfo =
        _$_UserStoreActionController.startAction(name: '_UserStore.update');
    try {
      return super.update();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic getUserList() {
    final _$actionInfo = _$_UserStoreActionController.startAction(
        name: '_UserStore.getUserList');
    try {
      return super.getUserList();
    } finally {
      _$_UserStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
itemDetail: ${itemDetail},
islistEmpty: ${islistEmpty},
isItemEmpty: ${isItemEmpty},
person: ${person},
isModified: ${isModified},
userList: ${userList},
totalUser: ${totalUser},
success: ${success},
loading: ${loading},
id: ${id},
username: ${username},
firstname: ${firstname},
lastname: ${lastname},
email: ${email},
activated: ${activated},
profile: ${profile},
showError: ${showError},
errorMessage: ${errorMessage},
position: ${position},
userDetail: ${userDetail}
    ''';
  }
}
