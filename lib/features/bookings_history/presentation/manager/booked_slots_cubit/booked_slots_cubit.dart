import 'package:falcon_gym/features/bookings_history/domain/entities/booking_entity.dart';
import 'package:falcon_gym/features/bookings_history/domain/repos/booking_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'booked_slots_state.dart';

class BookedSlotsCubit extends Cubit<BookedSlotsState> {
  BookedSlotsCubit({required this.bookingRepo}) : super(BookedSlotsInitial());
  final BookingRepo bookingRepo;

  List<BookingEntity> bookedSlots = [];
  Future<void> getBookedSlots({
    required int sportId,
    required String bookingDate,
  }) async {
    emit(BookedSlotsLoading());
    final response = await bookingRepo.getBookedSlots(
      sportId: sportId,
      bookingDate: bookingDate,
    );

    response.fold(
      (fail) {
        emit(BookedSlotsFailure(errText: fail.errorMessage));
      },
      (bookings) {
        bookedSlots = bookings;
        emit(BookedSlotsSuccess(bookedList: bookings));
      },
    );
  }
}
