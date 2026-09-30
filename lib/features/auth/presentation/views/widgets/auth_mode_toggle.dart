import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class AuthModeToggle extends StatelessWidget {
  const AuthModeToggle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 42,
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF1F0),
        borderRadius: BorderRadius.circular(11),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(9),
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x14202E34),
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Text(
                'Sign in',
                style: Styless.textStyle12.copyWith(
                  color: const Color(0xFF202E34),
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                'Create account',
                style: Styless.textStyle12.copyWith(
                  color: const Color(0xFF69757A),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
