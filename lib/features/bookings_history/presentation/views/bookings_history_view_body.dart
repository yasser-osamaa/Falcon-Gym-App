import 'package:falcon_gym/core/utils/styless.dart';
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
          children: [
            SizedBox(height: 20),
            Center(child: Text('My Bookings', style: Styless.textStyle19)),
            SizedBox(height: 20),
            UpcomingToggle(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
