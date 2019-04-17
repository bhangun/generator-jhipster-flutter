import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jh_flutter_sample/services/services.dart';
import 'blocs/app_bloc/app.dart';
import 'blocs/auth_bloc/auth.dart';
import 'pages/login.dart';
import 'package:jh_flutter_sample/pages/home.dart';
import 'package:jh_flutter_sample/pages/splash.dart';


void main() { 
  runApp(
    BlocProvider<ApplicationBloc>(
      bloc: ApplicationBloc(),
      child: new App()
    )
  );
  }


class App extends StatefulWidget {

  @override
  State<App> createState() => AppState();
}

class AppState extends State<App> {
  final ApplicationBloc _appBloc = ApplicationBloc();
  final AuthenticationBloc _authBloc = AuthenticationBloc();

  AppState() {
  
    _authBloc.checkAuthentication();
  }

  @override
  void dispose() {
    _appBloc.dispose();
    _authBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationBloc>(
          bloc: _authBloc,
          child: MaterialApp(
            home: _rootPage(),
        routes: routes,
          )
    );
  }

  Widget _rootPage() {
    return BlocBuilder<AuthenticationEvent, AuthenticationState>(
      bloc: _authBloc,
      builder: (BuildContext context, AuthenticationState state) {
print(state.toString());

        List<Widget> widgets = [];
        
        if (state.isInitializing) {
          widgets.add(SplashPage());
        }

        if (state.isAuthenticated) {
          widgets.add(HomePage());
        } else {
          widgets.add(LoginPage());
        }

        if (state.isLoading) {
          widgets.add(_loadingIndicator());
        }

        return Stack(
          children: widgets,
        );
      },
    );
  }

  Widget _loadingIndicator() {
    return Stack(
      children: <Widget>[
        Opacity(
          opacity: 0.3,
          child: ModalBarrier(dismissible: false, color: Colors.grey),
        ),
        Center(
          child: CircularProgressIndicator(),
        ),
      ],
    );
  }
}
