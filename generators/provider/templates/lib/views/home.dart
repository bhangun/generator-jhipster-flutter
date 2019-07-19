import 'package:flutter/material.dart';
import 'package:jh_flutter_provider/bloc/authentication/index.dart';
import 'package:provider/provider.dart';
import '../bloc/app/index.dart';
import '../modules/account/bloc/user/index.dart';
import '../widgets/appbar_widget.dart';
import '../widgets/drawer_widget.dart';
import '../widgets/global_methods.dart';
import '../widgets/progress_indicator_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _homeKey = GlobalKey<ScaffoldState>();

  AppBloc _appBloc;
  AuthenticationBloc _authBloc;
  UserBloc _userBloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _appBloc = Provider.of<AppBloc>(context);
    _authBloc = Provider.of<AuthenticationBloc>(context);
    _userBloc = Provider.of<UserBloc>(context);

    _userBloc.getProfile();

    return Scaffold(
      key: _homeKey,
      appBar: buildAppBar(context, 'Home'),
      body: _buildBody(),
      drawer: CommonDrawer(),

    );
  }

  _buildBody() {
    return Stack(
      children: <Widget>[
        !_authBloc.loggedIn
            ? CustomProgressIndicatorWidget()
            : Material(
                child: SafeArea(
                    child: ListView(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        children: <Widget>[

                  ]))),
        _authBloc.showError
            ? showErrorMessage(context, _appBloc.errorMessage):Container()
      ],
    );
  }
}
