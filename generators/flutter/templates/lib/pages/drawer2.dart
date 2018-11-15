import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jh_flutter_sample/blocs/auth_bloc/auth.dart';
//import 'widgets.dart'; // deferred as listMenuDrawer;

class CommonDrawer extends StatelessWidget {
  final String accountName;
  final String accountEmail;
  final AuthenticationBloc authBloc;

   CommonDrawer({this.accountName, this.accountEmail, this.authBloc});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: _listMenu(context),
      ),
    );
  }

 

  Widget _header(String imgPath) => UserAccountsDrawerHeader(
        accountName: Text(
          accountName,
        ),
        accountEmail: Text(
          accountEmail,
        ),
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
        onTap: () => Navigator.pushNamed(context, path),
      );

  _listMenu(BuildContext context) {
    var list = <Widget>[];
    list.add(_header(""));
    list.add(_listTitle("Register", context,"/users"));
    list.add(_listTitle("User", context,"/users"));
    list.add(_listTitle("Dashboard", context,"/dashboard"));
    //list.add(_listTitle("Logout", context,"/login"));
    
    /* list.add(
      ListTile(
        title: Text(
          "Logout",
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
        ),
        leading: Icon(
          Icons.person,
          color: Colors.blue,
        ),
        onTap: (){
          print("????????????????????????????");
         /*  BlocBuilder<AuthenticationEvent, AuthenticationState>(
            bloc: authBloc,
            builder: (BuildContext context,AuthenticationState loginState) { */
           //  authBloc.onLogout();
             // Navigator.pushNamed(context, "/login");},
     //   );
       // }
      )
    ); */


   // return list;
  }
}
