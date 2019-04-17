import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jh_flutter_sample/blocs/auth_bloc/auth.dart';
import 'package:jh_flutter_sample/blocs/user_bloc/user.dart';
import '../../../models/user.dart';

class UserDetail extends StatelessWidget{
  final int id;
  final String username;
  UserBloc _userBloc;
  UserDetail({@required this.id, @required this.username});

  @override
  Widget build(BuildContext context) {
    _userBloc = BlocProvider.of<UserBloc>(context);
    return BlocBuilder<UserEvent, UserState> (
      bloc: _userBloc,
      builder: (BuildContext context, UserState state) {
    
        return Scaffold(
                appBar: AppBar(
                  title: Text("User Detail"),
                  elevation: 5.0, // Removing the drop shadow cast by the app bar.
                ),
                body: 
                           Center(child: CircularProgressIndicator())
        );
      }
      );
          }

  Widget userDetail(User data) {

    return Column(
      children: <Widget>[
        Text(
            data.firstName
        ),
        Text(
            data.lastName
        ),
        Text(
            data.email
        ),
        Text(
            data.createdDate.toString()
        ),

      ],
    );
  }
}