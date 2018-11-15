import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jh_flutter_sample/blocs/auth_bloc/auth.dart';
import '../services/services.dart';
import '../widgets/drawer.dart';
import '../widgets/label_below_icon.dart';



class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _HomePageState() {
    //.then((v) => _isAdmin = v);
  }

  var _title = "Home";
  var _isAdmin = false;

  @override
  Widget build(BuildContext context) {
    AuthenticationBloc _authBloc = BlocProvider.of<AuthenticationBloc>(context);
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
          accountName: "Alhamdulillah",
         // authBloc: _authBloc
        )
        );
  }

  // iconBox
  Widget iconBox(IconData icon,String label,Size size,BuildContext context,String path) =>
      SizedBox.fromSize(
        size: Size.square(size.width / 3.3),
        child: Card(
          color: Colors.grey.shade300,
          child: LabelBelowIcon(
            betweenHeight: 15.0,
            icon: icon,
            label: label,
            iconColor: Colors.lightGreen,
            isCircleEnabled: false,
            onPressed: (){
              print("+++++++++++++++>>>>>>");
              Navigator.pushNamed(context, path);
            },
          ),
        ),
      );

  // listChild
  listChild(BuildContext context){
    Size size = MediaQuery.of(context).size;
    return <Widget>[
      iconBox(Icons.pie_chart, "Dashboard", size,context,"/dashboard"),
      iconBox(Icons.restaurant_menu, "Entities", size,context,"/entities"),
      iconBox(Icons.email, "email", size,context,"/dashboard")
    ];
  }
}
