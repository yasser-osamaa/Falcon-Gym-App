import 'package:falcon_gym/features/auth/domain/entities/user_entity.dart';
import 'package:falcon_gym/features/auth/domain/repos/auth_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepo}) : super(AuthInitial());

  final AuthRepo authRepo;

  Future<void> signIn({required String email, required String password}) async {
    emit(AuthLoading());

    final user = await authRepo.signInUser(email: email, password: password);
    user.fold(
      (error) {
        emit(AuthFailure(error: error.error));
      },
      (userEntity) {
        emit(AuthSuccess(userEntity: userEntity));
      },
    );
  }

  Future<void> register({
    required String email,
    required String password,
    required String name,
    String? phone,
    required String type,
  }) async {
    emit(AuthLoading());

    final user = await authRepo.registerNewUser(
      email: email,
      password: password,
      name: name,
      type: type,
      phone: phone,
    );
    user.fold(
      (error) {
        emit(AuthFailure(error: error.error));
      },
      (userEntity) {
        emit(AuthSuccess(userEntity: userEntity));
      },
    );
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
    final user = await authRepo.fetchUserData();
    user.fold(
      (error) {
        emit(AuthFailure(error: error.error));
      },
      (userEntity) {
        emit(AuthSuccess(userEntity: userEntity));
      },
    );
  }
}
