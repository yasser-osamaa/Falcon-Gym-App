import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class WelcomeCoulmnTexts extends StatelessWidget {
  const WelcomeCoulmnTexts({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20),

          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Text(
              'Welcome To',
              style: Styless.textStyle12.copyWith(fontWeight: FontWeight.w700),
            ),
          ),
          SizedBox(height: 5),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Text('Falcon Gym ', style: Styless.textStyle30),
          ),
          SizedBox(height: 10),
          Align(
            alignment: AlignmentGeometry.centerLeft,
            child: Text('Your sports. Your time. ', style: Styless.textStyle12),
          ),
        ],
      ),
    );
  }
}
