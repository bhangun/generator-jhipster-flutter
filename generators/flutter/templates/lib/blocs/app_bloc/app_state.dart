import 'package:jh_flutter_sample/models/user.dart';
import 'package:meta/meta.dart';

class ApplicationState {
  final bool isInitializing;
  final bool isLoading;
  final bool isAuthenticated;
  final User authorizedUser;
  final List<dynamic> roles;

  const ApplicationState({
    @required this.isInitializing,
    @required this.isLoading,
    @required this.isAuthenticated,
    this.authorizedUser,
    this.roles
  });

  factory ApplicationState.initializing() {
    return ApplicationState(
      isInitializing: true,
      isAuthenticated: false,
      isLoading: false,
    );
  }

  factory ApplicationState.authorizedUser(User user) {
    return ApplicationState(
      isInitializing: false,
      isAuthenticated: true,
      isLoading: false,
      authorizedUser: user,
      roles: user.authorities
    );
  }
  ApplicationState copyWith({
    bool isInitializing,
    bool isAuthenticated,
    bool isLoading,
    User authorizedUser,
    List<dynamic> roles,
  }) {
    return ApplicationState(
      isInitializing: isInitializing ?? this.isInitializing,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      authorizedUser: authorizedUser ?? this.authorizedUser,
      roles: roles ?? this.roles
    );
  }


@override
  bool operator ==( Object other) =>
      identical( this, other) ||
      other is ApplicationState &&
          runtimeType == other.runtimeType &&
          isInitializing == other.isInitializing &&
          isAuthenticated == other.isAuthenticated  &&
          authorizedUser == other.authorizedUser &&
          roles == other.roles;

@override
  int get hashCode =>
      isInitializing.hashCode ^ isAuthenticated.hashCode ^
      authorizedUser.hashCode ^ roles.hashCode;

  @override
  String toString() =>
      'ApplicationState { isInitializing: $isInitializing, isLoading: $isLoading, '+
      'isAuthenticated: $isAuthenticated }';

  
}