import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../stores/app/app_store.dart';
import '../widgets/rounded_button_widget.dart';
import '../modules/account/stores/authentication/authentication_store.dart';
import '../modules/account/stores/user/user_store.dart';
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
  final AuthenticationStore __authStore = AuthenticationStore();
  final UserStore _userStore = UserStore();
  //final _homeStore = HomeStore();
  final _appStore = AppStore();



  @override
  void initState() {
    super.initState();

    //get profile
     _userStore.getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _homeKey,
      appBar: buildAppBar(context,'Home'),
      body: _buildBody(),
      drawer:  Observer(
          builder: (context) {
            return CommonDrawer(
        accountName: _userStore.userProfile.firstName, 
        accountEmail: _userStore.userProfile.email );
      })
    );
  }

   _buildBody() {
    return Stack(
      children: <Widget>[
        Observer(
          name: 'body',
          builder: (context) {
            return __authStore.loggedIn
                ? CustomProgressIndicatorWidget()
                : Material(child: SafeArea(
                child: ListView(
                padding: EdgeInsets.symmetric(horizontal: 24.0),
                children: <Widget>[
                  RoundedButtonWidget(
                buttonText: 'Light',
                buttonColor:  Theme.of(context).buttonColor,
                textColor: Theme.of(context).textTheme.button.color,
                onPressed: () => _appStore.switchToLight()
              ),
              RoundedButtonWidget(
                buttonText: 'Dark',
                buttonColor:  Theme.of(context).buttonColor,
                textColor: Theme.of(context).textTheme.button.color,   
                onPressed: ()=>_appStore.switchToDark()
              ),
                ]
                )
                 ));
          },
        ),
        Observer(
          name: 'error',
          builder: (context) {
            return __authStore.success
                ? Container()
                : showErrorMessage(context, __authStore.errorStore.errorMessage);
          },
        )
      ],
    );
  }


}