import 'package:f_logs/f_logs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:<%= appsName %>/modules/account/services/user_routes.dart';
import 'package:<%= appsName %>/modules/account/store/user_store.dart';
import 'package:<%= appsName %>/services/navigation.dart';
import 'package:<%= appsName %>/widgets/alert_widget.dart';
import 'package:<%= appsName %>/widgets/bottom_bar_widget.dart';
import 'package:<%= appsName %>/widgets/global_methods.dart';
import '../../../widgets/appbar_widget.dart';
import '../../../widgets/progress_indicator_widget.dart';

class UserList extends StatefulWidget {

  @override
  _UserListState createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  //final _listKey = GlobalKey<ScaffoldState>();
  var _userStore = UserStore();

  @override
  void initState() {
    super.initState();
    FLog.info(text: '--------init---------');
    _userStore.getUserList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // key: _listKey,
      // cannot be used using this form $_userStore.totalUser
      appBar: AppBar(title: Text('User List ( ${_userStore.totalUser} )')),
      body: _buildBody(context),
      floatingActionButton: FloatingActionButton(
        //onPressed: NavigationServices.navigateTo(UserRoutes.userForm),
        onPressed: _userStore.add(context),
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: KutBotomBar(),
    );
  }

  _buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        _userStore.loading
            ? CustomProgressIndicatorWidget()
            : Material(child: _buildSlidelist(context)),
        _userStore.success
            ? Container()
            : showErrorMessage(context, _userStore.errorMessage),
        Observer(
            key: Key('dialog'),
            builder: (context) {
              return _userStore.isModified
                  ? KutAlert(
                      onOk: () => {},
                      onCancel: () => {},
                    )
                  : Container();
            }),
      ],
    );
  }

  _buildSlidelist(BuildContext context) {
    return !_userStore.islistEmpty
        ? ListView.separated(
            itemCount: 2, // _userStore.userList.length,
            separatorBuilder: (context, index) {
              return Divider();
            },
            itemBuilder: (context, index) {
              return Slidable(
                key: ValueKey(index),
                actionPane: SlidableDrawerActionPane(),
                actions: <Widget>[
                  IconSlideAction(
                    caption: 'Archive',
                    color: Colors.blue,
                    icon: Icons.archive,
                  ),
                  IconSlideAction(
                    caption: 'Share',
                    color: Colors.indigo,
                    icon: Icons.share,
                  ),
                ],
                secondaryActions: <Widget>[
                  IconSlideAction(
                    caption: 'More',
                    color: Colors.grey.shade200,
                    icon: Icons.more_horiz,
                  ),
                  IconSlideAction(
                    caption: 'Delete',
                    color: Colors.red,
                    icon: Icons.delete,
                    // onTap: ()=> _userStore.delete(_userStore.userList[index].login),
                  ),
                ],
                dismissal: SlidableDismissal(
                  child: SlidableDrawerDismissal(),
                ),
                child: ListTile(
                  leading: Icon(Icons.person),
                  /* title: Text('${_userStore.userList[index].id} - '+
                  '${_userStore.userList[index].login}',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                  style: Theme.of(context).textTheme.title,
                ),
                subtitle: Text(
                  '${_userStore.userList[index].email } ',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  softWrap: false,
                ), */
                  // onTap: ()=>_userStore.itemTapByLogin(_userStore.userList[index].login)
                ),
              );
            })
        : Center(child: Text('Data empty'));
  }
}
