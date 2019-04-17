import 'package:jh_flutter_sample/models/user.dart';
import 'package:meta/meta.dart';

class UserState {
  final bool isInitializing;
  final bool isLoading;
  final bool isAuthenticated;
  final User authorizedUser;
  final List<dynamic> roles;

  const UserState({
    @required this.isInitializing,
    @required this.isLoading,
    @required this.isAuthenticated,
    this.authorizedUser,
    this.roles
  });

  factory UserState.initializing() {
    return UserState(
      isInitializing: true,
      isAuthenticated: false,
      isLoading: false,
    );
  }

  factory UserState.authorizedUser(User user) {
    return UserState(
      isInitializing: false,
      isAuthenticated: true,
      isLoading: false,
      authorizedUser: user,
      roles: user.authorities
    );
  }
  UserState copyWith({
    bool isInitializing,
    bool isAuthenticated,
    bool isLoading,
    User authorizedUser,
    List<dynamic> roles,
  }) {
    return UserState(
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
      other is UserState &&
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
      'UserState { isInitializing: $isInitializing, isLoading: $isLoading, '+
      'isAuthenticated: $isAuthenticated }';

  
}