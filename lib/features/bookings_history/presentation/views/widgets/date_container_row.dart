import 'package:falcon_gym/features/bookings_history/presentation/views/widgets/date_container.dart';
import 'package:flutter/material.dart';

class DateContainerRow extends StatelessWidget {
  const DateContainerRow({super.key});

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
            date: 'Sat 26 Apr',
          ),
        ),
        SizedBox(width: 10),
        Expanded(
          child: DateContainer(
            color: Colors.grey.shade200,
            icon: Icons.share_arrival_time,
            title: 'Time',
            date: '07:00 Pm',
          ),
        ),
      ],
    );
  }
}
