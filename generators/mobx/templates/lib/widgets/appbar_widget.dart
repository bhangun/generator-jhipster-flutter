

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/diagnostics.dart';
import '../services/routes.dart';
import '../services/sharedpref/preferences.dart';
import 'package:shared_preferences/shared_preferences.dart';


buildAppBar(BuildContext context, String title) {
    return AppBar(
      title: Text(title),
      actions: <Widget>[
        IconButton(
          onPressed: () {
            SharedPreferences.getInstance().then((preference) {
              preference.setBool(Preferences.is_logged_in, false);
              Navigator.of(context).pushReplacementNamed(Routes.login);
            });
          },
          icon: Icon(
            Icons.power_settings_new,
          ),
        )
      ],
    );
  }


