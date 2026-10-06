import 'package:dartz/dartz.dart';
import 'package:falcon_gym/core/errors/failure.dart';
import 'package:falcon_gym/core/errors/supabase_failure.dart';
import 'package:falcon_gym/features/gym/data/data_source/gym_remote_data_source.dart';
import 'package:falcon_gym/features/gym/domain/entities/gym_exercises_entity.dart';
import 'package:falcon_gym/features/gym/domain/repos/gym_repo.dart';

class GymRepoImpl implements GymRepo {
  final GymRemoteDataSource gymRemoteDataSource;

  GymRepoImpl({required this.gymRemoteDataSource});
  @override
  Future<Either<Failure, List<GymExercisesEntity>>> fetchExercises({
    required int categoryId,
  }) async {
    try {
      final response = await gymRemoteDataSource.fetchExercises(
        categoryId: categoryId,
      );
      return right(response);
    } catch (e) {
      return left(SupabaseFailure.fromException(e));
    }
  }
}
