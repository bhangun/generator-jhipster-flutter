import 'package:flushbar/flushbar.dart';
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

  showInformation(BuildContext context, String title,String message) {
    Future.delayed(Duration(milliseconds: 0), () {
     FlushbarHelper.createInformation(
          message: message,
          title: title,
          duration: Duration(seconds: 3),
        )..show(context);
    });
    return Container();
  }


  showMe(BuildContext context){
     Flushbar(
      title: "Hey Ninja",
      message: "Lorem Ipsum is simply dummy text of the printing and typesetting industry",
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
      boxShadows: [BoxShadow(color: Colors.blue[800], offset: Offset(0.0, 2.0), blurRadius: 3.0)],
      backgroundGradient: LinearGradient(colors: [Colors.blueGrey, Colors.black]),
      isDismissible: false,
      duration: Duration(seconds: 4),
      icon: Icon(
        Icons.check,
        color: Colors.greenAccent,
      ),
      mainButton: FlatButton(
        onPressed: () {},
        child: Text(
          "CLAP",
          style: TextStyle(color: Colors.amber),
        ),
      ),
      showProgressIndicator: true,
      progressIndicatorBackgroundColor: Colors.blueGrey,
      titleText: Text(
        "Hello Hero",
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.yellow[600], fontFamily: "ShadowsIntoLightTwo"),
      ),
      messageText: Text(
        "You killed that giant monster in the city. Congratulations!",
        style: TextStyle(fontSize: 18.0, color: Colors.green, fontFamily: "ShadowsIntoLightTwo"),
      ),
    ).show(context);
  }