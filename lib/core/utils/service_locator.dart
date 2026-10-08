import 'package:falcon_gym/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:falcon_gym/features/auth/data/repos/auth_repo_impl.dart';
import 'package:falcon_gym/features/auth/domain/repos/auth_repo.dart';
import 'package:falcon_gym/features/gym/data/data_source/gym_remote_data_source.dart';
import 'package:falcon_gym/features/gym/data/repos/gym_repo_impl.dart';
import 'package:falcon_gym/features/gym/domain/repos/gym_repo.dart';
import 'package:falcon_gym/features/home/data/data_source/sport_schedule_remote_data_source.dart';
import 'package:falcon_gym/features/home/data/data_source/sports_remote_data_source.dart';
import 'package:falcon_gym/features/home/data/repos/sport_schedule_repo_impl.dart';
import 'package:falcon_gym/features/home/data/repos/sports_repo_impl.dart';
import 'package:falcon_gym/features/home/domain/repo/sports_repo.dart';
import 'package:falcon_gym/features/home/domain/repo/sports_schedule_repo.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setupLocator() {
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(authRemoteDataSource: AuthRemoteDataSourceImpl()),
  );

  getIt.registerSingleton<GymRepo>(
    GymRepoImpl(gymRemoteDataSource: GymRemoteDataSourceImpl()),
  );

  getIt.registerSingleton<SportsRepo>(
    SportsRepoImpl(sportsRemoteDataSource: SportsRemoteDataSourceImpl()),
  );

  getIt.registerSingleton<SportsScheduleRepo>(
    SportScheduleRepoImpl(
      scheduleRemoteDataSource: SportScheduleRemoteDataSourceImpl(),
    ),
  );
}
