part of 'gym_exercises_cubit.dart';

sealed class GymExercisesState {}

final class GymExercisesInitial extends GymExercisesState {}

final class GymExercisesLoading extends GymExercisesState {}

final class GymExercisesFailure extends GymExercisesState {
  final String errorText;

  GymExercisesFailure({required this.errorText});
}

final class GymExercisesSuccess extends GymExercisesState {
  final List<GymExercisesEntity> gymExercises;

  GymExercisesSuccess({required this.gymExercises});
}
