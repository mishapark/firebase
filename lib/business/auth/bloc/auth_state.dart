part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class UserStreamOn extends AuthState {
  final Stream<User?> stream;

  UserStreamOn(this.stream);
}

class AuthInitial extends AuthState {}

class Loading extends AuthState {}

class Authenticated extends AuthState {}

class UnAuthenticated extends AuthState {}

class AuthError extends AuthState {
  final String error;

  AuthError(this.error);
}
