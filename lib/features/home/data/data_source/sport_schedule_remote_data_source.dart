import 'package:falcon_gym/constants.dart';
import 'package:falcon_gym/features/home/data/models/sport_schedule_model.dart';
import 'package:falcon_gym/features/home/domain/entities/sport_schedule_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class SportScheduleRemoteDataSource {
  Future<List<SportScheduleEntity>> fetchSportSchedule({required int sportId});
}

class SportScheduleRemoteDataSourceImpl
    implements SportScheduleRemoteDataSource {
  final supa = Supabase.instance.client;
  @override
  Future<List<SportScheduleEntity>> fetchSportSchedule({
    required int sportId,
  }) async {
    List<SportScheduleEntity> schedules = [];
    final response = await supa
        .from(kSupaScheduleSports)
        .select()
        .eq('sport_id', sportId);

    for (var element in response) {
      schedules.add(SportScheduleModel.fromJson(element));
    }
    return schedules;
  }
}
