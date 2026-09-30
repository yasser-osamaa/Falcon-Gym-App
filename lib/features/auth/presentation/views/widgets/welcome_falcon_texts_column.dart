import 'package:falcon_gym/constants.dart';
import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class WelcomeFalconTextsColumn extends StatelessWidget {
  const WelcomeFalconTextsColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'FALCON GYM',
          style: Styless.textStyle12.copyWith(
            color: const Color(0xFFB66B35),
            fontSize: 9,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          'Welcome back',
          style: Styless.textStyle24.copyWith(
            color: kPrimaryColor,
            fontSize: 21,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          'Sign in to manage your bookings and membership.',
          style: Styless.textStyle12.copyWith(
            color: const Color(0xFF77838A),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
