import 'package:flutter/material.dart';


class UserDetail extends StatefulWidget {
  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        /* appBar: KutAppBar(
          title:
              'User Detail >>${_userBloc.isItemEmpty}'), 
      body: _userBloc.isItemEmpty
                ? Center(
                    child: Text('User data are empty >> ${_userBloc.currentPosition}'))
                : userDetail(context)
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // _userBloc.edit()
        },
        tooltip: 'Add',
        child: Icon(Icons.edit),
      ),
      bottomNavigationBar: KutBotomBar(), */
        );
  }

  userDetail(BuildContext context) {
    return ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 100.0),
          Icon(Icons.person, size: 100, color: Colors.blue[500]),
          /*  Column(children: <Widget>[
                  Text('${_userBloc.itemDetail}'),
                  Text('${_userBloc.itemDetail.firstName}'),
                 // Text(_userBloc.itemDetail.lastName),
                  //Text(_userBloc.itemDetail.email),
                  Text(_userBloc.itemDetail.authorities.toString()),
                  Text(_userBloc.itemDetail.lastModifiedDate.toString()),
                  Text(_userBloc.itemDetail.createdDate.toString()),
                ]) */
        ]);
  }
}
