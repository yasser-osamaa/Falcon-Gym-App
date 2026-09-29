import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class TextsHeaderColumn extends StatelessWidget {
  const TextsHeaderColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'COURT SPORT',
          style: Styless.textStyle12.copyWith(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            letterSpacing: 1,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          'Padel',
          style: Styless.textStyle30.copyWith(
            fontSize: 30,
            fontStyle: FontStyle.normal,
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 6),
        Text(
          'EGP 300 / hour',
          style: Styless.textStyle12.copyWith(color: Colors.white),
        ),
      ],
    );
  }
}
