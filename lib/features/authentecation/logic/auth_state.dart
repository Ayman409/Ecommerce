// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthUserAuthenticatedSuccessfullyState extends AuthState {}

class AuthUserIsNotAuthenticatedState extends AuthState {}
class ObsecureChangedState extends AuthState {}

class AuthUserFailedToAuthenticateState extends AuthState {
  final String failMsg;
  AuthUserFailedToAuthenticateState({
    required this.failMsg,
  });
}

class SignUpSuccessfullyState extends AuthState {}

class SignUpFailedState extends AuthState {
  final String failMsg;
  SignUpFailedState({
    required this.failMsg,
  });
}
