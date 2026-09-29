import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/bookings_history/presentation/views/widgets/history_card.dart';
import 'package:falcon_gym/features/bookings_history/presentation/views/widgets/upcoming_toggle.dart';
import 'package:flutter/material.dart';

class BookingsHistoryViewBody extends StatelessWidget {
  const BookingsHistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Center(child: Text('My Bookings', style: Styless.textStyle19)),
            SizedBox(height: 20),
            UpcomingToggle(),
            SizedBox(height: 20),
            Text(
              'SATURDAY, 26 APRIL',
              style: Styless.textStyle12.copyWith(
                fontWeight: FontWeight.w700,
                color: Colors.black.withValues(alpha: .4),
              ),
            ),
            SizedBox(height: 15),
            HistoryCard(),
          ],
        ),
      ),
    );
  }
}
