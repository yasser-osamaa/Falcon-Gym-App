import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class ConfirmationBookingButton extends StatelessWidget {
  const ConfirmationBookingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: FilledButton(
        style: FilledButton.styleFrom(
          backgroundColor: const Color(0xff202e35),
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Confirm Booking',
              style: Styless.textStyle12.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 12),
            const Icon(Icons.chevron_right, size: 20),
          ],
        ),
      ),
    );
  }
}
