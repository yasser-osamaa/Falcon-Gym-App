import 'package:dartz/dartz.dart';
import 'package:falcon_gym/core/errors/failure.dart';
import 'package:falcon_gym/features/auth/domain/entities/user_entity.dart';

abstract class AuthRepo {
  Future<Either<Failure, UserEntity>> signInUser({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> registerNewUser({
    required String email,
    required String password,
    required String name,
    String? phone,
    required String type,
  });

  Future<void> logOutUser();

  Future<Either<Failure, UserEntity>> fetchUserData();
}
