import 'package:falcon_gym/features/bookings_history/domain/entities/booking_entity.dart';
import 'package:falcon_gym/features/bookings_history/presentation/views/widgets/date_container.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateContainerRow extends StatelessWidget {
  const DateContainerRow({super.key, required this.bookingEntity});
  final BookingEntity bookingEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
          child: DateContainer(
            color: Colors.grey.shade200,
            icon: Icons.calendar_month,
            title: 'Date',
            date: DateFormat('EEE, dd MMM').format(bookingEntity.bookingDate),
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: DateContainer(
            color: Colors.grey.shade200,
            icon: Icons.share_arrival_time,
            title: 'Time',
            date: bookingEntity.startTime.format(context),
          ),
        ),
      ],
    );
  }
}
