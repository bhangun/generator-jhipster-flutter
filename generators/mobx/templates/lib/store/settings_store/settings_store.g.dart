// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsStore on _SettingsStore, Store {
  final _$isLightThemeAtom = Atom(name: '_SettingsStore.isLightTheme');

  @override
  bool get isLightTheme {
    _$isLightThemeAtom.reportRead();
    return super.isLightTheme;
  }

  @override
  set isLightTheme(bool value) {
    _$isLightThemeAtom.reportWrite(value, super.isLightTheme, () {
      super.isLightTheme = value;
    });
  }

  final _$themeAtom = Atom(name: '_SettingsStore.theme');

  @override
  ThemeData get theme {
    _$themeAtom.reportRead();
    return super.theme;
  }

  @override
  set theme(ThemeData value) {
    _$themeAtom.reportWrite(value, super.theme, () {
      super.theme = value;
    });
  }

  final _$localeAtom = Atom(name: '_SettingsStore.locale');

  @override
  Locale get locale {
    _$localeAtom.reportRead();
    return super.locale;
  }

  @override
  set locale(Locale value) {
    _$localeAtom.reportWrite(value, super.locale, () {
      super.locale = value;
    });
  }

  final _$switchLocaleAsyncAction = AsyncAction('_SettingsStore.switchLocale');

  @override
  Future<void> switchLocale(String flag) {
    return _$switchLocaleAsyncAction.run(() => super.switchLocale(flag));
  }

  final _$_SettingsStoreActionController =
      ActionController(name: '_SettingsStore');

  @override
  dynamic switchTheme() {
    final _$actionInfo = _$_SettingsStoreActionController.startAction(
        name: '_SettingsStore.switchTheme');
    try {
      return super.switchTheme();
    } finally {
      _$_SettingsStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLightTheme: ${isLightTheme},
theme: ${theme},
locale: ${locale}
    ''';
  }
}
