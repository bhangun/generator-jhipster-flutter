import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:<%= appsName %>/modules/account/bloc/user/user_bloc.dart';
import 'package:<%= appsName %>/widgets/appbar_widget.dart';



class UserDetail extends StatefulWidget {
  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  UserBloc _userBloc;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _userBloc = Provider.of<UserBloc>(context);

    return Scaffold(
            appBar: buildAppBar(context, 'User Detail'),
            body: _userBloc.isItemEmpty
                ? Center(child: Text('User data are empty'))
                : userDetail(),
            floatingActionButton: FloatingActionButton(
              onPressed: () => _userBloc.update(),
              tooltip: 'Edit',
              child: Icon(Icons.edit),
            ));
  }

  userDetail() {
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 100.0),
          Icon(Icons.person, size: 100, color: Colors.blue[500]),
          Column(children: <Widget>[
            Text(_userBloc.itemDetail.firstName),
            Text(_userBloc.itemDetail.lastName),
            Text(_userBloc.itemDetail.email),
            Text(_userBloc.itemDetail.authorities.toString()),
            Text(_userBloc.itemDetail.lastModifiedDate.toString()),
            Text(_userBloc.itemDetail.createdDate.toString()),
          ])
        ]);
  }
}
