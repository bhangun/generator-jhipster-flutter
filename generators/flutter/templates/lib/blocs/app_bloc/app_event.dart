import 'package:meta/meta.dart';

abstract class ApplicationEvent {}

class AppStarted extends ApplicationEvent {}

class AuthorizeUser extends ApplicationEvent {
  final String token;

  AuthorizeUser({@required this.token});
}

class DeauthorizeUser extends ApplicationEvent {}