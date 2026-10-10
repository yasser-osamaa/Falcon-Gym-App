import 'package:falcon_gym/features/bookings_history/domain/entities/booking_entity.dart';

List<BookingEntity> filterBookings(
  List<BookingEntity> bookings, {
  required bool upcoming,
}) {
  final now = DateTime.now();

  final filteredBookings = bookings.where((booking) {
    final bookingDateTime = DateTime(
      booking.bookingDate.year,
      booking.bookingDate.month,
      booking.bookingDate.day,
      booking.startTime.hour,
      booking.startTime.minute,
    );

    return upcoming
        ? bookingDateTime.isAfter(now)
        : !bookingDateTime.isAfter(now);
  }).toList();

  filteredBookings.sort((a, b) {
    final dateA = DateTime(
      a.bookingDate.year,
      a.bookingDate.month,
      a.bookingDate.day,
      a.startTime.hour,
      a.startTime.minute,
    );

    final dateB = DateTime(
      b.bookingDate.year,
      b.bookingDate.month,
      b.bookingDate.day,
      b.startTime.hour,
      b.startTime.minute,
    );

    return upcoming ? dateA.compareTo(dateB) : dateB.compareTo(dateA);
  });

  return filteredBookings;
}
