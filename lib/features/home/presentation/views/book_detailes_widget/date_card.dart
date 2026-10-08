import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class DateCard extends StatelessWidget {
  const new({
    super.key,
    required this.selected,
    required this.day,
    required this.date,
    required this.foregroundColor,
  });

  final bool selected;
  final String day;
  final String date;
  final Color foregroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(11),
        border: Border.all(
          color: selected ? const Color(0xff202e35) : const Color(0xffe2e6e7),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            day,
            style: Styless.textStyle12.copyWith(
              color: selected ? Colors.white70 : const Color(0xff778187),
              fontWeight: FontWeight.w500,
            ),
          ),
          if (date.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              date,
              style: Styless.textStyle12.copyWith(
                color: foregroundColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ],
      ),
    );
  }
}
