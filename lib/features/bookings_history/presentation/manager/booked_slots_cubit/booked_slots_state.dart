part of 'booked_slots_cubit.dart';

sealed class BookedSlotsState {}

final class BookedSlotsInitial extends BookedSlotsState {}

final class BookedSlotsLoading extends BookedSlotsState {}

final class BookedSlotsSuccess extends BookedSlotsState {
  final List<BookingEntity> bookedList;

  BookedSlotsSuccess({required this.bookedList});
}

final class BookedSlotsFailure extends BookedSlotsState {
  final String errText;

  BookedSlotsFailure({required this.errText});
}
