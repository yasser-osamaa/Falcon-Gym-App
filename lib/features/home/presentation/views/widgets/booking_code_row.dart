import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class BookingCodeRow extends StatelessWidget {
  const BookingCodeRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Booking code FG-48291',
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
