part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

class AuthSuccess extends AuthState {
  final String uid;

  AuthSuccess({required this.uid});
}

class AuthError extends AuthState {
  final String errorMsg;

  AuthError({required this.errorMsg});
}

class AuthLoading extends AuthState {}
