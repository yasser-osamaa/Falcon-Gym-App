import 'package:falcon_gym/features/auth/presentation/views/widgets/auth_view_body.dart';
import 'package:flutter/material.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F7),
      body: SafeArea(child: AuthViewBody()),
    );
  }
}
