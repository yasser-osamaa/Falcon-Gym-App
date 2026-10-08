import 'package:flutter/material.dart';

class SportScheduleEntity {
  final int sportId;
  final String dayOfWeek;
  final TimeOfDay opensAt;
  final TimeOfDay closesAt;

  SportScheduleEntity({
    required this.sportId,
    required this.dayOfWeek,
    required this.opensAt,
    required this.closesAt,
  });
}
