import 'package:falcon_gym/features/home/presentation/views/widgets/welcome_card.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(children: [WelcomeCard()]),
    );
  }
}
