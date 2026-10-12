import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BookingHistoryShimmer extends StatelessWidget {
  const BookingHistoryShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: ListView.separated(
        itemCount: 3,
        padding: const EdgeInsets.only(top: 10),
        separatorBuilder: (_, _) => const SizedBox(height: 10),
        itemBuilder: (context, index) => Container(
          height: MediaQuery.sizeOf(context).height * .3,
          padding: const EdgeInsets.all(18),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 150,
                height: 18,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(height: 14),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.white,
              ),
              const Spacer(),
              Container(
                width: 130,
                height: 14,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                width: double.infinity,
                height: 42,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
