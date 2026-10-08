import 'package:dartz/dartz.dart';
import 'package:falcon_gym/core/errors/failure.dart';
import 'package:falcon_gym/features/home/domain/entities/sport_schedule_entity.dart';

abstract class SportsScheduleRepo {
  Future<Either<Failure, List<SportScheduleEntity>>> fetchSportSchedule({
    required int sportId,
  });
}
