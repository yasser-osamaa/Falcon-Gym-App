import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/icon_card.dart';
import 'package:flutter/material.dart';

class NoUpcomingBookings extends StatelessWidget {
  const NoUpcomingBookings({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 50),
        IconCard(
          icon: Icons.calendar_month,
          iconSize: 26,
          cardColor: Color(0xffE8ECEC),
          raduis: 40,
          width: 61,
          height: 61,
        ),
        SizedBox(height: 30),
        Text('No Past bookings', style: Styless.textStyle16),
        SizedBox(height: 10),
        Text(
          'You don\'t have any Past reservations.',
          style: Styless.textStyle12.copyWith(
            color: Color(0xff828C91),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
