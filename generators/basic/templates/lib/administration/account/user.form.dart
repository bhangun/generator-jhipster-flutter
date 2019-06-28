import 'package:flutter/material.dart';
import '../../services/services.dart';
import 'user.helper.dart';
import 'user.dart';

class UserFormPage extends StatefulWidget {
  final User data;
  bool isEdit = false;
  UserFormPage({this.data});
  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  bool _activated = false;
  final _username = TextEditingController();
  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if (widget.data != null) {
      widget.isEdit = true;
      User user = widget.data;

      _username.text = user.login;
      _firstname.text = user.firstName;
      _lastname.text = user.lastName;
      _email.text = user.email;
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Create User'),
        ),
        body: SafeArea(
            child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                children: _listChild())),
        floatingActionButton: FloatingActionButton(
          onPressed: _save,
          tooltip: 'Add',
          child: Icon(Icons.save),
        ));
  }

  _listChild() {
    return <Widget>[
      SizedBox(height: 120.0),
      TextField(
        controller: _username,
        decoration: InputDecoration(
          filled: true,
          labelText: 'Login',
        ),
      ),
      TextField(
        controller: _firstname,
        decoration: InputDecoration(
          filled: true,
          labelText: 'First Name',
        ),
      ),
      TextField(
        controller: _lastname,
        decoration: InputDecoration(
          filled: true,
          labelText: 'Last Name',
        ),
      ),
      TextField(
        controller: _email,
        decoration: InputDecoration(
          filled: true,
          labelText: 'Email',
        ),
      ),
      Checkbox(
          value: _activated,
          onChanged: (bool newValue) {
            setState(() {
              _activated = newValue;
            });
          }),
      RaisedButton(
          child: Text('Profile'),
          onPressed: () {
          }),
    ];
  }

  void _save() async {
    try {
      if (widget.isEdit) {
        await updateUser(User(
            id: widget.data.id,
            login: _username.text,
            firstName: _firstname.text,
            lastName: _lastname.text,
            email: _email.text,
            activated: widget.data.activated,
            createdBy: widget.data.createdBy,
            createdDate: instantToDate(widget.data.createdDate),
            langKey: widget.data.langKey,
            imageUrl: "",
            authorities: ['"ROLE_USER"'],
            lastModifiedBy: _username.text,
            lastModifiedDate: DateTime.now()));
      } else {
        await createUser(User(
            login: _username.text,
            firstName: _firstname.text,
            lastName: _lastname.text,
            email: _email.text,
            imageUrl: "",
            activated: _activated,
            langKey: "en",
            authorities: ['"ROLE_USER"'],
            createdBy: "",
            createdDate: DateTime.now(),
            lastModifiedBy: "",
            lastModifiedDate: DateTime.now()));
      }
    } catch (e) {
      print("gk bisa imel");
    }
    Navigator.pop(context);
  }

  void _clearForm() {
    _username.clear();
    _firstname.clear();
    _lastname.clear();
    _email.clear();
  }
}
