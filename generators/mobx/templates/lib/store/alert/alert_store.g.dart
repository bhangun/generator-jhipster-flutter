// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alert_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AlertStore on _AlertStore, Store {
  Computed<String>? _$titleComputed;

  @override
  String get title => (_$titleComputed ??=
          Computed<String>(() => super.title, name: '_AlertStore.title'))
      .value;

  final _$dialogTitleAtom = Atom(name: '_AlertStore.dialogTitle');

  @override
  String get dialogTitle {
    _$dialogTitleAtom.reportRead();
    return super.dialogTitle;
  }

  @override
  set dialogTitle(String value) {
    _$dialogTitleAtom.reportWrite(value, super.dialogTitle, () {
      super.dialogTitle = value;
    });
  }

  final _$dialogkuAtom = Atom(name: '_AlertStore.dialogku');

  @override
  String get dialogku {
    _$dialogkuAtom.reportRead();
    return super.dialogku;
  }

  @override
  set dialogku(String value) {
    _$dialogkuAtom.reportWrite(value, super.dialogku, () {
      super.dialogku = value;
    });
  }

  final _$dialogContentAtom = Atom(name: '_AlertStore.dialogContent');

  @override
  String get dialogContent {
    _$dialogContentAtom.reportRead();
    return super.dialogContent;
  }

  @override
  set dialogContent(String value) {
    _$dialogContentAtom.reportWrite(value, super.dialogContent, () {
      super.dialogContent = value;
    });
  }

  final _$isOkAtom = Atom(name: '_AlertStore.isOk');

  @override
  bool get isOk {
    _$isOkAtom.reportRead();
    return super.isOk;
  }

  @override
  set isOk(bool value) {
    _$isOkAtom.reportWrite(value, super.isOk, () {
      super.isOk = value;
    });
  }

  final _$isCancelAtom = Atom(name: '_AlertStore.isCancel');

  @override
  bool get isCancel {
    _$isCancelAtom.reportRead();
    return super.isCancel;
  }

  @override
  set isCancel(bool value) {
    _$isCancelAtom.reportWrite(value, super.isCancel, () {
      super.isCancel = value;
    });
  }

  final _$_AlertStoreActionController = ActionController(name: '_AlertStore');

  @override
  dynamic onDialogOk() {
    final _$actionInfo = _$_AlertStoreActionController.startAction(
        name: '_AlertStore.onDialogOk');
    try {
      return super.onDialogOk();
    } finally {
      _$_AlertStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic onDialogCancel() {
    final _$actionInfo = _$_AlertStoreActionController.startAction(
        name: '_AlertStore.onDialogCancel');
    try {
      return super.onDialogCancel();
    } finally {
      _$_AlertStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTitleDialog(String text) {
    final _$actionInfo = _$_AlertStoreActionController.startAction(
        name: '_AlertStore.setTitleDialog');
    try {
      return super.setTitleDialog(text);
    } finally {
      _$_AlertStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setContentDialog(String text) {
    final _$actionInfo = _$_AlertStoreActionController.startAction(
        name: '_AlertStore.setContentDialog');
    try {
      return super.setContentDialog(text);
    } finally {
      _$_AlertStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
dialogTitle: ${dialogTitle},
dialogku: ${dialogku},
dialogContent: ${dialogContent},
isOk: ${isOk},
isCancel: ${isCancel},
title: ${title}
    ''';
  }
}
