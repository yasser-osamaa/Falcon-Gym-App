import 'package:falcon_gym/features/home/domain/entities/sport_entity.dart';
import 'package:falcon_gym/features/home/domain/repo/sports_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sports_state.dart';

class SportsCubit extends Cubit<SportsState> {
  SportsCubit({required this.sportsRepo}) : super(SportsInitial());
  final SportsRepo sportsRepo;

  Future<void> getSports() async {
    emit(SportsLoading());
    final sports = await sportsRepo.fetchSports();
    sports.fold(
      (error) {
        emit(SportsFailure(errorText: error.errorMessage));
      },
      (listSports) {
        emit(SportsSuccess(sports: listSports));
      },
    );
  }
}
