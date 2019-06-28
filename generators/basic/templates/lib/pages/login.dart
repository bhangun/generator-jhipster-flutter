import 'package:flutter/material.dart';
import '../administration/account.dart';
import '../services/common.dart' as auth;
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/logo_anim.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  final String _token = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 200.0),
            Column(
              children: <Widget>[
                // SvgPicture.asset('assets/images/logo-jhipster.svg'),
                DecoratedBox(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:  AssetImage('assets/images/logo-jhipster.png'),
                      ),
                    ),
                  )
              ],
            ),
            SizedBox(height: 50.0),
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 12.0),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(
                filled: true,
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('Cancel'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                ),
                FlatButton(
                  child: Text('Login'),
                  onPressed: () {
                    try {
                      auth
                          .login(_usernameController.text,
                              _passwordController.text, false)
                          .then((bool v) {
                        if (v) {
                          _usernameController.clear();
                          _passwordController.clear();
                          Navigator.pop(context);
                        } else
                          Navigator.of(context).pop();
                      });
                    } catch (e) {
                      Navigator.of(context).pop();
                    }
                  },
                ),
              ],
            ),
            FlatButton(
              child: Text('Forgot Password?'),
              onPressed: () {

              },
            ),
          ],
        ),
      ),
    );
  }
}
