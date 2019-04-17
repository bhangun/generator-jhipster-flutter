import 'package:flutter/material.dart';
import '../../services/helper.dart';
import '../../services/config.dart';
import '../../widgets/drawer.dart';
import '../../widgets/label_below_icon.dart';

class Entity extends StatefulWidget {
  Entity({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _EntityState createState() => _EntityState();
}

class _EntityState extends State<Entity> {
  _EntityState() {
    isRole(ADMIN).then((v) => _isAdmin = v);
  }

  var _title = "bismillah";
  var _isAdmin = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listChild(context)
          )
        ),
        drawer: CommonDrawer(
          accountEmail: "bhangun@gmail.com",
          accountName: "Bismillah",
        ));
  }

  // iconBox
  Widget iconBox(IconData icon,String label,Size size) =>
      SizedBox.fromSize(
        size: Size.square(size.width / 3.3),
        child: Card(
          color: Colors.grey.shade300,
          child: LabelBelowIcon(
            betweenHeight: 15.0,
            icon: icon,
            label: label,
            iconColor: Colors.indigo.shade800,
            isCircleEnabled: false,
          ),
        ),
      );

  // listChild
  listChild(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return <Widget>[
      iconBox(Icons.pie_chart, "Dashboard", size),
      iconBox(Icons.restaurant_menu, "Entities", size),
      iconBox(Icons.email, "email", size)
    ];
  }
}
