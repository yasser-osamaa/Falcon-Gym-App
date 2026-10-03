import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/profile/presentation/views/widgets/build_term.dart';
import 'package:flutter/material.dart';

class TermsViewBody extends StatelessWidget {
  const TermsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          const Text(
            'Terms & Conditions',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Text(
            'Please read these terms carefully before using Falcon Gym.',
            style: Styless.textStyle16.copyWith(color: Colors.grey),
          ),
          const SizedBox(height: 28),
          BuildTerm(
            title: '1. General',
            text: 'By using Falcon Gym, you agree to follow these terms and conditions. The application provides services for gym memberships, sports bookings, and related activities.',
          ),
          BuildTerm(
            title: '2. Account',
            text: 'You are responsible for providing accurate information when creating your account and for keeping your account information secure.',
          ),
          BuildTerm(
            title: '3. Sport Bookings',
            text: 'Users must select an available time when making a booking. A booking is considered confirmed after completing the required confirmation process.',
          ),
          BuildTerm(
            title: '4. Cancellations',
            text: 'Cancellation policies may apply to sport bookings and gym memberships. Please check the booking details before confirming your reservation.',
          ),
          BuildTerm(
            title: '5. Gym Membership',
            text: 'Gym memberships are subject to the available membership plans and their respective terms. Membership benefits may differ depending on the selected plan.',
          ),
          BuildTerm(
            title: '6. User Responsibilities',
            text: 'Users are expected to follow gym rules, respect other members, and use the facilities and equipment responsibly.',
          ),
          BuildTerm(
            title: '7. Changes to These Terms',
            text: 'Falcon Gym may update these terms and conditions when necessary. Any changes will be reflected in the application.',
          ),
          BuildTerm(
            title: '8. Contact Us',
            text: 'If you have any questions regarding these terms, please contact the Falcon Gym support team.',
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
