import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class HeadingTextsSection extends StatelessWidget {
  const HeadingTextsSection({
    super.key,
    required this.eyebrow,
    required this.title,
    this.trailing,
  });

  final String eyebrow;
  final String title;
  final String? trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eyebrow,
                style: const TextStyle(
                  color: Color(0xFFB36E36),
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.8,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                title,
                style: Styless.textStyle16.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
        if (trailing != null)
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
            decoration: BoxDecoration(
              color: const Color(0xFFE8F0ED),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              trailing!,
              style: const TextStyle(fontSize: 10, color: Color(0xFF41675E)),
            ),
          ),
      ],
    );
  }
}
