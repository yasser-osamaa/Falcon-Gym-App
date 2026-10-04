import 'package:falcon_gym/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<UserEntity> signInUser({
    required String email,
    required String password,
  });

  Future<UserEntity> registreNewUser({
    required String email,
    required String password,
    required String name,
    String? phone,
    required String type,
  });

  Future<void> logOutUser();
}
