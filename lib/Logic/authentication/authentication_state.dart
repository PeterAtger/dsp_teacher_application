part of 'authentication_cubit.dart';

class AuthenticationState {
  Map<String, dynamic> data;
  int code;
  bool isSignIn = false;
  AuthenticationState({this.data, this.code, this.isSignIn});
}
