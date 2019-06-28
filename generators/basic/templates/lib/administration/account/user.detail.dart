import 'package:flutter/material.dart';
import '../../administration/account/user.form.dart';
import 'user.helper.dart';
import '../../administration/account/user.dart';

class UserDetail extends StatelessWidget {
  final int id;
  final String username;
  User data;
  UserDetail({@required this.id, @required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("User Detail"),
          elevation: 5.0, // Removing the drop shadow cast by the app bar.
        ),
        body: FutureBuilder(
            future: user(username),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? userDetail(snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserFormPage(data: data)));
          },
          tooltip: 'Add',
          child: Icon(Icons.edit),
        ));
  }

  Widget userDetail(User _data) {
    data = _data;
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 100.0),
          Icon(Icons.person, size: 100, color: Colors.blue[500]),
         Column(
              children: <Widget>[
                Text(data.login),
                Text(data.firstName),
                Text(data.lastName),
                Text(data.email),
                Text(data.authorities.toString()),
                Text(data.lastModifiedDate.toString()),
                Text(data.createdDate.toString()),
              ])
        ]);
  }
}
