import 'package:falcon_gym/features/auth/domain/entities/user_entity.dart';
import 'package:falcon_gym/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());

  final AuthRepo authRepo;

  Future<void> signIn({required String email, required String password}) async {
    emit(AuthLoading());
    try {
      final user = await authRepo.signInUser(email: email, password: password);
      emit(AuthSuccess(userEntity: user));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    String? phone,
    required String type,
  }) async {
    emit(AuthLoading());

    try {
      final user = await authRepo.registerNewUser(
        email: email,
        password: password,
        name: name,
        type: type,
        phone: phone,
      );
      emit(AuthSuccess(userEntity: user));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  Future<void> signout() async {
    emit(AuthLoading());

    try {
      await authRepo.logOutUser();
      emit(AuthSuccess());
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }

  Future<void> getUser() async {
    try {
      final user = await authRepo.fetchUserData();
      emit(AuthSuccess(userEntity: user));
    } catch (e) {
      emit(AuthFailure(error: e.toString()));
    }
  }
}
