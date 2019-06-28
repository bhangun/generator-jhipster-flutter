import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';


listMenuDrawer(){
   var list = <Widget>[];
   list.add(Text(null));
   return list;
}

Widget listTitle(String name) =>
    ListTile(
      title: Text(
        name,
        style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18.0),
      ),
      leading: Icon(
        Icons.person,
        color: Colors.blue,
      ),
    );

Widget header(String accountName,String accountEmail,String imgPath) =>
    UserAccountsDrawerHeader(
      accountName: Text(
        accountName,
      ),
      accountEmail: Text(
        accountEmail,
      ),
      currentAccountPicture: CircleAvatar(
        backgroundImage: new AssetImage(imgPath),
      ),
    );

 // General Methods:-----------------------------------------------------------
  showErrorMessage(BuildContext context, String message) {
    Future.delayed(Duration(milliseconds: 0), () {
      if (message != null) {
        FlushbarHelper.createError(
          message: message,
          title: 'Error',
          duration: Duration(seconds: 3),
        )..show(context);
      }
    });

    return Container();
  }