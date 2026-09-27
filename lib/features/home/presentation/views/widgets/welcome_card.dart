import 'package:falcon_gym/features/home/presentation/views/widgets/falcon_gym_circule.dart';
import 'package:falcon_gym/features/home/presentation/views/widgets/welcome_column_texts.dart';
import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * .18,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        image: DecorationImage(
          image: AssetImage('assets/images/blue.webp'),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [WelcomeCoulmnTexts(), FalconGymCircule()],
        ),
      ),
    );
  }
}
