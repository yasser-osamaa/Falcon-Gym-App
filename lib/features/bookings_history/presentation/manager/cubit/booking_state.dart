part of 'booking_cubit.dart';

sealed class BookingState {}

final class BookingInitial extends BookingState {}

final class BookingLoading extends BookingState {}

final class BookingSuccess extends BookingState {
  final List<BookingEntity> bookings;

  BookingSuccess({required this.bookings});
}

final class BookingFailure extends BookingState {
  final String errText;

  BookingFailure({required this.errText});
}

final class BookingActionLoading extends BookingState {}

final class BookingActionSuccess extends BookingState {}

final class BookingActionFailure extends BookingState {
  final String errText;

  BookingActionFailure({required this.errText});
}
