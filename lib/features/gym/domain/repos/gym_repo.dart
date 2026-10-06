import 'package:dartz/dartz.dart';
import 'package:falcon_gym/core/errors/failure.dart';
import 'package:falcon_gym/features/gym/domain/entities/gym_exercises_entity.dart';

abstract class GymRepo {
  Future<Either<Failure, List<GymExercisesEntity>>> fetchExercises({
    required int categoryId,
  });
}
