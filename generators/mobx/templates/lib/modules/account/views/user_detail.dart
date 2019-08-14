import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:<%= appsName %>/widgets/appbar_widget.dart';
import '../bloc/user_bloc.dart';

class UserDetail extends StatefulWidget {
  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  //User data;
  final _userBloc = UserStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, 'User Detail >>${_userBloc.isItemEmpty}'),//${_userBloc.itemDetail.firstName}'),
        body:  /* Observer(
          name: 'userdetail',
          builder: (context) {
            return  */_userBloc.isItemEmpty?
            Center(child: Text('User data are empty >> ${_userBloc.position}')):
             userDetail(context)/* ;
            }
        ) */,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            /* Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => UserForm(data: data))); */
          },
          tooltip: 'Add',
          child: Icon(Icons.edit),
        ));
  }

  userDetail(BuildContext context) {

    //print(_userBloc.itemDetail.email);
    return Observer(
          name: 'userdetail',
          builder: (context) {
            return 
    ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 100.0),
          Icon(Icons.person, size: 100, color: Colors.blue[500]),
         Column(
              children: <Widget>[
                Text('${_userBloc.itemDetail }'),
                Text('${_userBloc.itemDetail.firstName}'),
                Text(_userBloc.itemDetail.lastName),
                Text(_userBloc.itemDetail.email),
                Text(_userBloc.itemDetail.authorities.toString()),
                Text(_userBloc.itemDetail.lastModifiedDate.toString()),
                Text(_userBloc.itemDetail.createdDate.toString()),
              ])
        ]);
          });
  }
}
