import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:<%= appsName %>/bloc/app/app_bloc.dart';
import 'package:<%= appsName %>/bloc/authentication/authentication_bloc.dart';
import 'package:<%= appsName %>/modules/account/bloc/user_bloc.dart';

import '../widgets/rounded_button_widget.dart';

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
  //store
  final AuthenticationStore _authBloc = AuthenticationStore();
 
  //final _homeStore = HomeStore();
  final _appBloc = AppStore();


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeKey,
      appBar: buildAppBar(context,'Home'),
      body: _buildBody(),
      drawer:  
             CommonDrawer(),
      bottomNavigationBar: BottomAppBar(child: Text('kkk'),),
    );
  }

   _buildBody() {
    return Stack(
      children: <Widget>[
        Observer(
          name: 'body',
          builder: (context) {
            return _authBloc.loggedIn
                ? CustomProgressIndicatorWidget()
                : Material(child: SafeArea(
                child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                children: <Widget>[
                  RoundedButtonWidget(
                buttonText: 'Light',
                buttonColor:  Theme.of(context).buttonColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: () => _appBloc.switchToLight()
              ),
              RoundedButtonWidget(
                buttonText: 'Dark',
                buttonColor:  Theme.of(context).buttonColor,
                textColor: Theme.of(context).textTheme.button.color,   
                onPressed: ()=>_appBloc.switchToDark()
              ),
                ]
                )
                 ));
          },
        ),
        Observer(
          name: 'error',
          builder: (context) {
            return _authBloc.success
                ? Container()
                : showErrorMessage(context, _appBloc.errorMessage);
          },
        )
      ],
    );
  }
}