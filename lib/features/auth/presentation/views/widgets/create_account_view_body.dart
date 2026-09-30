import 'package:falcon_gym/features/auth/presentation/views/widgets/member_category_section.dart';
import 'package:flutter/material.dart';
import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/auth_toggle.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/auth_text_field.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/custom_auth_button.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/welcome_falcon_row.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({super.key, required this.onModeChanged});

  final ValueChanged<bool> onModeChanged;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(24, 28, 24, 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WelcomeFalconRow(
            title: 'Join the club',
            subtitle: 'Create your account and choose your member category.',
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
                  onChanged: onModeChanged,
                ),
                const SizedBox(height: 16),
                const AuthTextField(
                  label: 'Full name',
                  hintText: 'Enter your full name',
                  fieldHeight: 60,
                  labelFontSize: 15,
                ),
                const SizedBox(height: 8),
                const AuthTextField(
                  label: 'Email address',
                  hintText: 'you@example.com',
                  fieldHeight: 60,
                  labelFontSize: 15,
                ),
                const SizedBox(height: 8),
                const AuthTextField(
                  label: 'Phone number',
                  hintText: '+20 100 000 0000',
                  fieldHeight: 60,
                  labelFontSize: 15,
                ),
                const SizedBox(height: 8),
                const AuthTextField(
                  label: 'Password',
                  hintText: 'At least 8 characters',
                  obscureText: true,
                  fieldHeight: 60,
                  labelFontSize: 15,
                ),
                const SizedBox(height: 12),
                MemberCategorySection(),
                const SizedBox(height: 14),
                const CustomAuthButton(label: 'Create my account'),
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
    );
  }
}
