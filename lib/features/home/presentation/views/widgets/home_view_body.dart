import 'package:falcon_gym/core/utils/styless.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/book_and_gym_row_cards.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/upcoing_sport_card.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/welcome_card.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          WelcomeCard(),
          SizedBox(height: 20),
          BookAndGymRawCards(),
          SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Upcoming Booking', style: Styless.textStyle16),
              Text(
                'See All',
                style: Styless.textStyle12.copyWith(
                  color: Color(0xff9A713E),
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),

          SizedBox(height: 20),

          UpComingSportCard(),
        ],
      ),
    );
  }
}
