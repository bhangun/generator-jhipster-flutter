import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../widgets/alert_widget.dart';
import '../bloc/user/index.dart';
import '../../../widgets/global_methods.dart';
import '../../../widgets/progress_indicator_widget.dart';
import '../models/user_model.dart';


class UserForm extends StatefulWidget {
  final User data;
  final bool isEdit = false;
  UserForm({this.data});
  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {
  bool _activated = false;
  final _username = TextEditingController();
  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _email = TextEditingController();

  final _userStore = UserStore();

@override
  void initState() {
    super.initState();

    _username.addListener(() {
      _userStore.setUsername(_username.text);
    });

    _firstname.addListener(() {
      _userStore.setFirstname(_firstname.text);
    });

    _lastname.addListener(() {
      _userStore.setLastname(_lastname.text);
    });

    _email.addListener(() {
      _userStore.setEmail(_email.text);
    });
  }

  @override
  void dispose() {
    _username.dispose();
    _firstname.dispose();
    _lastname.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.data != null) {
     // widget.isEdit = true;
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
        body: _buildBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: ()=> _userStore.save,
          tooltip: 'Add',
          child: Icon(Icons.save),
        ));
  }

  _buildBody() {
    return Stack(
      children: <Widget>[
        Observer(
          name: 'form',
          builder: (context) {
            return _userStore.loading
                ? CustomProgressIndicatorWidget()
                : Material(child: _buildForm());
          },
        ),
        Observer(
          name: 'error',
          builder: (context) {
            return _userStore.success
                ? Container()
                : showErrorMessage(context, _userStore.errorStore.errorMessage);
          },
        ),
        Observer(
          name: 'dialog',
          builder: (context) {
            return _userStore.isModified ? KutAlert():Container();
          }
        ),
      ],
    );
  }

  _buildForm(){
    return SafeArea(
                child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                children: _buildListChild())
          );
  }

  _buildListChild() {
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
          onChanged: (bool newValue) =>_userStore.setActivated(_email.text)
      ),
      RaisedButton(
          child: Text('Profile'),
          onPressed: () {}
      ),
    ];
  }
}
