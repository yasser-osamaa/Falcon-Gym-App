import 'package:dartz/dartz.dart';
import 'package:falcon_gym/core/errors/failure.dart';
import 'package:falcon_gym/core/errors/supabase_failure.dart';
import 'package:falcon_gym/features/home/data/data_source/sport_schedule_remote_data_source.dart';
import 'package:falcon_gym/features/home/domain/entities/sport_schedule_entity.dart';
import 'package:falcon_gym/features/home/domain/repo/sports_schedule_repo.dart';

class SportScheduleRepoImpl implements SportsScheduleRepo {
  final SportScheduleRemoteDataSource scheduleRemoteDataSource;

  SportScheduleRepoImpl({required this.scheduleRemoteDataSource});
  @override
  Future<Either<Failure, List<SportScheduleEntity>>> fetchSportSchedule({
    required int sportId,
  }) async {
    try {
      final data = await scheduleRemoteDataSource.fetchSportSchedule(
        sportId: sportId,
      );
      return right(data);
    } catch (e) {
      return left(SupabaseFailure.fromException(e));
    }
  }
}
