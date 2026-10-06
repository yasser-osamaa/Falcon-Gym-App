class GymExercisesEntity {
  final String id;
  final int categoryId;
  final String name;
  final String description;
  final String imageUrl;
  final int sets;
  final int reps;

  GymExercisesEntity({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.sets,
    required this.reps,
  });
}
