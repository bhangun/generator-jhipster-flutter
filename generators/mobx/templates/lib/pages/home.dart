import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:kutilang_example/widgets/drawer_widget.dart';

import '../widgets/bottom_bar_widget.dart';
import '../widgets/appbar_widget.dart';

class HomeScreen extends StatefulWidget {
  @override
  _Homepagestate createState() => _Homepagestate();
}

class _Homepagestate extends State<HomeScreen> {
  final _homeKey = GlobalKey<ScaffoldState>();


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
    return Scaffold(
            key: _homeKey,
            appBar: KutAppBar(
              title: 'Home ',
              onLogout: () => test(),
            ),
            body: _buildBody(),
            drawer: KutDrawer(),
            bottomNavigationBar: KutBotomBar(),
          );
  
  }

  void test() {
    // context.read<AuthBloc>().add(LoggedOut());
    //NavigationServices.navigateTo(AppsRoutes.login);
  }

  _buildBody() {
    return Stack(
      children: <Widget>[
        Text('data')
        /*  Container(); //_authBloc.loggedIn
                
          },
        ),
        Observer(
          key: Key('error'),
          builder: (context) {
            return //_authBloc.success
                 Container();
                
          },
        ) */
      ],
    );
  }
}
