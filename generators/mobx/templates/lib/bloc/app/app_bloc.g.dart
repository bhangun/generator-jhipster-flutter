// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_bloc.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars

mixin _$AppStore on _AppStore, Store {
  final _$localeAtom = Atom(name: '_AppStore.locale');

  @override
  String get locale {
    _$localeAtom.context.enforceReadPolicy(_$localeAtom);
    _$localeAtom.reportObserved();
    return super.locale;
  }

  @override
  set locale(String value) {
    _$localeAtom.context.conditionallyRunInAction(() {
      super.locale = value;
      _$localeAtom.reportChanged();
    }, _$localeAtom, name: '${_$localeAtom.name}_set');
  }

  final _$isLightThemeAtom = Atom(name: '_AppStore.isLightTheme');

  @override
  bool get isLightTheme {
    _$isLightThemeAtom.context.enforceReadPolicy(_$isLightThemeAtom);
    _$isLightThemeAtom.reportObserved();
    return super.isLightTheme;
  }

  @override
  set isLightTheme(bool value) {
    _$isLightThemeAtom.context.conditionallyRunInAction(() {
      super.isLightTheme = value;
      _$isLightThemeAtom.reportChanged();
    }, _$isLightThemeAtom, name: '${_$isLightThemeAtom.name}_set');
  }

  final _$themeAtom = Atom(name: '_AppStore.theme');

  @override
  ThemeData get theme {
    _$themeAtom.context.enforceReadPolicy(_$themeAtom);
    _$themeAtom.reportObserved();
    return super.theme;
  }

  @override
  set theme(ThemeData value) {
    _$themeAtom.context.conditionallyRunInAction(() {
      super.theme = value;
      _$themeAtom.reportChanged();
    }, _$themeAtom, name: '${_$themeAtom.name}_set');
  }

  final _$_AppStoreActionController = ActionController(name: '_AppStore');

  @override
  dynamic switchTheme(bool value) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.switchTheme(value);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic switchToDark() {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.switchToDark();
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic switchToLight() {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.switchToLight();
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic switchLocale(String _locale) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.switchLocale(_locale);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic goTo(String route) {
    final _$actionInfo = _$_AppStoreActionController.startAction();
    try {
      return super.goTo(route);
    } finally {
      _$_AppStoreActionController.endAction(_$actionInfo);
    }
  }
}
