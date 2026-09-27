import 'package:flutter/material.dart';

class CirculeWithLatter extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white24),
      ),
      child: const Center(
        child: Text(
          'F',
          style: TextStyle(
            color: Color(0xffD2B48A),
            fontSize: 34,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
