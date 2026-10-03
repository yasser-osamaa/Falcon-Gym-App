import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/profile/presentation/views/widgets/contact_support_widget.dart';
import 'package:falcon_gym/features/profile/presentation/views/widgets/question_tile.dart';
import 'package:flutter/material.dart';

class HelpViewBody extends StatelessWidget {
  const HelpViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),

          const Text(
            'How can we help?',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 8),

          Text(
            'Find answers to common questions or contact our support team.',
            style: Styless.textStyle15.copyWith(color: Colors.grey),
          ),

          const SizedBox(height: 24),

          Text(
            'Frequently Asked Questions',
            style: Styless.textStyle19.copyWith(fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 12),
          QuestionTile(
            question: 'How can I book a sport?',
            answer: 'Choose the sport you want from the Book a Sport section, select an available time, and confirm your booking.',
          ),

          QuestionTile(
            question: 'Can I cancel my booking?',
            answer: 'You can cancel your booking from the Bookings section before the scheduled time.',
          ),

          QuestionTile(
            question: 'How can I subscribe to the gym?',
            answer: 'Go to the Gym section and choose the membership that suits you.',
          ),

          QuestionTile(
            question: 'What if I have a problem with my booking?',
            answer: 'If you experience any problem, contact our support team using one of the options below.',
          ),

          const SizedBox(height: 24),

          const Text(
            'Contact Support',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 12),
          ContactSupportWidget(
            icon: Icons.email_outlined,
            title: 'Email Us',
            subtitle: 'support@falcon-gym.com',
          ),

          const SizedBox(height: 10),

          ContactSupportWidget(
            icon: Icons.phone_outlined,
            title: 'Call Us',
            subtitle: '+20 100 000 0000',
          ),

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
