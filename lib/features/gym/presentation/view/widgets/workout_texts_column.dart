import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class WorkOutTextColumn extends StatelessWidget {
  const WorkOutTextColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const Text(
          'STRENGTH · ALL LEVELS',
          style: TextStyle(
            color: Color(0xFFE3C89F),
            fontSize: 12,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          'Fat Burning Cardio Workout',
          style: Styless.textStyle19.copyWith(color: Colors.white),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Icon(Icons.access_time, color: Colors.white70, size: 13),
            SizedBox(width: 6),
            Text(
              '20 min · 5 exercises',
              style: Styless.textStyle12.copyWith(color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
