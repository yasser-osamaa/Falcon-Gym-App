import 'package:falcon_gym/constants.dart';
import 'package:flutter/material.dart';

class CategoryTextsColumn extends StatelessWidget {
  const new({
    super.key,
    required this.label,
    required this.title,
    required this.detail,
  });

  final String label;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            color: Color(0xFFB36E36),
            fontSize: 11,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.3,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 3),
        Text(
          detail,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(color: kMutedColor, fontSize: 9),
        ),
      ],
    );
  }
}
