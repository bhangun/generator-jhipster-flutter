// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$AlertStore on _AlertStore, Store {
  Computed<String> _$titleComputed;

  @override
  String get title =>
      (_$titleComputed ??= Computed<String>(() => super.title)).value;

  final _$dialogTitleAtom = Atom(name: '_AlertStore.dialogTitle');

  @override
  String get dialogTitle {
    _$dialogTitleAtom.reportObserved();
    return super.dialogTitle;
  }

  @override
  set dialogTitle(String value) {
    _$dialogTitleAtom.context
        .checkIfStateModificationsAreAllowed(_$dialogTitleAtom);
    super.dialogTitle = value;
    _$dialogTitleAtom.reportChanged();
  }

  final _$dialogContentAtom = Atom(name: '_AlertStore.dialogContent');

  @override
  String get dialogContent {
    _$dialogContentAtom.reportObserved();
    return super.dialogContent;
  }

  @override
  set dialogContent(String value) {
    _$dialogContentAtom.context
        .checkIfStateModificationsAreAllowed(_$dialogContentAtom);
    super.dialogContent = value;
    _$dialogContentAtom.reportChanged();
  }

  final _$isOkAtom = Atom(name: '_AlertStore.isOk');

  @override
  bool get isOk {
    _$isOkAtom.reportObserved();
    return super.isOk;
  }

  @override
  set isOk(bool value) {
    _$isOkAtom.context.checkIfStateModificationsAreAllowed(_$isOkAtom);
    super.isOk = value;
    _$isOkAtom.reportChanged();
  }

  final _$isCancelAtom = Atom(name: '_AlertStore.isCancel');

  @override
  bool get isCancel {
    _$isCancelAtom.reportObserved();
    return super.isCancel;
  }

  @override
  set isCancel(bool value) {
    _$isCancelAtom.context.checkIfStateModificationsAreAllowed(_$isCancelAtom);
    super.isCancel = value;
    _$isCancelAtom.reportChanged();
  }

  final _$_AlertStoreActionController = ActionController(name: '_AlertStore');

  @override
  dynamic onDialogOk() {
    final _$actionInfo = _$_AlertStoreActionController.startAction();
    try {
      return super.onDialogOk();
    } finally {
      _$_AlertStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDialogCancel() {
    final _$actionInfo = _$_AlertStoreActionController.startAction();
    try {
      return super.onDialogCancel();
    } finally {
      _$_AlertStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitleDialog(String text) {
    final _$actionInfo = _$_AlertStoreActionController.startAction();
    try {
      return super.setTitleDialog(text);
    } finally {
      _$_AlertStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setContentDialog(String text) {
    final _$actionInfo = _$_AlertStoreActionController.startAction();
    try {
      return super.setContentDialog(text);
    } finally {
      _$_AlertStoreActionController.endAction(_$actionInfo);
    }
  }
}
