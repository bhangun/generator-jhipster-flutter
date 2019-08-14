// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_bloc.dart';

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
    _$dialogTitleAtom.context.enforceReadPolicy(_$dialogTitleAtom);
    _$dialogTitleAtom.reportObserved();
    return super.dialogTitle;
  }

  @override
  set dialogTitle(String value) {
    _$dialogTitleAtom.context.conditionallyRunInAction(() {
      super.dialogTitle = value;
      _$dialogTitleAtom.reportChanged();
    }, _$dialogTitleAtom, name: '${_$dialogTitleAtom.name}_set');
  }

  final _$dialogContentAtom = Atom(name: '_AlertStore.dialogContent');

  @override
  String get dialogContent {
    _$dialogContentAtom.context.enforceReadPolicy(_$dialogContentAtom);
    _$dialogContentAtom.reportObserved();
    return super.dialogContent;
  }

  @override
  set dialogContent(String value) {
    _$dialogContentAtom.context.conditionallyRunInAction(() {
      super.dialogContent = value;
      _$dialogContentAtom.reportChanged();
    }, _$dialogContentAtom, name: '${_$dialogContentAtom.name}_set');
  }

  final _$isOkAtom = Atom(name: '_AlertStore.isOk');

  @override
  bool get isOk {
    _$isOkAtom.context.enforceReadPolicy(_$isOkAtom);
    _$isOkAtom.reportObserved();
    return super.isOk;
  }

  @override
  set isOk(bool value) {
    _$isOkAtom.context.conditionallyRunInAction(() {
      super.isOk = value;
      _$isOkAtom.reportChanged();
    }, _$isOkAtom, name: '${_$isOkAtom.name}_set');
  }

  final _$isCancelAtom = Atom(name: '_AlertStore.isCancel');

  @override
  bool get isCancel {
    _$isCancelAtom.context.enforceReadPolicy(_$isCancelAtom);
    _$isCancelAtom.reportObserved();
    return super.isCancel;
  }

  @override
  set isCancel(bool value) {
    _$isCancelAtom.context.conditionallyRunInAction(() {
      super.isCancel = value;
      _$isCancelAtom.reportChanged();
    }, _$isCancelAtom, name: '${_$isCancelAtom.name}_set');
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
