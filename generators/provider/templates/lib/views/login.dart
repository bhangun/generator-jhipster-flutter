import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:<%= appsName %>/bloc/authentication/authentication_bloc.dart';
import 'package:<%= appsName %>/generated/i18n.dart';
import 'package:<%= appsName %>/utils/strings.dart';
import 'package:<%= appsName %>/widgets/app_icon_widget.dart';
import 'package:<%= appsName %>/widgets/global_methods.dart';
import 'package:<%= appsName %>/widgets/progress_indicator_widget.dart';
import 'package:<%= appsName %>/widgets/rounded_button_widget.dart';
import 'package:<%= appsName %>/widgets/textfield_widget.dart';


class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  //text controllers
  TextEditingController _userEmailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  AuthenticationBloc _authBloc;

  //focus node
  FocusNode _passwordFocusNode;

  //form key
 final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    super.initState();
    _passwordFocusNode = FocusNode();
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _userEmailController.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
      _authBloc = Provider.of<AuthenticationBloc>(context);

    _userEmailController.addListener(() {
      //this will be called whenever user types in some value
      _authBloc.setUserId(_userEmailController.text);
    });
    _passwordController.addListener(() {
      //this will be called whenever user types in some value
      _authBloc.setPassword(_passwordController.text);
    }); 

    return  Scaffold(
      primary: true,
      body: _buildBody(context),
    );
  }

  Material _buildBody(BuildContext context) {
    return Material(
      child: Stack(
        children: <Widget>[
          OrientationBuilder(
            builder: (context, orientation) {
              //variable to hold widget
              var child;

              //check to see whether device is in landscape or portrait
              //load widgets based on device orientation
              orientation == Orientation.landscape
                  ? child = Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: _buildLeftSide(),
                        ),
                        Expanded(
                          flex: 1,
                          child: _buildRightSide(context),
                        ),
                      ],
                    )
                  : child = Center(child: _buildRightSide( context));
              return child;
            },
          ),
           Visibility(
                visible: _authBloc.loading,
                child: CustomProgressIndicatorWidget(),
          ),
          _authBloc.showError
              ? showErrorMessage(context, _authBloc.errorMessage):Container()
        ],
      ),
    );
  }

  Widget _buildLeftSide() {
    return SizedBox.expand(
      child: Image.asset(Strings.login_image,
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildRightSide(BuildContext context) {
    return Form(
     key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              AppIconWidget(image: Strings.app_icon),
              SizedBox(height: 24.0),
              _buildUserIdField(),
              _buildPasswordField(),
              _buildForgotPasswordButton(),
              _buildSignInButton(context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildUserIdField() {
    return TextFieldWidget(
          key: Key('user_id'),
          hint:  S.of(context).email,
          inputType: TextInputType.emailAddress,
          icon: Icons.person,
          iconColor: Colors.black54,
          textController: _userEmailController,
          inputAction: TextInputAction.next,
          onFieldSubmitted: (value) {
            FocusScope.of(context).requestFocus(_passwordFocusNode);
          },
          errorText: _authBloc.userMessage,
        );
  }

  Widget _buildPasswordField() {
    return  TextFieldWidget(
          key: Key('user_password'),
          hint: S.of(context).password,
          isObscure: true,
          padding: EdgeInsets.only(top: 16.0),
          icon: Icons.lock,
          iconColor: Colors.black54,
          textController: _passwordController,
          focusNode: _passwordFocusNode,
          errorText: _authBloc.passwordMessage,
        );
  }

  Widget _buildForgotPasswordButton() {
    return Align(
      alignment: FractionalOffset.centerRight,
      child: FlatButton(
        key: Key('user_forgot_password'),
        padding: EdgeInsets.all(0.0),
        child: Text(
          S.of(context).forgot_password,
          style: Theme.of(context)
              .textTheme
              .caption
              .copyWith(color: Colors.orangeAccent),
        ),
        onPressed: () {},
      ),
    );
  }

  Widget _buildSignInButton(BuildContext context) {
    return RoundedButtonWidget(
      key: Key('user_sign_button'),
      buttonText: S.of(context).sign_in,//Strings.login_btn_sign_in,
      buttonColor:  Theme.of(context).buttonColor,
      textColor: Theme.of(context).textTheme.button.color,
      onPressed: ()=>
          _authBloc.login(_userEmailController.text,_passwordController.text)
            //:showErrorMessage(context , S.of(context).please_fill_field)
    );
  }
}