import 'package:falcon_gym/features/gym/domain/entities/gym_exercises_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gym_exercises_state.dart';

class GymExercisesCubit extends Cubit<GymExercisesState> {
  GymExercisesCubit() : super(GymExercisesInitial());
}
