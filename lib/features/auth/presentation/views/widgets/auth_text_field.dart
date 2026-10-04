import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  const AuthTextField({
    super.key,
    required this.label,
    required this.hintText,
    this.obscureText = false,
    this.fieldHeight = 70,
    this.labelFontSize = 15,
    this.validator,
    this.onSaved,
  });

  final String label;
  final String hintText;
  final bool obscureText;
  final double fieldHeight;
  final double labelFontSize;
  final String? Function(String?)? validator;
  final void Function(String?)? onSaved;
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
              fontSize: labelFontSize,
            ),
          ),
          const SizedBox(height: 7),
        ],
        SizedBox(
          height: fieldHeight,
          child: TextFormField(
            onSaved: onSaved,
            validator: validator,
            obscureText: obscureText,
            style: Styless.textStyle15.copyWith(color: const Color(0xFF202E34)),
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: Styless.textStyle12.copyWith(
                color: const Color(0xFF9AA4A8),
              ),
              contentPadding: EdgeInsets.symmetric(
                horizontal: 18,
                vertical: fieldHeight < 70 ? 10 : 18,
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
