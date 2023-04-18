part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class GoogleSignInRequested extends AuthEvent {}

class Logout extends AuthEvent {}

class GetUsers extends AuthEvent {}
