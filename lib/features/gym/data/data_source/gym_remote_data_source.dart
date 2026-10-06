import 'package:falcon_gym/constants.dart';
import 'package:falcon_gym/features/gym/data/model/gym_model.dart';
import 'package:falcon_gym/features/gym/domain/entities/gym_exercises_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class GymRemoteDataSource {
  Future<List<GymExercisesEntity>> fetchExercises({required int categoryId});
}

class GymRemoteDataSourceImpl implements GymRemoteDataSource {
  final supabase = Supabase.instance.client.from(kSupaExercieses);

  @override
  Future<List<GymExercisesEntity>> fetchExercises({
    required int categoryId,
  }) async {
    final data = await supabase.select().eq('category_id', categoryId);

    List<GymExercisesEntity> gymExercises = parseGymExercises(data);

    return gymExercises;
  }

  List<GymExercisesEntity> parseGymExercises(PostgrestList data) {
    List<GymExercisesEntity> gymExercises = [];

    for (var element in data) {
      gymExercises.add(GymModel.fromJson(element));
    }
    return gymExercises;
  }
}
