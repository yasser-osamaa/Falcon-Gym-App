import 'package:falcon_gym/constants.dart';
import 'package:falcon_gym/features/home/data/models/sport_model.dart';
import 'package:falcon_gym/features/home/domain/entities/sport_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SportsRemoteDataSource {
  Future<List<SportEntity>> fetchSports();
  Future<SportEntity> fetchSportById({required int id});
}

class SportsRemoteDataSourceImpl implements SportsRemoteDataSource {
  final supa = Supabase.instance.client;
  @override
  Future<SportEntity> fetchSportById({required int id}) async {
    final response = await supa
        .from(kSupaSports)
        .select()
        .eq('id', id)
        .single();
    return SportModel.fromJson(response);
  }

  @override
  Future<List<SportEntity>> fetchSports() async {
    final response = await supa.from(kSupaSports).select();

    List<SportEntity> sports = [];
    for (var element in response) {
      sports.add(SportModel.fromJson(element));
    }
    return sports;
  }
}
