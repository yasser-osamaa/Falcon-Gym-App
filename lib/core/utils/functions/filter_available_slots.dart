import 'package:flutter/material.dart';
import 'package:falcon_gym/features/bookings_history/domain/entities/booking_entity.dart';

List<TimeOfDay> filterAvailableSlots({
  required List<TimeOfDay> times,
  required List<BookingEntity> bookings,
  required DateTime selectedDate,
  required int duration,
}) {
  return times.where((time) {
    final slotStart = DateTime(
      selectedDate.year,
      selectedDate.month,
      selectedDate.day,
      time.hour,
      time.minute,
    );

    final slotEnd = slotStart.add(Duration(minutes: duration));

    final isBooked = bookings.any((booking) {
      final bookingStart = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        booking.startTime.hour,
        booking.startTime.minute,
      );

      final bookingEnd = DateTime(
        selectedDate.year,
        selectedDate.month,
        selectedDate.day,
        booking.endTime.hour,
        booking.endTime.minute,
      );

      return slotStart.isBefore(bookingEnd) && slotEnd.isAfter(bookingStart);
    });

    return !isBooked;
  }).toList();
}
