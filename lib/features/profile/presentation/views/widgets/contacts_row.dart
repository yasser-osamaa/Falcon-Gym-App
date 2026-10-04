import 'package:falcon_gym/core/utils/styless.dart';
import 'package:flutter/material.dart';

class ContactsRow extends StatelessWidget {
  const ContactsRow({super.key, required this.phone, required this.email});
  final String phone;
  final String email;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(Icons.phone_outlined, size: 18, color: Color(0xff657277)),
        const SizedBox(width: 7),
        Text(
          '+2$phone',
          style: Styless.textStyle12.copyWith(
            color: const Color(0xff718087),
            fontSize: 12,
          ),
        ),
        const SizedBox(width: 23),
        const Icon(Icons.mail_outline, size: 18, color: Color(0xff657277)),
        const SizedBox(width: 7),
        Text(
          email,
          style: Styless.textStyle12.copyWith(
            color: const Color(0xff718087),
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
