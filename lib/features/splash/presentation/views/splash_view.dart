import 'package:falcon_gym/constants.dart';
import 'package:falcon_gym/features/splash/presentation/views/widegts/splash_view_body.dart';
import 'package:flutter/material.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SplashViewBody(), backgroundColor: kPrimaryColor);
  }
}
