import 'package:flutter/material.dart';

bool isExpiredSlot(
  TimeOfDay time,
  DateTime now,
  bool isToday,
  DateTime selectedDate,
  int duration,
) {
  if (!isToday) {
    return false;
  }

  final slotEnd = DateTime(
    selectedDate.year,
    selectedDate.month,
    selectedDate.day,
    time.hour,
    time.minute,
  ).add(Duration(minutes: duration));

  return !slotEnd.isAfter(now);
}

bool isSameDay(DateTime a, DateTime b) {
  return a.year == b.year && a.month == b.month && a.day == b.day;
}
