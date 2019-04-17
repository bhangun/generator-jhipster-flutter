import 'package:meta/meta.dart';

abstract class UserEvent {}

class AppStarted extends UserEvent {}

class AuthorizeUser extends UserEvent {
  final String token;

  AuthorizeUser({@required this.token});
}

class DeauthorizeUser extends UserEvent {}