import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'package:jh_flutter_provider/modules/account/bloc/user/user_bloc.dart';
import 'package:jh_flutter_provider/widgets/global_methods.dart';
import 'package:jh_flutter_provider/widgets/progress_indicator_widget.dart';
import '../models/user_model.dart';


class UserForm extends StatefulWidget {

  @override
  _UserFormState createState() => _UserFormState();
}

class _UserFormState extends State<UserForm> {

  final _username = TextEditingController();
  final _firstname = TextEditingController();
  final _lastname = TextEditingController();
  final _email = TextEditingController();

  UserBloc _userBloc;

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
      _userBloc = Provider.of<UserBloc>(context);

    _username.addListener(() {
      _userBloc.setUsername(_username.text);
    });

    _firstname.addListener(() {
      _userBloc.setFirstname(_firstname.text);
    });

    _lastname.addListener(() {
      _userBloc.setLastName(_lastname.text);
    });

    _email.addListener(() {
      _userBloc.setEmail(_email.text);
    });

    if (_userBloc.itemDetail != null) {
      User user = _userBloc.itemDetail;

      _username.text = user.login;
      _firstname.text = user.firstName;
      _lastname.text = user.lastName;
      _email.text = user.email;
    }

    return  Scaffold(
            appBar: AppBar(
              title: Text(_userBloc.formTitle),
            ),
            body: _buildBody(),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _userBloc.save(),
              tooltip: 'Add',
              child: Icon(Icons.save),
            ));
  }

  _buildBody() {
    return Stack(
      children: <Widget>[
        _userBloc.loading
            ? CustomProgressIndicatorWidget()
            : Material(child: _buildForm()),
        _userBloc.success
            ? Container()
            : showErrorMessage(context, '') //_errorBloc.errorMessage)
        ,
        //_userBloc.isModified ? KutAlert() : Container(),
      ],
    );
  }

  _buildForm() {
    return SafeArea(
        child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            children: _buildListChild()));
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
      CheckboxListTile(
          title: const Text('Activated'),
          value: true,
          onChanged: (bool newValue) => _userBloc.setActivated(_email.text)),
      FlatButton(child: Text('Profile'), onPressed: () {}),
    ];
  }
}
