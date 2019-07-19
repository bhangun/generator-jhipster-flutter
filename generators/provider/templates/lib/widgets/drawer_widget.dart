import 'package:flutter/material.dart';
import 'package:jh_flutter_provider/bloc/app/app_bloc.dart';
import 'package:jh_flutter_provider/modules/account/bloc/user/index.dart';
import 'package:provider/provider.dart';

class CommonDrawer extends StatefulWidget {
@override
_CommonDrawerState createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {
  String _firstName ='';
  String _email ='';

  UserBloc _userBloc;
  AppBloc _appBloc;


  @override
  Widget build(BuildContext context) {
     _userBloc = Provider.of<UserBloc>(context);
     _appBloc = Provider.of<AppBloc>(context);

     _firstName = _userBloc.userProfile.firstName;
     _email = _userBloc.userProfile.email;

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: _listMenu(context),
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

  Widget _listTitle(String name, BuildContext context,String path) => ListTile(
        title: Text(
          name,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
        ),
        leading: Icon(
          Icons.person,
          color: Colors.blue,
        ),
        onTap: () => _userBloc.viewList(),
      );

  Widget _switchTheme() =>  Row(
    mainAxisSize:  MainAxisSize.max,
      children: <Widget>[Text('Theme'),
        Switch(
    value: _appBloc.isLightTheme,
    onChanged: (bool value)=>_appBloc.switchTheme(value))]);


  _listMenu(BuildContext context) {
    var list = <Widget>[];
    list.add(_header());
    list.add(_switchTheme());
    list.add(_listTitle("Register", context,"/users"));
    list.add(_listTitle("User", context,"/users"));
    list.add(_listTitle("Dashboard", context,"/dashboard"));
    // kutilang-needle-add-drawer - Don't remove, used by kutilang to add new list
    list.add(_listTitle("Logout", context,"/login"));
    return list;
  }
}
