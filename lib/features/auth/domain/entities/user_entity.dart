class UserEntity {
  final String id;
  final String email;
  final String name;
  final String? phone;
  final String type;

  const UserEntity({
    required this.id,
    required this.email,
    required this.name,
    this.phone,
    required this.type,
  });
}
