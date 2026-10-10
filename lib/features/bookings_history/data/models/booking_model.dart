import 'package:falcon_gym/features/bookings_history/domain/entities/booking_entity.dart';
import 'package:flutter/material.dart';

class BookingModel extends BookingEntity {
  BookingModel({
    required super.id,
    required super.userId,
    required super.sportId,
    required super.bookingDate,
    required super.startTime,
    required super.endTime,
    required super.status,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) {
    return BookingModel(
      id: json['id'],
      userId: json['user_id'],
      sportId: json['sport_id'],
      bookingDate: DateTime.parse(json['booking_date']),
      startTime: parseTime(json['start_time']),
      endTime: parseTime(json['end_time']),
      status: json['status'],
    );
  }

  static TimeOfDay parseTime(String value) {
    final parts = value.split(':');

    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }
}
