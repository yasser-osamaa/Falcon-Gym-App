import 'package:dartz/dartz.dart';
import 'package:falcon_gym/core/errors/failure.dart';
import 'package:falcon_gym/features/home/domain/entities/sport_entity.dart';

abstract class SportsRepo {
  Future<Either<Failure, List<SportEntity>>> fetchSports();

  Future<Either<Failure, SportEntity>> fetchSportById({required int id});
}
