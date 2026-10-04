import 'package:falcon_gym/core/utils/app_router.dart';
import 'package:falcon_gym/core/utils/functions/snackbars_type.dart';
import 'package:falcon_gym/core/utils/functions/validation.dart';
import 'package:falcon_gym/features/auth/presentation/manager/auth_cubit/auth_cubit.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/member_category_section.dart';
import 'package:flutter/material.dart';
import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/auth_toggle.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/welcome_falcon_row.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({super.key, required this.onModeChanged});

  final ValueChanged<bool> onModeChanged;

  @override
  State<CreateAccountView> createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String email = '';
  String pass = '';
  String name = '';
  String phone = '';
  String type = 'Civilian';

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
                const WelcomeFalconRow(
                  title: 'Join the club',
                  subtitle:
                      'Create your account and choose your member category.',
                ),
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
                        isCreateAccountSelected: true,
                        onChanged: widget.onModeChanged,
                      ),
                      const SizedBox(height: 16),
                      AuthTextField(
                        label: 'Full name',
                        hintText: 'Enter your full name',
                        fieldHeight: 60,
                        labelFontSize: 15,
                        validator: nameValidator,
                        onSaved: (value) {
                          if (value != null) name = value;
                        },
                      ),
                      const SizedBox(height: 8),
                      AuthTextField(
                        label: 'Email address',
                        hintText: 'you@example.com',
                        fieldHeight: 60,
                        labelFontSize: 15,
                        validator: emailValidator,
                        onSaved: (value) {
                          if (value != null) email = value;
                        },
                      ),
                      const SizedBox(height: 8),
                      AuthTextField(
                        label: 'Phone number',
                        hintText: '+20 100 000 0000',
                        fieldHeight: 60,
                        labelFontSize: 15,
                        validator: phoneValidator,
                        onSaved: (value) {
                          if (value != null) phone = value;
                        },
                      ),
                      const SizedBox(height: 8),
                      AuthTextField(
                        label: 'Password',
                        hintText: 'At least 6 characters',
                        obscureText: true,
                        fieldHeight: 60,
                        labelFontSize: 15,
                        validator: passwordValidator,
                        onSaved: (value) {
                          if (value != null) pass = value;
                        },
                      ),
                      const SizedBox(height: 12),
                      MemberCategorySection(
                        memberType: type,
                        onChanged: (value) {
                          type = value;
                        },
                      ),
                      const SizedBox(height: 14),
                      CustomAuthButton(
                        label: 'Create my account',
                        onTap: (state is AuthLoading)
                            ? null
                            : () async {
                                if (formKey.currentState!.validate()) {
                                  formKey.currentState!.save();

                                  await context.read<AuthCubit>().register(
                                    email: email,
                                    password: pass,
                                    name: name,
                                    phone: phone,
                                    type: type,
                                  );
                                }
                              },
                      ),
                      const SizedBox(height: 10),
                      Center(
                        child: Text(
                          "By creating an account, you agree to Falcon Gym's terms and privacy policy.",
                          textAlign: TextAlign.center,
                          style: Styless.textStyle12.copyWith(
                            color: const Color(0xFF929DA1),
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
