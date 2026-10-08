import 'package:dartz/dartz.dart';
import 'package:falcon_gym/core/errors/failure.dart';
import 'package:falcon_gym/core/errors/supabase_failure.dart';
import 'package:falcon_gym/features/home/data/data_source/sports_remote_data_source.dart';
import 'package:falcon_gym/features/home/domain/entities/sport_entity.dart';
import 'package:falcon_gym/features/home/domain/repo/sports_repo.dart';

class SportsRepoImpl implements SportsRepo {
  final SportsRemoteDataSource sportsRemoteDataSource;

  SportsRepoImpl({required this.sportsRemoteDataSource});
  @override
  Future<Either<Failure, SportEntity>> fetchSportById({required int id}) async {
    try {
      final data = await sportsRemoteDataSource.fetchSportById(id: id);
      return right(data);
    } catch (e) {
      return left(SupabaseFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, List<SportEntity>>> fetchSports() async {
    try {
      final data = await sportsRemoteDataSource.fetchSports();
      return right(data);
    } catch (e) {
      return left(SupabaseFailure.fromException(e));
    }
  }
}
