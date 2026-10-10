import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/bookings_history/domain/entities/booking_entity.dart';
import 'package:flutter/material.dart';

class BookingCodeRow extends StatelessWidget {
  const BookingCodeRow({super.key, required this.bookingEntity});
  final BookingEntity bookingEntity;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Booking code ${bookingEntity.id}',
          style: Styless.textStyle12.copyWith(
            color: Color(0xff657178),
            fontWeight: FontWeight.w700,
          ),
        ),
        Text(
          'View Details',
          style: Styless.textStyle12.copyWith(
            color: Color(0xff8D6636),
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
