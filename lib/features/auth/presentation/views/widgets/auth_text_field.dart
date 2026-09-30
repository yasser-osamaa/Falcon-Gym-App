import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
  });

  final String label;
  final String hintText;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (label.isNotEmpty) ...[
          Text(
            label,
            style: Styless.textStyle15.copyWith(
              color: const Color(0xFF202E34),
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 7),
        ],
        SizedBox(
          height: 70,
          child: TextField(
            obscureText: obscureText,
            style: Styless.textStyle15.copyWith(color: const Color(0xFF202E34)),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Styless.textStyle12.copyWith(
                color: const Color(0xFF9AA4A8),
              ),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 18,
              ),
              filled: true,
              fillColor: const Color(0xFFFBFCFB),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFFE2E7E5)),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Color(0xFF879398)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
