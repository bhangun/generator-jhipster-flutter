import 'package:meta/meta.dart';

class AuthenticationState {
  final bool isInitializing;
  final bool isLoading;
  final bool isAuthenticated;
  final bool isLoginButtonEnabled;
  final bool rememberMe;
  final String status;
  final String error;
  final String token;

  const AuthenticationState({
    @required this.isInitializing,
    @required this.isLoading,
    @required this.isAuthenticated,
     @required this.isLoginButtonEnabled,
     @required this.rememberMe,
   @required this.status,
   @required this.error,
   @required this.token
  });

  factory AuthenticationState.initializing() {
    return AuthenticationState(
      isInitializing: true,
      isAuthenticated: false,
      isLoading: false,
      isLoginButtonEnabled: true,
      rememberMe: false,
      status: "initializing",
      error: "",
      token: ""
    );
  }

  factory AuthenticationState.authenticated() {
    return AuthenticationState(
      isInitializing: false,
      isAuthenticated: true,
      isLoading: false,
      isLoginButtonEnabled: false,
      rememberMe: false,
      status: "authenticated",
      error: "",
      token: ""
    );
  }

  factory AuthenticationState.unauthenticated() {
    return AuthenticationState(
      isInitializing: false,
      isAuthenticated: false,
      isLoading: false,
      isLoginButtonEnabled: true,
      rememberMe: false,
      status: 'authenticated',
      error: '',
      token: ''
    );
  }

  factory AuthenticationState.initial() {
    return AuthenticationState(
      isInitializing: true,
      isAuthenticated: false,
      isLoading: false,
      isLoginButtonEnabled: true,
      rememberMe: false,
      status: 'Initial',
      error: '',
      token: '',
    );
  }

  factory AuthenticationState.loading() {
    return AuthenticationState(
      isInitializing: false,
      isAuthenticated: false,
      isLoading: true,
      isLoginButtonEnabled: false,
      rememberMe: false,
      status: 'Loading',
      error: '',
      token: '',
    );
  }

  factory AuthenticationState.failure(String error) {
    return AuthenticationState(
      isInitializing: false,
      isAuthenticated: false,
      isLoading: false,
      isLoginButtonEnabled: true,
      rememberMe: false,
      status: 'Failure',
      error: error,
      token: '',
    );
  }

  factory AuthenticationState.success(String token) {
    return AuthenticationState(
      isInitializing: false,
      isAuthenticated: false,
      isLoading: false,
      isLoginButtonEnabled: false,
      rememberMe: false,
      status: 'Success',
      error: '',
      token: token,
    );
  }

  AuthenticationState copyWith({
    bool isInitializing,
    bool isAuthenticated,
    bool isLoading,
    bool isLoginButtonEnabled,
    bool rememberMe,
    String  status,
    String  error,
    String  token
  }) {
    return AuthenticationState(
      isInitializing: isInitializing ?? this.isInitializing,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
      isLoading: isLoading ?? this.isLoading,
      isLoginButtonEnabled: isLoginButtonEnabled ?? this.isLoginButtonEnabled,
      rememberMe: rememberMe ?? this.rememberMe,
      status: status ?? this.status,
      error: error ?? this.error,
      token: token ?? this.token
    );
  }

  @override
  bool operator ==( Object other) =>
      identical( this, other) ||
      other is AuthenticationState &&
          runtimeType == other.runtimeType &&
          isInitializing == other.isInitializing &&
          isAuthenticated == other.isAuthenticated &&
          isLoading == other.isLoading &&
          isLoginButtonEnabled == isLoginButtonEnabled &&
          rememberMe == rememberMe &&
          status == status &&
          error == error &&
          token == token;

  @override
  int get hashCode =>
      isInitializing.hashCode ^ isAuthenticated.hashCode ^ isLoading.hashCode ^ 
      isLoginButtonEnabled.hashCode ^ rememberMe.hashCode ^ status.hashCode ^ 
      error.hashCode ^ token.hashCode;

  @override
  String toString() =>
      'AuthenticationState { isInitializing: $isInitializing,'+
      'isLoading: $isLoading, '+
      'isAuthenticated: $isAuthenticated, '+
      'isLoginButtonEnabled: $isLoginButtonEnabled, '+
      'rememberMe: $rememberMe,'+
      'status: $status, '+
      'error: $error, '+
      'token: $token}';
}