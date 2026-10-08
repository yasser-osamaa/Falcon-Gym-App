part of 'sports_cubit.dart';

sealed class SportsState {}

final class SportsInitial extends SportsState {}

final class SportsLoading extends SportsState {}

final class SportsSuccess extends SportsState {
  final List<SportEntity> sports;

  SportsSuccess({required this.sports});
}

final class SportsFailure extends SportsState {
  final String errorText;

  SportsFailure({required this.errorText});
}
