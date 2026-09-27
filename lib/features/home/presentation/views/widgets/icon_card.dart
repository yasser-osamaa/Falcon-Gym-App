import 'package:flutter/material.dart';

class IconCard extends StatelessWidget {
  const IconCard({
    super.key,
    required this.icon,
    this.width = 44,
    this.height = 44,
    this.raduis = 14,
    required this.iconSize,
  });
  final IconData icon;
  final double width;
  final double height;
  final double raduis;
  final double iconSize;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(raduis),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.12),
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(child: Icon(icon, size: iconSize)),
    );
  }
}
