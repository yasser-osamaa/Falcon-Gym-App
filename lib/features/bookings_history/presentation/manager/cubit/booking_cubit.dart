import 'package:falcon_gym/features/bookings_history/domain/entities/booking_entity.dart';
import 'package:falcon_gym/features/bookings_history/domain/repos/booking_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'booking_state.dart';

class BookingCubit extends Cubit<BookingState> {
  BookingCubit({required this.bookingRepo}) : super(BookingInitial());

  final BookingRepo bookingRepo;

  Future<void> getBookings({required String userId}) async {
    emit(BookingLoading());
    var response = await bookingRepo.getBookings(userId: userId);

    response.fold(
      (fail) {
        emit(BookingFailure(errText: fail.errorMessage));
      },
      (bookings) {
        emit(BookingSuccess(bookings: bookings));
      },
    );
  }

  Future<void> getBookedSlots({
    required int sportId,
    required String bookingDate,
  }) async {
    emit(BookingLoading());
    var response = await bookingRepo.getBookedSlots(
      sportId: sportId,
      bookingDate: bookingDate,
    );

    response.fold(
      (fail) {
        emit(BookingFailure(errText: fail.errorMessage));
      },
      (bookings) {
        emit(BookingSuccess(bookings: bookings));
      },
    );
  }

  Future<void> postBooking({
    required String userId,
    required int sportId,
    required String bookingDate,
    required String startTime,
    required String endTime,
  }) async {
    emit(BookingActionLoading());
    var response = await bookingRepo.postBookings(
      userId: userId,
      sportId: sportId,
      bookingDate: bookingDate,
      startTime: startTime,
      endTime: endTime,
    );

    response.fold(
      (fail) {
        emit(BookingActionFailure(errText: fail.errorMessage));
      },
      (_) {
        emit(BookingActionSuccess());
      },
    );
  }

  Future<void> cancelBooking({required String bookingId}) async {
    emit(BookingActionLoading());

    var response = await bookingRepo.cancelBookings(bookingId: bookingId);

    response.fold(
      (fail) {
        emit(BookingActionFailure(errText: fail.errorMessage));
      },
      (_) {
        emit(BookingActionSuccess());
      },
    );
  }
}
