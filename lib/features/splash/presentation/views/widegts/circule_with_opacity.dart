import 'package:flutter/material.dart';

class CirculeWithOpacity extends StatelessWidget {
  const CirculeWithOpacity({
    super.key,
    required this.width,
    required this.height,
  });
  final double width;
  final double height;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: Colors.white.withValues(alpha: 0.15)),
      ),
    );
  }
}
