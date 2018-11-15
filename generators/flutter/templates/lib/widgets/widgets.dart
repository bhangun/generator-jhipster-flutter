import 'package:flutter/material.dart';
import 'label_below_icon.dart';


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

