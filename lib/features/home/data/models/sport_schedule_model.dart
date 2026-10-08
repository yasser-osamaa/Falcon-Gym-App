import 'package:falcon_gym/features/home/domain/entities/sport_schedule_entity.dart';
import 'package:flutter/material.dart';

class SportScheduleModel extends SportScheduleEntity {
  SportScheduleModel({
    required super.sportId,
    required super.day,
    required super.opensAt,
    required super.closesAt,
  });
  factory SportScheduleModel.fromJson(Map<String, dynamic> json) {
    return SportScheduleModel(
      sportId: json['sport_id'],
      day: json['day_of_week'],
      opensAt: parseTime(json['opens_at']),
      closesAt: parseTime(json['closes_at']),
    );
  }
  static TimeOfDay parseTime(String time) {
    final parts = time.split(':');

    return TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1]));
  }
}
