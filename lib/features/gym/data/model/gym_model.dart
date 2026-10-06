import 'package:falcon_gym/features/gym/domain/entities/gym_exercises_entity.dart';

class GymModel extends GymExercisesEntity {
  GymModel({
    required super.id,
    required super.categoryId,
    required super.name,
    required super.description,
    required super.imageUrl,
    required super.sets,
    required super.reps,
  });

  factory GymModel.fromJson(Map<String, dynamic> json) {
    return GymModel(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      description: json['description'],
      imageUrl: json['image_url'],
      sets: json['sets'],
      reps: json['reps'],
    );
  }
}
