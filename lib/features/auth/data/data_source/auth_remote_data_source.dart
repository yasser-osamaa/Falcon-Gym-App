import 'package:falcon_gym/features/auth/data/models/user_model.dart';
import 'package:falcon_gym/features/auth/domain/entities/user_entity.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract class AuthRemoteDataSource {
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

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final supaBase = Supabase.instance.client;
  @override
  Future<void> logOutUser() async {
    await supaBase.auth.signOut();
  }

  @override
  Future<UserEntity> registreNewUser({
    required String email,
    required String password,
    required String name,
    String? phone,
    required String type,
  }) async {
    final response = await supaBase.auth.signUp(
      email: email,
      password: password,
    );

    final user = response.user;

    if (user == null) {
      throw Exception('User not found');
    }

    await supaBase.from('profile').insert({
      'id': user.id,
      "email": email,
      'name': name,
      'phone': phone,
      'type': type,
    });

    final profile = await supaBase
        .from('profile')
        .select()
        .eq('id', user.id)
        .single();
    return UserModel.fromJson(profile).toEntity();
  }

  @override
  Future<UserEntity> signInUser({
    required String email,
    required String password,
  }) async {
    final response = await supaBase.auth.signInWithPassword(
      email: email,
      password: password,
    );
    final user = response.user;

    if (user == null) {
      throw Exception('User not found');
    }

    final profile = await supaBase
        .from('profile')
        .select()
        .eq('id', user.id)
        .single();

    return UserModel.fromJson(profile).toEntity();
  }
}
