part of 'sport_schedule_cubit.dart';

sealed class SportScheduleState {}

final class SportScheduleInitial extends SportScheduleState {}

final class SportScheduleSuccess extends SportScheduleState {
  final List<SportScheduleEntity> sportSchedule;

  SportScheduleSuccess({required this.sportSchedule});
}

final class SportScheduleFailure extends SportScheduleState {
  final String errText;

  SportScheduleFailure({required this.errText});
}

final class SportScheduleLoading extends SportScheduleState {}
