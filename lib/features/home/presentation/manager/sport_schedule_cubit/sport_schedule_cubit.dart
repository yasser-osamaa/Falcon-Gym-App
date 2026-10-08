import 'package:falcon_gym/features/home/domain/entities/sport_schedule_entity.dart';
import 'package:falcon_gym/features/home/domain/repo/sports_schedule_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'sport_schedule_state.dart';

class SportScheduleCubit extends Cubit<SportScheduleState> {
  SportScheduleCubit({required this.scheduleRepo})
    : super(SportScheduleInitial());
  final SportsScheduleRepo scheduleRepo;
  Future<void> fetchSchedule({required int sportId}) async {
    emit(SportScheduleLoading());
    final schedules = await scheduleRepo.fetchSportSchedule(sportId: sportId);

    schedules.fold(
      (error) {
        emit(SportScheduleFailure(errText: error.errorMessage));
      },
      (schedules) {
        emit(SportScheduleSuccess(sportSchedule: schedules));
      },
    );
  }
}
