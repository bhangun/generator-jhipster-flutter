import 'package:flutter/material.dart';
import 'user.detail.dart';
import 'user.helper.dart';
import 'user.dart';
import 'dart:convert';
import 'user.form.dart';

class UserListPage extends StatefulWidget {
  //UserListPage({Key key, this.title}) : super(key: key);

  @override
  _UserListPageState createState() => _UserListPageState();
}

final String _title = "User List";

class _UserListPageState extends State<UserListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(_title),
          elevation: 5.0, // Removing the drop shadow cast by the app bar.
        ),
        body: FutureBuilder(
            future: users(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              return snapshot.hasData
                  ? UserList(data: snapshot.data)
                  : Center(child: CircularProgressIndicator());
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UserFormPage()));
          },
          tooltip: 'Add',
          child: Icon(Icons.add),
        ));
  }
}

Widget item(int id, String name, String role, BuildContext context) {
  return ListTile(
      title: Text(name,
          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20.0)),
      subtitle: Text(role),
      onTap: () {
        print(id.toString() + " > tap");
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => UserDetail(
                      id: id,
                      username: name,
                    )));
      },
      leading: Icon(Icons.person, size: 50,color: Colors.blue[500]));
}

class UserList extends StatelessWidget {
  final String data;
  UserList({this.data});

  @override
  Widget build(BuildContext context) {
    final parsed = json.decode(data).cast<Map<String, dynamic>>();
    List<User> _items =
        parsed.map<User>((json) => User.fromJson(json)).toList();

    return ListView.builder(
      itemCount: _items.length,
      itemBuilder: (context, index) {
        final user = _items[index];
        return item(user.id, user.login, user.email, context);
      },
    );
  }
}
