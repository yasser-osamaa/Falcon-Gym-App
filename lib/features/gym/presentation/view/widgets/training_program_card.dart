import 'package:falcon_gym/constants.dart';
import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class TrainingProgramCard extends StatelessWidget {
  const TrainingProgramCard({
    super.key,
    required this.number,
    required this.title,
    required this.detail,
    required this.duration,
    required this.accentColor,
    this.onTap,
  });

  final String number;
  final String title;
  final String detail;
  final String duration;
  final Color accentColor;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 75,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: const Color(0xFFE7E9E8)),
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: accentColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(number, style: Styless.textStyle15),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Styless.textStyle15.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    detail,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(color: kMutedColor, fontSize: 13),
                  ),
                ],
              ),
            ),
            Icon(Icons.access_time, color: kMutedColor, size: 15),
            const SizedBox(width: 5),
            Text(duration, style: TextStyle(color: kMutedColor, fontSize: 13)),
          ],
        ),
      ),
    );
  }
}
