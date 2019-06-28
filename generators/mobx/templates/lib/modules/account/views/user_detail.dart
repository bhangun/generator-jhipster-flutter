import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:jh_flutter_mobx/widgets/appbar_widget.dart';
import '../stores/user/user_store.dart';

class UserDetail extends StatefulWidget {
  @override
  _UserDetailState createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  //User data;
  final _userStore = UserStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context, 'User Detail '),//${_userStore.itemDetail.firstName}'),
        body:  Observer(
          name: 'userdetail',
          builder: (context) {
            return _userStore.isItemEmpty?
            Center(child: Text('User data are empty >> ${_userStore.userList}')):
             userDetail();
            }
        ),
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

  userDetail() {

    //print(_userStore.itemDetail.email);
    return 
    ListView(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        children: <Widget>[
          SizedBox(height: 100.0),
          Icon(Icons.person, size: 100, color: Colors.blue[500]),
         Column(
              children: <Widget>[
                Text('${_userStore.itemDetail }'),
                Text('${_userStore.itemDetail.firstName}'),
                Text(_userStore.itemDetail.lastName),
                Text(_userStore.itemDetail.email),
                Text(_userStore.itemDetail.authorities.toString()),
                Text(_userStore.itemDetail.lastModifiedDate.toString()),
                Text(_userStore.itemDetail.createdDate.toString()),
              ])
        ]);
  }
}
