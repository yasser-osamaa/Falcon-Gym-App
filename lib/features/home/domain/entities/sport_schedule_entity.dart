import 'package:flutter/material.dart';

class SportScheduleEntity {
  final int sportId;
  final String datOfWeek;
  final TimeOfDay opensAt;
  final TimeOfDay closesAt;

  SportScheduleEntity({
    required this.sportId,
    required this.datOfWeek,
    required this.opensAt,
    required this.closesAt,
  });
}
