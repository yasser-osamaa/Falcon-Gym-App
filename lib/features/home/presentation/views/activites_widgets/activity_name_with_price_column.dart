import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class ActivityNameWithPriceColumn extends StatelessWidget {
  const ActivityNameWithPriceColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Padel', style: Styless.textStyle15),
        SizedBox(height: 10),
        RichText(
          text: const TextSpan(
            children: [
              TextSpan(
                text: 'EGP 300',
                style: TextStyle(
                  color: Color(0xff9A713E),
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' / hour',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
