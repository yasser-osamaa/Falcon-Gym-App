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
  Future<UserEntity> registerNewUser({
    required String email,
    required String password,
    required String name,
    String? phone,
    required String type,
  }) {
    return authRemoteDataSource.registreNewUser(
      email: email,
      password: password,
      name: name,
      type: type,
      phone: phone,
    );
  }

  @override
  Future<UserEntity> signInUser({
    required String email,
    required String password,
  }) {
    return authRemoteDataSource.signInUser(email: email, password: password);
  }

  @override
  Future<UserEntity> fetchUserData() {
    return authRemoteDataSource.fetchUserData();
  }
}
