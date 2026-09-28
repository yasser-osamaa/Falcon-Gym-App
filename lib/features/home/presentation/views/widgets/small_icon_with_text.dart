import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class SmallIconWithText extends StatelessWidget {
  const SmallIconWithText({super.key, required this.text, required this.icon});
  final String text;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(width: 7),
        Text(
          text,
          style: Styless.textStyle12.copyWith(color: Color(0xff657178)),
        ),
      ],
    );
  }
}
