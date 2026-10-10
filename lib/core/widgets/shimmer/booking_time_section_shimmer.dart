import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookingTimeSectionShimmer extends StatelessWidget {
  const BookingTimeSectionShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: const Color(0xffe6e9ea),
      highlightColor: const Color(0xfff5f6f6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section title
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildPlaceholder(width: 115, height: 16),
              _buildPlaceholder(width: 75, height: 13),
            ],
          ),
          const SizedBox(height: 14),

          // Available time slots
          LayoutBuilder(
            builder: (context, constraints) {
              final itemWidth = (constraints.maxWidth - 16) / 3;

              return Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(
                  9,
                  (index) => Container(
                    width: itemWidth,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(11),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildPlaceholder({required double width, required double height}) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}
