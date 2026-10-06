import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/bookings_history/presentation/views/widgets/history_card.dart';
import 'package:falcon_gym/features/bookings_history/presentation/views/widgets/no_upcoming_bookings.dart';
import 'package:falcon_gym/features/bookings_history/presentation/views/widgets/upcoming_toggle.dart';
import 'package:flutter/material.dart';

class BookingsHistoryViewBody extends StatefulWidget {
  const BookingsHistoryViewBody({super.key});

  @override
  State<BookingsHistoryViewBody> createState() =>
      _BookingsHistoryViewBodyState();
}

class _BookingsHistoryViewBodyState extends State<BookingsHistoryViewBody> {
  bool isUpcoming = true;

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
            UpcomingToggle(
              isUpcoming: isUpcoming,
              onChanged: (value) => setState(() => isUpcoming = value),
            ),
            SizedBox(height: 20),
            Center(
              child: isUpcoming
                  ? const HistoryCard()
                  : const NoUpcomingBookings(),
            ),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
