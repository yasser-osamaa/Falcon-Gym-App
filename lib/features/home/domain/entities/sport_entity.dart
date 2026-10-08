class SportEntity {
  final int id;
  final String name;
  final int pricePerHour;
  final int duration;
  final String imageUrl;
  final String color;
  final bool isActive;

  SportEntity({
    required this.id,
    required this.name,
    required this.pricePerHour,
    required this.duration,
    required this.imageUrl,
    required this.color,
    required this.isActive,
  });
}
