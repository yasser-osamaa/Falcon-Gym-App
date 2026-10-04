part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthFailure extends AuthState {
  final String error;

  AuthFailure({required this.error});
}

final class AuthSuccess extends AuthState {
  final UserEntity? userEntity;

  AuthSuccess({this.userEntity});
}
