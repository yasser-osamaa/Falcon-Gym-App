import 'package:falcon_gym/features/home/domain/entities/sport_entity.dart';

class SportModel extends SportEntity {
  SportModel({
    required super.id,
    required super.name,
    required super.pricePerHour,
    required super.duration,
    required super.imageUrl,
    required super.color,
    required super.isActive,
  });

  factory SportModel.fromJson(Map<String, dynamic> json) {
    return SportModel(
      id: json['id'],
      name: json['name'],
      pricePerHour: json['price_per_hour'],
      duration: json['duration'],
      imageUrl: json['image_url'],
      color: json['color'],
      isActive: json['is_active'],
    );
  }
}
