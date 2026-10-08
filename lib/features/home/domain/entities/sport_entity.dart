class SportEntity {
  final int id;
  final String name;
  final int pricePerHour;
  final int duration;
  final String imageUrl;
  final String color;

  SportEntity({
    required this.id,
    required this.name,
    required this.pricePerHour,
    required this.duration,
    required this.imageUrl,
    required this.color,
  });
}
