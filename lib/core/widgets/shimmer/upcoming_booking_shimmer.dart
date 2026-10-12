import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class UpcomingBookingShimmer extends StatelessWidget {
  const UpcomingBookingShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        height: MediaQuery.sizeOf(context).height * .19,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 17),
              width: 5,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 17, top: 17, right: 17),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              _SkeletonLine(width: 90, height: 14),
                              const SizedBox(height: 6),
                              _SkeletonLine(width: 130, height: 11),
                            ],
                          ),
                        ),
                        _SkeletonLine(width: 62, height: 25, radius: 18),
                      ],
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        _SkeletonLine(width: 72, height: 13),
                        const Spacer(),
                        _SkeletonLine(width: 72, height: 13),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Container(height: 1, color: Colors.white),
                    const Spacer(),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: _SkeletonLine(width: 110, height: 13),
                    ),
                    const SizedBox(height: 8),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SkeletonLine extends StatelessWidget {
  const _SkeletonLine({
    required this.width,
    required this.height,
    this.radius = 5,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(radius),
      ),
    );
  }
}
