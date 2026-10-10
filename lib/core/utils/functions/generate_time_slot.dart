import 'package:flutter/material.dart';

List<TimeOfDay> generateTimeSlots({
  required TimeOfDay opensAt,
  required TimeOfDay closesAt,
  required int duration,
}) {
  final List<TimeOfDay> times = [];

  var currentMinutes = opensAt.hour * 60 + opensAt.minute;

  final closingMinutes = closesAt.hour * 60 + closesAt.minute;

  while (currentMinutes + duration <= closingMinutes) {
    times.add(
      TimeOfDay(hour: currentMinutes ~/ 60, minute: currentMinutes % 60),
    );

    currentMinutes += duration;
  }

  return times;
}
