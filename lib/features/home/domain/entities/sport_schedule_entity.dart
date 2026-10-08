import 'package:flutter/material.dart';

class SportScheduleEntity {
  final int sportId;
  final String day;
  final TimeOfDay opensAt;
  final TimeOfDay closesAt;

  SportScheduleEntity({
    required this.sportId,
    required this.day,
    required this.opensAt,
    required this.closesAt,
  });
}
