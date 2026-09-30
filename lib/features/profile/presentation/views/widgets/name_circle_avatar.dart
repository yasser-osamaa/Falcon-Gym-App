import 'package:flutter/material.dart';

class NameCircleAvatar extends StatelessWidget {
  const NameCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return const CircleAvatar(
      radius: 32,
      backgroundColor: Color(0xffDDE2E3),
      child: Text(
        'YO',
        style: TextStyle(
          color: Color(0xff172126),
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
