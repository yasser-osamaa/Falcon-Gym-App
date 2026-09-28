import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class ContainerTextWithBorderSide extends StatelessWidget {
  const ContainerTextWithBorderSide({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black.withValues(alpha: .1),
          width: 1.5,
        ),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        'Book',
        style: Styless.textStyle12.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
