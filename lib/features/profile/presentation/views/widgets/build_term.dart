import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class BuildTerm extends StatelessWidget {
  const BuildTerm({super.key, required this.title, required this.text});
  final String title;
  final String text;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Styless.textStyle19.copyWith(fontWeight: FontWeight.w700),
          ),
          const SizedBox(height: 8),
          Text(text, style: Styless.textStyle16.copyWith(color: Colors.grey)),
        ],
      ),
    );
  }
}
