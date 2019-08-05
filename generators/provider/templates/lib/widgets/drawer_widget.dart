import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:<%= appsName %>/services/getIt.dart';
import 'package:<%= appsName %>/utils/modules.dart';
import 'package:<%= appsName %>/bloc/app/app_bloc.dart';
import 'package:<%= appsName %>/modules/account/bloc/user_bloc.dart';

class CommonDrawer extends StatefulWidget {
  @override
  _CommonDrawerState createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  String _firstName = '';
  String _email = '';

  UserBloc _userBloc;
  AppBloc _appBloc;

  @override
  Widget build(BuildContext context) {
    _userBloc = Provider.of<UserBloc>(context);
    _appBloc = Provider.of<AppBloc>(context, listen: false);

    _firstName = _userBloc.userProfile.firstName;
    _email = _userBloc.userProfile.email;

    return Drawer(
      child: ListView(padding: EdgeInsets.zero, children:
        _listMenu(),
      ),
    );
  }

  Widget _header() => UserAccountsDrawerHeader(
        accountName: Text(_firstName),
        accountEmail: Text(_email),
        currentAccountPicture: CircleAvatar(
            // backgroundImage: ,
            ),
      );

  Widget _listTitle(String title, String route) => ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
        ),
        leading: Icon(
          Icons.person,
          color: Colors.blue,
        ),
        onTap: () => _appBloc.goTo(route),
      );

  Widget _switchTheme() =>
      Row(mainAxisSize: MainAxisSize.max, children: <Widget>[
        Text('Light'),
        Switch(
            value: _appBloc.isLightTheme,
            onChanged: (bool value) => _appBloc.switchTheme(value)),
        Text('Dark')
      ]);

  _listMenu() {
    var list = <Widget>[];
    list.add(_header());
    list.add(_switchTheme());

    getIt<Modules>().pages.forEach((p){
      if(p.showInDrawer)
        list.add(_listTitle(p.title,p.route));
    });
    return list;
  }
}
