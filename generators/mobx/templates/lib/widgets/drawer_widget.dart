// import 'package:f_logs/f_logs.dart';
import 'package:flutter/material.dart';
import 'package:<%= appsName %>/modules/account/services/user_routes.dart';

class KutDrawer extends StatefulWidget {
  @override
  _KutDrawerState createState() => _KutDrawerState();
}

class _KutDrawerState extends State<KutDrawer> {
  //String _firstName = '';
  //String _email = '';

  //UserStore _userBloc = UserStore();

  @override
  Widget build(BuildContext context) {
    /* try{
   
      _userBloc.getProfile();
      _firstName = _userBloc.userProfile.firstName;
      _email = _userBloc.userProfile.email;
    }catch(e){
      FLog.info(text:e.toString());
    } */
    return   Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: _listMenu(context),
      ),
    );
  }

  Widget _header(String imgPath) => UserAccountsDrawerHeader(
        accountName: Text("_firstName"),
        accountEmail: Text("_email"),
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
         onTap: () => Navigator.pushReplacementNamed(context, path),
      );

  _listMenu(BuildContext context) {
    var list = <Widget>[];
    list.add(_header(""));
    list.add(_listTitle("Register", context,"/users"));
    list.add(_listTitle("User", context,UserRoutes.userList));
    list.add(_listTitle("Dashboard", context,"/dashboard"));
    // kutilang-needle-add-drawer - Don't remove, used by kutilang to add new list
    list.add(_listTitle("Logout", context,"/login"));
    return list;
  }
}
