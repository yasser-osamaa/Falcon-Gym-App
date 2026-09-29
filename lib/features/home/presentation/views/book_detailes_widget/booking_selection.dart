import 'package:flutter/material.dart';

import 'booking_date_section.dart';
import 'booking_header.dart';
import 'booking_summary_footer.dart';
import 'booking_time_section.dart';

class BookingSelection extends StatefulWidget {
  const BookingSelection({super.key});

  @override
  State<BookingSelection> createState() => _BookingSelectionState();
}

class _BookingSelectionState extends State<BookingSelection> {
  String _selectedDate = 'Sat 26';
  String _selectedTime = '7:00 PM';

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: const Color(0xfff7f8f8),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 620),
          child: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  physics: const BouncingScrollPhysics(),
                  slivers: [
                    SliverToBoxAdapter(child: BookingHeader()),
                    SliverPadding(
                      padding: const EdgeInsets.fromLTRB(28, 18, 28, 24),
                      sliver: SliverToBoxAdapter(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Enjoy a private, well-maintained court with quality equipment and everything ready for your game.',
                              style: TextStyle(
                                color: Color(0xff657178),
                                fontSize: 12,
                                height: 1.55,
                              ),
                            ),
                            const SizedBox(height: 26),
                            BookingDateSection(
                              onDateSelected: (date) =>
                                  setState(() => _selectedDate = date),
                            ),
                            const SizedBox(height: 28),
                            BookingTimeSection(
                              onTimeSelected: (time) =>
                                  setState(() => _selectedTime = time),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              BookingSummaryFooter(
                dateLabel: _selectedDate,
                selectedTime: _selectedTime,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
