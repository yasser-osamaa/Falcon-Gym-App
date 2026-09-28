import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/upcoing_sport_card.dart';
import 'package:flutter/material.dart';

class UpComingBookingSection extends StatelessWidget {
  const UpComingBookingSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Upcoming Booking', style: Styless.textStyle16),
            Text(
              'See All',
              style: Styless.textStyle12.copyWith(
                color: Color(0xff9A713E),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),

        SizedBox(height: 20),

        UpComingSportCard(),
      ],
    );
  }
}
