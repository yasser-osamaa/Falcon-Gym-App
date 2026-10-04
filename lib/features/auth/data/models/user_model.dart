import 'package:falcon_gym/features/auth/domain/entities/user_entity.dart';

class UserModel {
  final String id;
  final String email;
  final String name;
  final String? phone;
  final String type;

  UserModel({
    required this.id,
    required this.email,
    required this.name,
    this.phone,
    required this.type,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      phone: json['phone'],
      type: json['type'],
    );
  }

  UserEntity toEntity() {
    return UserEntity(id: id, email: email, name: name, type: type);
  }
}
