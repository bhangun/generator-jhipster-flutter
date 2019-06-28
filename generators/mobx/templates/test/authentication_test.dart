import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import '../lib/services/network/connection.dart';
import '../lib/modules/account/helper/account_helper.dart';

void main() {
  group('Authentication', () {
    String username = 'admin';
    String password = 'admin';
    // var token = '';
    test('login', () async {
      bool rememberMe = false;
      login(username, password, rememberMe);
    });

    test('get user', () async {
      String profile = await restGet(API_ACCOUNT,true,false);
      expect(json.decode(profile)['login'],username);
      user('1').then((v)=> print(v.login));
    });

    /* test('profile', () async {
      String profile = await restGet(API_ACCOUNT,true,false);
      expect(json.decode(profile)['login'],username);
    }); */
  });
}