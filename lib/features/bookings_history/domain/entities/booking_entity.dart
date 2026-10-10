import 'package:flutter/material.dart';

class BookingEntity {
  final String id;
  final String userId;
  final int sportId;
  final DateTime bookingDate;
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String status;

  BookingEntity({
    required this.id,
    required this.userId,
    required this.sportId,
    required this.bookingDate,
    required this.startTime,
    required this.endTime,
    required this.status,
  });
}
