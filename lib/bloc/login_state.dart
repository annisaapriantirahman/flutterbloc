part of 'login_bloc.dart';

sealed class LoginState {}

final class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {
  final String sessionToken;

  LoginSuccess([required this.sessionToken]);
}

class LoginFailure extends LoginState{
  final String error;

  LoginFailure([required this.error]);
}
