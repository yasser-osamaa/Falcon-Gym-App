import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ProfileShimmer extends StatelessWidget {
  const ProfileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        children: [
          // Avatar
          const CircleAvatar(radius: 32, backgroundColor: Colors.white),

          const SizedBox(height: 14),

          // Name
          Container(
            height: 20,
            width: 130,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
            ),
          ),

          const SizedBox(height: 3),

          // Member type
          Container(
            height: 14,
            width: 80,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
            ),
          ),

          const SizedBox(height: 9),

          // Active member container
          Container(
            height: 65,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
          ),

          const SizedBox(height: 15),

          const Divider(color: Color(0xffEEF0F0), height: 1),

          const SizedBox(height: 13),

          // Phone
          _InfoShimmer(width: 180),

          const SizedBox(height: 12),

          // Email
          _InfoShimmer(width: 220),

          const SizedBox(height: 16),

          const Divider(color: Color(0xffEEF0F0), height: 1),
        ],
      ),
    );
  }
}

class _InfoShimmer extends StatelessWidget {
  const _InfoShimmer({required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 16,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
