import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class DateContainer extends StatelessWidget {
  const DateContainer({
    super.key,
    required this.color,
    required this.icon,
    required this.title,
    required this.date,
  });

  final Color color;
  final IconData icon;
  final String title;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Icon(icon, size: 24, color: Colors.black),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: Styless.textStyle12.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 4),
              Text(
                date,
                style: Styless.textStyle12.copyWith(
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
