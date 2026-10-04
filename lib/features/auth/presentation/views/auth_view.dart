import 'package:falcon_gym/features/auth/presentation/views/widgets/auth_view_body.dart';
import 'package:falcon_gym/features/auth/presentation/views/widgets/create_account_view_body.dart';
import 'package:flutter/material.dart';

class AuthView extends StatefulWidget {
  const AuthView({super.key});

  @override
  State<AuthView> createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView> {
  bool isCreateAccountSelected = false;

  void toggleAuthMode(bool isCreateAccount) {
    setState(() {
      isCreateAccountSelected = isCreateAccount;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8F7),
      body: SafeArea(
        child: isCreateAccountSelected
            ? CreateAccountView(onModeChanged: toggleAuthMode)
            : AuthViewBody(onModeChanged: toggleAuthMode),
      ),
    );
  }
}
