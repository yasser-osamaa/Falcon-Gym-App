import 'package:falcon_gym/features/gym/domain/entities/gym_exercises_entity.dart';
import 'package:falcon_gym/features/gym/domain/repos/gym_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'gym_exercises_state.dart';

class GymExercisesCubit extends Cubit<GymExercisesState> {
  GymExercisesCubit({required this.gymRepo}) : super(GymExercisesInitial());
  final GymRepo gymRepo;

  Future<void> fetchExercises({required int categoryId}) async {
    emit(GymExercisesLoading());
    final data = await gymRepo.fetchExercises(categoryId: categoryId);
    data.fold(
      (err) {
        emit(GymExercisesFailure(errorText: err.error));
      },
      (list) {
        emit(GymExercisesSuccess(gymExercises: list));
      },
    );
  }
}
