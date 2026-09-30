import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class ActiveMemberContainer extends StatelessWidget {
  const ActiveMemberContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xffE4F1EC),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'ACTIVE MEMBERSHIP',
        style: Styless.textStyle12.copyWith(
          color: const Color(0xff397A67),
          fontSize: 10,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.6,
        ),
      ),
    );
  }
}
