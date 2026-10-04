import 'package:falcon_gym/core/utils/functions/trim_names.dart';
import 'package:flutter/material.dart';

class NameCircleAvatar extends StatelessWidget {
  const NameCircleAvatar({super.key, required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 32,
      backgroundColor: Color(0xffDDE2E3),
      child: Text(
        getInitials(name),
        style: TextStyle(
          color: Color(0xff172126),
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
