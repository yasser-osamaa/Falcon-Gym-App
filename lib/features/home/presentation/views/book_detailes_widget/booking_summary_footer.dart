import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/home/domain/entities/sport_entity.dart';
import 'package:falcon_gym/features/home/presentation/views/book_detailes_widget/confirmation_booking_button.dart';
import 'package:flutter/material.dart';

class BookingSummaryFooter extends StatelessWidget {
  const BookingSummaryFooter({
    required this.sportEntity,
    required this.bookingDate,
    required this.dateLabel,
    required this.selectedTime,
    super.key,
  });

  final SportEntity sportEntity;
  final DateTime bookingDate;
  final String dateLabel;
  final TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.fromLTRB(28, 12, 28, 16),
        decoration: BoxDecoration(
          color: const Color(0xfff7f8f8),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: .08),
              blurRadius: 18,
              offset: const Offset(0, -5),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${sportEntity.name} · ${sportEntity.duration} min',
                        style: Styless.textStyle12.copyWith(
                          color: const Color(0xff778187),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$dateLabel, ${selectedTime?.format(context) ?? 'Choose Time'}',
                        style: Styless.textStyle12.copyWith(
                          color: const Color(0xff202e35),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
              ],
            ),
            const SizedBox(height: 12),
            ConfirmationBookingButton(
              sportEntity: sportEntity,
              bookingDate: bookingDate,
              selectedTime: selectedTime,
            ),
          ],
        ),
      ),
    );
  }
}
