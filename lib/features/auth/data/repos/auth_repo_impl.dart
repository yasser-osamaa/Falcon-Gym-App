import 'package:dartz/dartz.dart';
import 'package:falcon_gym/core/errors/failure.dart';
import 'package:falcon_gym/core/errors/supabase_failure.dart';
import 'package:falcon_gym/features/auth/data/data_source/auth_remote_data_source.dart';
import 'package:falcon_gym/features/auth/domain/entities/user_entity.dart';
import 'package:falcon_gym/features/auth/domain/repos/auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthRemoteDataSource authRemoteDataSource;

  AuthRepoImpl({required this.authRemoteDataSource});
  @override
  Future<void> logOutUser() {
    return authRemoteDataSource.logOutUser();
  }

  @override
  Future<Either<Failure, UserEntity>> registerNewUser({
    required String email,
    required String password,
    required String name,
    String? phone,
    required String type,
  }) async {
    try {
      final user = await authRemoteDataSource.registreNewUser(
        email: email,
        password: password,
        name: name,
        type: type,
        phone: phone,
      );
      return right(user);
    } catch (e) {
      return left(SupabaseFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInUser({
    required String email,
    required String password,
  }) async {
    try {
      final user = await authRemoteDataSource.signInUser(
        email: email,
        password: password,
      );
      return right(user);
    } catch (e) {
      return left(SupabaseFailure.fromException(e));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> fetchUserData() async {
    try {
      final user = await authRemoteDataSource.fetchUserData();
      return right(user);
    } catch (e) {
      return left(SupabaseFailure.fromException(e));
    }
  }
}
