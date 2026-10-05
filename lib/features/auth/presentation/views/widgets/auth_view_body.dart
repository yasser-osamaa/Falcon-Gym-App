import 'package:falcon_gym/constants.dart';
import 'package:falcon_gym/core/utils/app_router.dart';
import 'package:falcon_gym/core/utils/functions/snackbars_type.dart';
import 'package:falcon_gym/core/utils/functions/validation.dart';
import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/auth_toggle.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/welcome_falcon_row.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AuthViewBody extends StatefulWidget {
  const AuthViewBody({super.key, required this.onModeChanged});
  final ValueChanged<bool> onModeChanged;

  @override
  State<AuthViewBody> createState() => _AuthViewBodyState();
}

class _AuthViewBodyState extends State<AuthViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String email = '';
  String pass = '';

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccess) {
          context.go(AppRouter.kHomeView);
        }
        if (state is AuthFailure) {
          showErrorSnackBar(context, state.error);
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                WelcomeFalconRow(),
                const SizedBox(height: 26),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: const Color(0xFFE7EBE9)),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0x0D202E34),
                        blurRadius: 24,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AuthToggle(
                        onChanged: widget.onModeChanged,
                        isCreateAccountSelected: false,
                      ),
                      const SizedBox(height: 20),
                      AuthTextField(
                        label: 'Email address',
                        hintText: 'you@example.com',
                        validator: emailValidator,
                        onSaved: (p0) {
                          if (p0 != null) email = p0;
                        },
                      ),
                      const SizedBox(height: 12),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Password',
                            style: Styless.textStyle15.copyWith(
                              color: kPrimaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.zero,
                              minimumSize: Size.zero,
                              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                            ),
                            child: Text(
                              'Forgot password?',
                              style: Styless.textStyle12.copyWith(
                                color: const Color(0xFFAA612F),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 7),
                      AuthTextField(
                        label: '',
                        hintText: 'Enter your password',
                        obscureText: true,
                        validator: passwordValidator,
                        onSaved: (p0) {
                          if (p0 != null) pass = p0;
                        },
                      ),
                      const SizedBox(height: 14),
                      CustomAuthButton(
                        isLoading: (state is AuthLoading),
                        onTap: (state is AuthLoading)
                            ? null
                            : () async {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();

                                  await context.read<AuthCubit>().signIn(
                                    email: email,
                                    password: pass,
                                  );
                                }
                              },
                      ),
                      const SizedBox(height: 12),
                      Center(
                        child: Text(
                          'Secure access for Falcon Gym members.',
                          style: Styless.textStyle12.copyWith(
                            color: const Color(0xFF929DA1),
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
