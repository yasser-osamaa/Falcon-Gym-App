import 'package:falcon_gym/features/home/presentation/views/widgets/book_and_gym_row_cards.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/popular_activity_section.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/upcoimg_booiking_section.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/welcome_card.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            WelcomeCard(),
            SizedBox(height: 20),
            BookAndGymRawCards(),
            SizedBox(height: 20),
            UpComingBookingSection(),
            SizedBox(height: 20),
            PopularActivitySection(),
            SizedBox(height: 70),
          ],
        ),
      ),
    );
  }
}
