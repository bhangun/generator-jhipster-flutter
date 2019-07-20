import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

import 'package:<%= appsName %>/modules/account/bloc/user/user_bloc.dart';
import 'package:<%= appsName %>/widgets/appbar_widget.dart';
import 'package:<%= appsName %>/widgets/progress_indicator_widget.dart';

class UserList extends StatefulWidget {

  UserList({Key key}) : super(key: key);

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  final _listKey = GlobalKey<ScaffoldState>();
  var _userList;
  UserBloc _userBloc;

  @override
  void dispose() {
    //_userBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _userBloc = Provider.of<UserBloc>(context);

    _userBloc.getUserList();

    int _totalUser = _userBloc.totalItem;
    _userList = _userBloc.userList;

    return Scaffold(
        key: _listKey,
        // cannot be used using this form $_userBloc.totalUser
        appBar: buildAppBar(context, 'User List ( $_totalUser )'),
        body: _buildBody(context),
        floatingActionButton: FloatingActionButton(
          onPressed: _userBloc.add,
          tooltip: 'Add',
          child: Icon(Icons.add),
        ));
  }

  _buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        _userBloc.loading
            ? CustomProgressIndicatorWidget()
            : Material(child: _buildSlidelist(context)),
      ],
    );
  }

  _buildSlidelist(BuildContext context) {
    return !_userBloc.isListEmpty
        ? ListView.separated(
            itemCount: _userBloc.totalItem,
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              return Slidable(
                key: ValueKey(index),
                actionPane: SlidableDrawerActionPane(),
                actions: <Widget>[
                  IconSlideAction(
                    caption: 'Share',
                    color: Colors.indigo,
                    icon: Icons.share,
                  ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    onTap: () =>
                        _userBloc.delete(_userBloc.userList[index].login),
                  ),
                ],
                dismissal: SlidableDismissal(
                  child: SlidableDrawerDismissal(),
                ),
                child: ListTile(
                    leading: Icon(Icons.person),
                    title: Text(
                      '${_userList[index].login}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                      style: Theme.of(context).textTheme.title,
                    ),
                    subtitle: Text(
                      '${_userList[index].email} ', // ${_userBloc.itemDetail.email}',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: false,
                    ),
                    onTap: () => _userBloc.itemTap(index)),
              );
            })
        : Center(child: Text('Data empty'));
  }

  /*_showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Submitting form')));
  }*/
}
