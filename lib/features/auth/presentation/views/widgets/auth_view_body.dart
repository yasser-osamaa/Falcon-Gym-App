import 'package:falcon_gym/constants.dart';
import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/auth_mode_toggle.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/welcome_falcon_row.dart';
import 'package:flutter/material.dart';

class AuthViewBody extends StatelessWidget {
  const AuthViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
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
                const AuthModeToggle(),
                const SizedBox(height: 20),
                const AuthTextField(
                  label: 'Email address',
                  hintText: 'you@example.com',
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
                const AuthTextField(
                  label: '',
                  hintText: 'Enter your password',
                  obscureText: true,
                ),
                const SizedBox(height: 14),
                CustomAuthButton(),
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
    );
  }
}
