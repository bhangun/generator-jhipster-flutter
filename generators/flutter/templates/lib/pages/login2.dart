import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/auth_bloc/auth.dart';


class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
 
 final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _rememberMe = false;

  @override
  Widget build(BuildContext context) {

AuthenticationBloc _authBloc = BlocProvider.of<AuthenticationBloc>(context);

    return Scaffold(
      body: BlocBuilder<AuthenticationEvent, AuthenticationState>(
      bloc: _authBloc,
      builder: (
        BuildContext context,
        AuthenticationState loginState,
      ) {

        if (loginState.token.isNotEmpty) {
          _authBloc.onLogin(token: loginState.token);
        }

        if (loginState.error.isNotEmpty) {
          _onWidgetDidBuild(() {
            Scaffold.of(context).showSnackBar(
              SnackBar(
                content: Text('${loginState.error}'),
                backgroundColor: Colors.red,
              ),
            );
          });
        }

        return _form(loginState, _authBloc);
      },
    )
    );
  }
@override
  void dispose() {
    super.dispose();
  }

  Widget _form(AuthenticationState loginState,AuthenticationBloc _authBloc) {
    return Form(
      child: Column(
        children: [
          SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                SvgPicture.asset('assets/logo-jhipster.svg', 
                width: MediaQuery.of(context).size.width/4,
                height: MediaQuery.of(context).size.height/4,),
                SizedBox(height: 16.0),
                Text('Flutter'),
              ],
            ),
          TextFormField(
            decoration: InputDecoration(labelText: 'username'),
            controller: _usernameController,
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'password'),
            controller: _passwordController,
            obscureText: true,
          ),
          Checkbox(
            value: _rememberMe,
            onChanged: (v)=>_rememberMe=v
          ),
          RaisedButton(
            onPressed: loginState.isLoginButtonEnabled ? _onLoginButtonPressed( _authBloc) : null,
            child: Text('Login'),
          ),
          Container(
            child: loginState.isLoading ? CircularProgressIndicator() : null,
          ),
        ],
      ),
    );
  }

  void _onWidgetDidBuild(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }

  _onLoginButtonPressed(AuthenticationBloc _authBloc) {
    _authBloc.onLoginButtonPressed(
      username: _usernameController.text,
      password: _passwordController.text,
      rememberMe: _rememberMe
    );
  }
}